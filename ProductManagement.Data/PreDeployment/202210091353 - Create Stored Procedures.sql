/****** Object:  Create PMC Schema ******/
CREATE SCHEMA [pmc]
GO
/****** Object:  StoredProcedure [pmc].[Brand_CreateBrand]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_CreateBrand]
	@Name VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Brands
	OUTPUT INSERTED.Id
	VALUES (@Name);
END
GO
/****** Object:  StoredProcedure [pmc].[Brand_DeleteBrand]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_DeleteBrand]
	@Name VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE 
	FROM dbo.Brands
	WHERE Name = @Name;
END
GO
/****** Object:  StoredProcedure [pmc].[Brand_GetAllBrands]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_GetAllBrands]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT b.Id, b.Name
	FROM dbo.Brands b;
END

GO
/****** Object:  StoredProcedure [pmc].[Brand_GetBrandById]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_GetBrandById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT b.Id, b.Name
	FROM dbo.Brands b
	WHERE b.Id = @Id;
END

GO
/****** Object:  StoredProcedure [pmc].[Brand_UpdateBrand]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_UpdateBrand]
	@OriginName VARCHAR(100),
	@NewName VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE b
	SET b.[Name] = @NewName
	FROM dbo.Brands b
	WHERE b.Name = @OriginName;
END

GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetAllCatergories]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Catergory_GetAllCatergories]
AS   
    SET NOCOUNT ON;  
    SELECT c.Name
    FROM [dbo].Catergories c;
GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoriesByProductTypes]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Catergory_GetCatergoriesByProductTypes]
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
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoryByName]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Catergory_GetCatergoryByName]
	@Name varchar(100)
AS   
    SET NOCOUNT ON;  
    SELECT c.Name
    FROM dbo.Catergories c
	WHERE c.Name = @Name;
GO
/****** Object:  StoredProcedure [pmc].[Product_CreateProduct]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Product_CreateProduct]
	@Units INT,
	@BrandName varchar(100),
	@InfoTitle varchar(100),
	@InfoDescription varchar(100),
	@ProductTypes dbo.ProductTypeList READONLY,
	@Weight int,
	@Uom varchar(100),
	@NetGBPrice decimal(18,0)
AS   
    SET NOCOUNT ON;  
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @foundProductTypes TABLE (Id INT);
			DECLARE @ProductInfoId INT, @BrandId INT;
			DECLARE @ProductId table (Id int)

			SET @BrandId =  (SELECT b.Id 
						FROM dbo.Brands b 
						WHERE b.Name = @BrandName)

			IF(@BrandId IS NULL)
				RAISERROR('Brand doesn''t exist', 16, 1)
		
			SET @ProductInfoId =	(SELECT pi.Id 
									FROM dbo.ProductInfo pi 
									WHERE pi.Title = @InfoTitle AND pi.Description = @InfoDescription);
			
			IF(@ProductInfoId IS NULL)
				RAISERROR('Product Information doesn''t exist', 16, 1)

			INSERT INTO dbo.Products (	Units,
										BrandId,
										ProductInfoId,
										Weight,
										Uom,
										NetGBPPrice)
			OUTPUT INSERTED.Id INTO @ProductId
			VALUES(
				@Units,
				@BrandId,
				@ProductInfoId,
				@Weight,
				@Uom,
				@NetGBPrice
			)

			--	GET LIST OF PRODUCTS TYPES USING REQUESTED PRODUCT TYPES
			INSERT INTO @foundProductTypes
			SELECT  pt.Id
			FROM dbo.ProductTypes pt
			WHERE pt.ProductType IN (SELECT * FROM @ProductTypes);

			IF((SELECT COUNT(*) FROM @foundProductTypes) <> (SELECT COUNT(DISTINCT pt.ProductType) FROM @ProductTypes pt))
				RAISERROR('Product Type/s doesn''t exist', 16, 1)
				
			INSERT INTO dbo.Products_ProductTypes ( ProductId, ProductTypeId )
			SELECT (SELECT TOP 1 p.Id FROM @ProductId p), tpt.Id 
			FROM @foundProductTypes tpt

			SELECT *
			FROM @ProductId;
		COMMIT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION
		  PRINT 'Error detected, all changes reversed'
	   END 
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
	END CATCH
GO
/****** Object:  StoredProcedure [pmc].[Product_CreateProductInfo]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Product_CreateProductInfo]
	@Title VARCHAR(100),
	@Description VARCHAR(100)
AS   
    SET NOCOUNT ON;  
	
	DECLARE @UpdateVariable bit

	MERGE dbo.ProductInfo AS tar
	USING (VALUES (	@Title,
					@Description)) AS src ( Title,
											Description)
	ON tar.Title = src.Title AND tar.Description = src.Description
	WHEN NOT MATCHED THEN
	   INSERT (	Title,
	      		Description )
	   VALUES (	src.Title, 
				src.Description )
	WHEN MATCHED THEN 
		--	To dummy trigger Update so that the Id is returned for the action
		UPDATE SET @UpdateVariable = 1
	OUTPUT inserted.Id;
GO
/****** Object:  StoredProcedure [pmc].[Product_CreateProductType]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Product_CreateProductType]
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
/****** Object:  StoredProcedure [pmc].[Product_GetProductById]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Product_GetProductById]
 	@Id int
AS   
    SET NOCOUNT ON;  
    SELECT b.Name AS BrandName, pd.Title, pd.Description, p.Units, p.Weight, p.Uom, p.NetGBPPrice
    FROM dbo.Products p
	LEFT JOIN dbo.Brands b ON b.Id = p.BrandId
	LEFT JOIN dbo.ProductDetails pd ON pd.Id = p.ProductDetailsId
	WHERE p.Id = @Id
GO
/****** Object:  StoredProcedure [pmc].[Product_GetProductsProductTypes]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Product_GetProductsProductTypes]
	@ProductId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT pt.ProductType
	FROM Products_ProductTypes ppt
	LEFT JOIN ProductTypes pt
	ON ppt.ProductTypeId = pt.Id
	WHERE ppt.ProductId = @ProductId;
END
GO
/****** Object:  StoredProcedure [pmc].[Product_UpdateProductsTypes]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Product_UpdateProductsTypes]
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