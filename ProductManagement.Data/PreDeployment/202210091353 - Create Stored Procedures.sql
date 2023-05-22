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
	INSERT INTO dbo.Brand
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
	FROM dbo.Brand
	WHERE Name = @Name;
END
GO
/****** Object:  StoredProcedure [pmc].[Brand_GetAllBrand]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Brand_GetAllBrand]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT b.Id, b.Name
	FROM dbo.Brand b;
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
	FROM dbo.Brand b
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
	FROM dbo.Brand b
	WHERE b.Name = @OriginName;
END

GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetAllCatergory]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pmc].[Catergory_GetAllCatergory]
AS   
    SET NOCOUNT ON;  
    SELECT c.Name
    FROM [dbo].Catergory c;
GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoryByProductType]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Catergory_GetCatergoryByProductType]
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
    FROM dbo.Catergory c
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
	@ProductType dbo.ProductTypeList READONLY,
	@Weight int,
	@Uom varchar(100),
	@NetGBPrice decimal(18,0)
AS   
    SET NOCOUNT ON;  
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @foundProductType TABLE (Id INT);
			DECLARE @ProductInfoId INT, @BrandId INT;
			DECLARE @ProductId table (Id int)

			SET @BrandId =  (SELECT b.Id 
						FROM dbo.Brand b 
						WHERE b.Name = @BrandName)

			IF(@BrandId IS NULL)
				RAISERROR('Brand doesn''t exist', 16, 1)
		
			SET @ProductInfoId =	(SELECT pi.Id 
									FROM dbo.ProductInfo pi 
									WHERE pi.Title = @InfoTitle AND pi.Description = @InfoDescription);
			
			IF(@ProductInfoId IS NULL)
				RAISERROR('Product Information doesn''t exist', 16, 1)

			INSERT INTO dbo.Product (	Units,
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
			INSERT INTO @foundProductType
			SELECT  pt.Id
			FROM dbo.ProductType pt
			WHERE pt.ProductType IN (SELECT * FROM @ProductType);

			IF((SELECT COUNT(*) FROM @foundProductType) <> (SELECT COUNT(DISTINCT pt.ProductType) FROM @ProductType pt))
				RAISERROR('Product Type/s doesn''t exist', 16, 1)
				
			INSERT INTO dbo.Product_ProductType ( ProductId, ProductTypeId )
			SELECT (SELECT TOP 1 p.Id FROM @ProductId p), tpt.Id 
			FROM @foundProductType tpt

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

    MERGE dbo.ProductType AS tar
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
    FROM dbo.Product p
	LEFT JOIN dbo.Brand b ON b.Id = p.BrandId
	LEFT JOIN dbo.ProductDetails pd ON pd.Id = p.ProductDetailsId
	WHERE p.Id = @Id
GO
/****** Object:  StoredProcedure [pmc].[Product_GetProductProductType]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Product_GetProductProductType]
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
/****** Object:  StoredProcedure [pmc].[Product_UpdateProductTypes]    Script Date: 09/10/2022 13:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [pmc].[Product_UpdateProductTypes]
	@ProductId INT,
	@ProductType IdList READONLY
AS
BEGIN
	SET NOCOUNT ON;
	MERGE dbo.Product_ProductType AS Target
	USING @ProductType AS Source
	ON Target.ProductTypeId = Source.Id
	WHEN NOT MATCHED BY Target THEN
	    INSERT ( ProductId, ProductTypeId ) 
		VALUES ( @ProductId, Source.Id )
	WHEN NOT MATCHED BY Source AND Target.ProductId = @ProductId THEN
		DELETE
	OUTPUT $action, DELETED.ProductTypeId AS SourceProductTypeId, INSERTED.ProductTypeId AS SourceProductTypeId;
END

GO