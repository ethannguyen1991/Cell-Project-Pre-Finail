CREATE TABLE [dbo].[Scenario](
	[ScenarioID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Welcome] [varchar](max) NULL,
	[LearnAbout] [nvarchar](max) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Details] [varchar](max) NOT NULL,
	[Rank] [varchar](50) NULL,
	[Image] [varchar](200) NULL,
	[IsCreatedByStudent] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Scenario] PRIMARY KEY CLUSTERED 
(
	[ScenarioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]