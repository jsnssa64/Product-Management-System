GO
/****** Object:  StoredProcedure [pmc].[Product_GetProductProductType]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_GetProductProductType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_GetProductProductType] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Product_GetProductProductType]
	@ProductId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT pt.ProductType
	FROM Product_ProductType ppt
	LEFT JOIN ProductType pt
	ON ppt.ProductTypeId = pt.Id
	WHERE ppt.ProductId = @ProductId;
END
GO