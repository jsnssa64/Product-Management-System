GO
/****** Object:  StoredProcedure [pmc].[Product_UpdateProductsTypes]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_UpdateProductsTypes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_UpdateProductsTypes] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Product_UpdateProductsTypes]
	@ProductId INT,
	@ProductTypes IdList READONLY
AS
BEGIN
	SET NOCOUNT ON;
	MERGE dbo.Products_ProductTypes AS Target
	USING @ProductTypes AS Source
	ON Target.ProductTypeId = Source.Id
	WHEN NOT MATCHED BY Target THEN
	    INSERT ( ProductId, ProductTypeId ) 
		VALUES ( @ProductId, Source.Id )
	WHEN NOT MATCHED BY Source AND Target.ProductId = @ProductId THEN
		DELETE
	OUTPUT $action, DELETED.ProductTypeId AS SourceProductTypeId, INSERTED.ProductTypeId AS SourceProductTypeId;
END

GO