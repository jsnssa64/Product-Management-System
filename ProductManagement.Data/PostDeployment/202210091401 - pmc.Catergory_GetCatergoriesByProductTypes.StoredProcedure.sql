USE [ProductManagementCore]
GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoriesByProductTypes]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Catergory_GetCatergoriesByProductTypes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Catergory_GetCatergoriesByProductTypes] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Catergory_GetCatergoriesByProductTypes]
	@ProductTypesIds IdList READONLY
AS
BEGIN
	SET NOCOUNT ON;

    SELECT pt.ProductType, c.Name AS Catergory
	FROM Catergories_ProductTypes cpt
	LEFT JOIN Catergories c 
	ON cpt.CatergoryId = c.Id
	LEFT JOIN ProductTypes pt
	ON pt.Id = cpt.ProductTypesId
	WHERE cpt.ProductTypesId IN (SELECT * 
								FROM @ProductTypesIds);
END
GO