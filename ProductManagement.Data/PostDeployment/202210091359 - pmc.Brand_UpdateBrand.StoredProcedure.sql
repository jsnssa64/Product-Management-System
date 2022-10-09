USE [ProductManagementCore]
GO
/****** Object:  StoredProcedure [pmc].[Brand_UpdateBrand]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Brand_UpdateBrand]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Brand_UpdateBrand] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Brand_UpdateBrand]
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