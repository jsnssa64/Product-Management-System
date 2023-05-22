/****** Object:  StoredProcedure [pmc].[Product_CreateProductInfo]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Product_CreateProductInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Product_CreateProductInfo] AS' 
END
GO
ALTER PROCEDURE [pmc].[Product_CreateProductInfo]
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