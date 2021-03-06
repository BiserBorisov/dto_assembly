USE [PartsCatalog]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 11/13/2015 5:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComponentNumber] [nvarchar](max) NULL,
	[ComponentDescription] [nvarchar](max) NULL,
	[Material] [nvarchar](max) NULL,
	[UnitOfMeasure] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[ParentPartId] [int] NOT NULL,
	[QuantityPerAssembly] [float] NOT NULL,
	[CostPerUnit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Component] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LaborSequences]    Script Date: 11/13/2015 5:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LaborSequences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LaborSequenceNumber] [nvarchar](50) NULL,
	[LaborSequenceDesc] [nvarchar](max) NULL,
	[RunTime] [float] NOT NULL,
	[Burden] [decimal](18, 2) NOT NULL,
	[LaborRate] [decimal](18, 2) NOT NULL,
	[Facility] [varchar](50) NULL,
	[Machine] [varchar](50) NULL,
	[ParentPartId] [int] NOT NULL,
 CONSTRAINT [PK_LaborSequences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 11/13/2015 5:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartNumber] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[User] [nvarchar](max) NULL,
	[SalesCode] [nvarchar](max) NULL,
	[ExtendedDescription] [nvarchar](max) NULL,
	[Facility] [nvarchar](max) NULL,
	[InventType] [nvarchar](max) NULL,
	[ItemClass] [nvarchar](max) NULL,
	[LeadTimeCode] [nvarchar](max) NULL,
	[MfgLeadTime] [nvarchar](max) NULL,
	[PartDescription] [nvarchar](max) NULL,
	[PartNumberNoFacility] [nvarchar](max) NULL,
	[ProductType] [nvarchar](max) NULL,
	[UnitOfMeasure] [nvarchar](max) NULL,
	[HiddenSpec] [nvarchar](max) NULL,
	[PriceIsRfq] [bit] NOT NULL,
	[DrawingNumber] [nvarchar](max) NULL,
	[RevisionComments] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[EngineeringStatus] [nvarchar](max) NULL,
	[InventoryStatus] [nvarchar](max) NULL,
	[TotalQuantityRequired] [float] NOT NULL,
	[TotalSquareFootage] [float] NOT NULL,
	[BomLevel] [int] NOT NULL,
	[Cost] [float] NOT NULL,
	[BaseCost] [float] NOT NULL,
	[Qpa] [float] NOT NULL,
	[BaseQpa] [float] NOT NULL,
	[MarketCost] [float] NOT NULL,
	[BaseMarketCost] [float] NOT NULL,
	[BatchSize] [float] NOT NULL,
	[TotalWeight] [float] NOT NULL,
	[CostError] [bit] NOT NULL,
	[ParentNum] [nvarchar](max) NULL,
	[ShopFloorNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Parts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Component_dbo.Parts_ParentPartId] FOREIGN KEY([ParentPartId])
REFERENCES [dbo].[Parts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [FK_dbo.Component_dbo.Parts_ParentPartId]
GO
ALTER TABLE [dbo].[LaborSequences]  WITH CHECK ADD  CONSTRAINT [FK_LaborSequences_ParentPartId] FOREIGN KEY([ParentPartId])
REFERENCES [dbo].[Parts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LaborSequences] CHECK CONSTRAINT [FK_LaborSequences_ParentPartId]
GO
