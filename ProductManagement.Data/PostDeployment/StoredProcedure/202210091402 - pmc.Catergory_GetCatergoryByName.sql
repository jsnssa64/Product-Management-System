GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetCatergoryByName]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Catergory_GetCatergoryByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Catergory_GetCatergoryByName] AS' 
END
GO
ALTER PROCEDURE [pmc].[Catergory_GetCatergoryByName]
	@Name varchar(100)
AS   
    SET NOCOUNT ON;  
    SELECT c.Name
    FROM dbo.Catergory c
	WHERE c.Name = @Name;
GO