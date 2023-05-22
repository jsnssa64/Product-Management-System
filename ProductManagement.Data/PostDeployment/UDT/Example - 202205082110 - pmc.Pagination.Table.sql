﻿--GO
-------Example: Alter Table Type
/****** Object:  UDT [pmc].[Pagination]    Script Date: 09/10/2022 13:42:52 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[pmc].[Pagination_UDTT]') AND type in (N'P', N'PC'))
--BEGIN
--EXEC dbo.sp_executesql @statement = N'DROP TYPE [pmc].[Pagination_UDTT]' 
--END
--GO
----CREATE TYPE [pmc].[Pagination_UDTT] AS TABLE (
----	PageNumber INT,
----	ItemPerPage INT)
--GO