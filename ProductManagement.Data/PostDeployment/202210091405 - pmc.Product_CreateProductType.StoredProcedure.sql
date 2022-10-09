USE [ProductManagementCore]
GO
/****** Object:  StoredProcedure [pmc].[Product_CreateProductType]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_CreateProductType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_CreateProductType] AS' 
END
GO
ALTER PROCEDURE [pmc].[Product_CreateProductType]
 	@Types ProductTypeList READONLY
AS   
    SET NOCOUNT ON;  

	DECLARE @UpdateVariable bit

    MERGE dbo.ProductTypes AS tar
	USING @Types AS src
	ON tar.ProductType = src.ProductType
	WHEN NOT MATCHED THEN
	   INSERT (	ProductType )
	   VALUES (	src.ProductType )
	WHEN MATCHED THEN 
		--	To dummy trigger Update so that the Id is returned for the action
		UPDATE SET @UpdateVariable = 1
	OUTPUT inserted.Id;

GO