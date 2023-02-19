/****** Object:  UserDefinedTableType [dbo].[IdList]    Script Date: 11/10/2022 20:57:01 ******/
CREATE TYPE [dbo].[IdList] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductInfoList]    Script Date: 11/10/2022 20:57:01 ******/
CREATE TYPE [dbo].[ProductInfoList] AS TABLE(
	[Title] [varchar](100) NULL,
	[Description] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductTypeList]    Script Date: 11/10/2022 20:57:01 ******/
CREATE TYPE [dbo].[ProductTypeList] AS TABLE(
	[ProductType] [varchar](100) NULL
)
GO
