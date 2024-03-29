/****** Object:  Table [dbo].[Brands]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [pk_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catergories]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catergories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [pk_Catergories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catergories_ProductTypes]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catergories_ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypesId] [int] NOT NULL,
	[CatergoryId] [int] NOT NULL,
 CONSTRAINT [pk_Items_ItemTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations_Statuses]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations_Statuses](
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
/****** Object:  Table [dbo].[Products]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Units] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProductInfoId] [int] NULL,
	[Weight] [int] NOT NULL,
	[Uom] [varchar](100) NOT NULL,
	[NetGBPPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [pk_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_ProductTypes]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [pk_Products_CatergoriesProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](100) NOT NULL,
 CONSTRAINT [pk_ItemTypes] PRIMARY KEY CLUSTERED 
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
	[ConfigurationsStatusId] [int] NOT NULL,
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
	[ConfigurationsStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 09/10/2022 11:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [Units]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT ('PROCESSING') FOR [State]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT (getdate()) FOR [DateOfAction]
GO
ALTER TABLE [dbo].[StatusAudit] ADD  DEFAULT (sysdatetime()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Catergories_ProductTypes]  WITH CHECK ADD  CONSTRAINT [fk_catergories_producttypes] FOREIGN KEY([CatergoryId])
REFERENCES [dbo].[Catergories] ([Id])
GO
ALTER TABLE [dbo].[Catergories_ProductTypes] CHECK CONSTRAINT [fk_catergories_producttypes]
GO
ALTER TABLE [dbo].[Catergories_ProductTypes]  WITH CHECK ADD  CONSTRAINT [fk_catergories_producttypes_producttypes] FOREIGN KEY([ProductTypesId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catergories_ProductTypes] CHECK CONSTRAINT [fk_catergories_producttypes_producttypes]
GO
ALTER TABLE [dbo].[Configurations_Statuses]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Configuration] FOREIGN KEY([ConfigurationId])
REFERENCES [dbo].[Configurations] ([Id])
GO
ALTER TABLE [dbo].[Configurations_Statuses] CHECK CONSTRAINT [FK_Configuration_Configuration]
GO
ALTER TABLE [dbo].[Configurations_Statuses]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_Configuration1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[Configurations_Statuses] CHECK CONSTRAINT [FK_Configuration_Configuration1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_items_brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_items_brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_items_itemdetails] FOREIGN KEY([ProductInfoId])
REFERENCES [dbo].[ProductInfo] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_items_itemdetails]
GO
ALTER TABLE [dbo].[Products_ProductTypes]  WITH CHECK ADD  CONSTRAINT [fk_products_catergoriesproducttypes] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Products_ProductTypes] CHECK CONSTRAINT [fk_products_catergoriesproducttypes]
GO
ALTER TABLE [dbo].[Products_ProductTypes]  WITH CHECK ADD  CONSTRAINT [fk_products_catergoriesproducttypes_catergories_producttypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Products_ProductTypes] CHECK CONSTRAINT [fk_products_catergoriesproducttypes_catergories_producttypes]
GO
ALTER TABLE [dbo].[StatusAudit]  WITH CHECK ADD  CONSTRAINT [fk_statusaudit_configurationsstatus] FOREIGN KEY([ConfigurationsStatusId])
REFERENCES [dbo].[Configurations_Statuses] ([Id])
GO
ALTER TABLE [dbo].[StatusAudit] CHECK CONSTRAINT [fk_statusaudit_configurationsstatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status Order of Priority' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Configurations_Statuses', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stock Order Associated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Failed / Success / Processing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Audit Order Record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StatusAudit', @level2type=N'COLUMN',@level2name=N'Order'
GO