USE [PartialZ]
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 03-07-2023 11:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Template] [nvarchar](max) NULL,
	[Subject] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifedDate] [datetime] NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_EmailTemplates_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_ETCD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_ETLMD]  DEFAULT (getdate()) FOR [LastModifedDate]
GO
