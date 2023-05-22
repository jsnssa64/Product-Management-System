GO
/****** Object:  StoredProcedure [pmc].[Catergory_GetAllCatergory]    Script Date: 09/10/2022 13:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Catergory_GetAllCatergory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [pmc].[Catergory_GetAllCatergory] AS' 
END
GO
ALTER PROCEDURE [pmc].[Catergory_GetAllCatergory]
AS   
    SET NOCOUNT ON;  
    SELECT c.Name
    FROM [dbo].Catergory c;
GO