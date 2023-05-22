/****** Object:  Table [dbo].[Brand]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [pk_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catergory]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catergory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [pk_Catergory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catergory_ProductType]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catergory_ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[CatergoryId] [int] NOT NULL,
 CONSTRAINT [pk_Item_ItemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuration_Status]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuration_Status](
	[Id] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[ConfigurationId] [int] NOT NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [pk_ItemDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Units] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProductInfoId] [int] NULL,
	[Weight] [int] NOT NULL,
	[Uom] [varchar](100) NOT NULL,
	[NetGBPPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [pk_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_ProductType]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [pk_Product_CatergoryProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
 CONSTRAINT [pk_ItemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusAudit]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusAudit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationStatusId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Order] [int] NOT NULL,
	[DateOfAction] [date] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [pk_StatusAudit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unq_StatusAudit_ConfigurationId] UNIQUE NONCLUSTERED 
(
	[ConfigurationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Units]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT ('PROCESSING') FOR [State]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT (getdate()) FOR [DateOfAction]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT (sysdatetime()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Catergory_ProductType]  WITH CHECK ADD  CONSTRAINT [fk_catergory_producttype] FOREIGN KEY([CatergoryId])
REFERENCES [dbo].[Catergory] ([Id])
GO
ALTER TABLE [dbo].[Catergory_ProductType] CHECK CONSTRAINT [fk_catergory_producttype]
GO
ALTER TABLE [dbo].[Catergory_ProductType]  WITH CHECK ADD  CONSTRAINT [fk_catergory_producttype_producttype] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catergory_ProductType] CHECK CONSTRAINT [fk_catergory_producttype_producttype]
GO
ALTER TABLE [dbo].[Configuration_Status]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Configuration] FOREIGN KEY([ConfigurationId])
REFERENCES [dbo].[Configuration] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Status] CHECK CONSTRAINT [FK_Configuration_Configuration]
GO
ALTER TABLE [dbo].[Configuration_Status]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Configuration1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Configuration_Status] CHECK CONSTRAINT [FK_Configuration_Configuration1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_items_brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_items_brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_items_itemdetails] FOREIGN KEY([ProductInfoId])
REFERENCES [dbo].[ProductInfo] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_items_itemdetails]
GO
ALTER TABLE [dbo].[Product_ProductType]  WITH CHECK ADD  CONSTRAINT [fk_product_catergoryproducttype] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product_ProductType] CHECK CONSTRAINT [fk_product_catergoryproducttype]
GO
ALTER TABLE [dbo].[Product_ProductType]  WITH CHECK ADD  CONSTRAINT [fk_product_catergoryproducttype_catergory_producttype] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product_ProductType] CHECK CONSTRAINT [fk_product_catergoryproducttype_catergory_producttype]
GO
ALTER TABLE [dbo].[StatusAudit]  WITH CHECK ADD  CONSTRAINT [fk_statusaudit_configurationstatus] FOREIGN KEY([ConfigurationStatusId])
REFERENCES [dbo].[Configuration_Status] ([Id])
GO
ALTER TABLE [dbo].[StatusAudit] CHECK CONSTRAINT [fk_statusaudit_configurationstatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status Order of Priority' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Configuration_Status', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Order Associated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Failed / Success / Processing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Audit Order Record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'Order'
GO