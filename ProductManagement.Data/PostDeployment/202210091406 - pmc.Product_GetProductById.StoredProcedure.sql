USE [ProductManagementCore]
GO
/****** Object:  StoredProcedure [pmc].[Product_GetProductById]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_GetProductById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_GetProductById] AS' 
END
GO
ALTER PROCEDURE [pmc].[Product_GetProductById]
 	@Id int
AS   
    SET NOCOUNT ON;  
    SELECT b.Name AS BrandName, pd.Title, pd.Description, p.Units, p.Weight, p.Uom, p.NetGBPPrice
    FROM dbo.Products p
	LEFT JOIN dbo.Brands b ON b.Id = p.BrandId
	LEFT JOIN dbo.ProductDetails pd ON pd.Id = p.ProductDetailsId
	WHERE p.Id = @Id
GO