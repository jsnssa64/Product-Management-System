GO
/****** Object:  StoredProcedure [pmc].[Product_GetAllProducts]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_GetAllProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_GetAllProducts] AS' 
END
GO
ALTER PROCEDURE [pmc].[Product_GetAllProducts](
	@PageNumber INT,
	@ItemPerPage INT)
AS   
    SET NOCOUNT ON;  

	DECLARE @PageIndex AS INT=COALESCE(@PageNumber, 0)-1;

    SELECT p.Id, pi.Title, pi.Description, Units,b.Name, p.Weight, p.Uom, p.NetGBPPrice 
	FROM [ProductManagementCore].[dbo].[Products] as p
	LEFT JOIN [ProductManagementCore].[dbo].Brands as b 
	ON b.Id = p.BrandId
	LEFT JOIN [ProductManagementCore].[dbo].ProductInfo as pi
	ON p.ProductInfoId = pi.Id
	ORDER BY pi.Title 
	OFFSET @PageIndex*@ItemPerPage ROWS
	FETCH NEXT @ItemPerPage ROWS ONLY;

	SELECT COUNT(*) AS totalRecordCount
	FROM [ProductManagementCore].[dbo].Products;
GO