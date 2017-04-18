CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[HeadingID] [varchar](100) NOT NULL,
	[HeadingText] [varchar](100) NOT NULL,
	[Contents] [varchar](max) NOT NULL,
	[Image] [varchar](200) NULL,
	[HasCommentBox] [bit] NOT NULL,
	[HasButtons] [bit] NOT NULL,
	[Link1Caption] [varchar](150) NULL,
	[Link1Description] [varchar](max) NULL,
	[Link2Caption] [varchar](150) NULL,
	[Link2Description] [varchar](max) NULL,
	[Link3Caption] [varchar](150) NULL,
	[Link3Description] [varchar](max) NULL,
	[Link4Caption] [varchar](150) NULL,
	[Link4Description] [varchar](max) NULL,
	[Link5Caption] [varchar](150) NULL,
	[Link5Description] [varchar](max) NULL,
	[Link6Caption] [varchar](150) NULL,
	[Link6Description] [varchar](max) NULL,
	[IsCreatedByStudent] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]