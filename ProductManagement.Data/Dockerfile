FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

# Copy everything
COPY . "ProductManagement.Data/"
WORKDIR /ProductManagement.Data
# Restore as distinct layers
RUN dotnet restore "ProductManagement.Data.csproj"
# Build and publish a release
RUN dotnet publish -c Release -o publish

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /publish 
ENTRYPOINT ["dotnet", "ProductManagement.Data.dll  \"${DB_CONNECTION}\""]