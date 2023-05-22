GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoryByProductType]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Catergory_GetCatergoryByProductType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Catergory_GetCatergoryByProductType] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Catergory_GetCatergoryByProductType]
	@ProductTypeIds IdList READONLY
AS
BEGIN
	SET NOCOUNT ON;

    SELECT pt.ProductType, c.Name AS Catergory
	FROM Catergory_ProductType cpt
	LEFT JOIN Catergory c 
	ON cpt.CatergoryId = c.Id
	LEFT JOIN ProductType pt
	ON pt.Id = cpt.ProductTypeId
	WHERE cpt.ProductTypeId IN (SELECT * 
								FROM @ProductTypeIds);
END
GO