USE [ProductManagementCore]
GO
/****** Object:  StoredProcedure [pmc].[Brand_DeleteBrand]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Brand_DeleteBrand]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Brand_DeleteBrand] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Brand_DeleteBrand]
	@Name VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE 
	FROM dbo.Brands
	WHERE Name = @Name;
END
GO