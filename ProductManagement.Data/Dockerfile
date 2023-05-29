#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["ProductManagement.Data/ProductManagement.Data.csproj", "ProductManagement.Data/"]
RUN dotnet restore "ProductManagement.Data/ProductManagement.Data.csproj"
COPY . .
WORKDIR "/src/ProductManagement.Data"
RUN dotnet build "ProductManagement.Data.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ProductManagement.Data.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ProductManagement.Data.dll"]


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

# Copy everything
COPY . "ProductManagement.Data/"
WORKDIR "/App/ProductManagement.Data"
# Restore as distinct layers
RUN dotnet restore "ProductManagement.Data.csproj"
# Build and publish a release
RUN dotnet publish -c Release -o publish

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /publish 
ENTRYPOINT ["dotnet", "ProductManagement.Data.dll  \"${DB_CONNECTION}\""]


FROM mcr.microsoft.com/dotnet/core/sdk:3.1
WORKDIR /build
COPY DbMigrator.csproj ./
RUN dotnet restore 
COPY . .
RUN dotnet publish -o /publish 
WORKDIR /publish 
CMD ["sh", "-c", "dotnet DbMigrator.dll \"${DB_CONNECTION}\""]