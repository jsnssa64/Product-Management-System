GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

IF DATABASE_PRINCIPAL_ID('Testing_Role') IS NULL
BEGIN
	CREATE ROLE Testing_Role
END
ELSE 
BEGIN
    CREATE ROLE Other_Role
END
GO