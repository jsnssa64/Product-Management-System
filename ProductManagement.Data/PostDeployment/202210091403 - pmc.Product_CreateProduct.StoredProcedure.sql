GO
/****** Object:  StoredProcedure [pmc].[Product_CreateProduct]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_CreateProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_CreateProduct] AS' 
END
GO
ALTER PROCEDURE [pmc].[Product_CreateProduct]
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