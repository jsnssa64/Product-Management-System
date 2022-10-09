USE [ProductManagementCore]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (7, 1, 1, 1, 200, N'gm', CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (8, 1, 1, 1, 200, N'gm', CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (19, 1, 1, 1, 200, N'gm', CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (39, 1, 1, 1, 200, N'gm', CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (40, 10, 6, 8, 150, N'gm', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Products] ([Id], [Units], [BrandId], [ProductInfoId], [Weight], [Uom], [NetGBPPrice]) VALUES (41, 10, 6, 8, 150, N'gm', CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO