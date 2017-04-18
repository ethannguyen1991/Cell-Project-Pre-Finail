﻿CREATE TABLE [dbo].[ScenarioContent](
	[ScenarioContentID] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioID] [int] NOT NULL,
	[ContentID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ScenarioContent] PRIMARY KEY CLUSTERED 
(
	[ScenarioContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]