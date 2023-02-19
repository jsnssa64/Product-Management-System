GO
/****** Object:  StoredProcedure [pmc].[Brand_CreateBrand]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Brand_CreateBrand]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Brand_CreateBrand] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Brand_CreateBrand]
	@Name VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Brands
	OUTPUT INSERTED.Id
	VALUES (@Name);
END
GO