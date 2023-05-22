GO
/****** Object:  StoredProcedure [pmc].[Brand_GetBrandById]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Brand_GetBrandById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Brand_GetBrandById] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [pmc].[Brand_GetBrandById]
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT b.Id, b.Name
	FROM dbo.Brand b
	WHERE b.Id = @Id;
END

GO