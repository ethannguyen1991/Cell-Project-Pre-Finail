CREATE TABLE [dbo].[Student_Table](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](max) NULL,
	[lastName] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[userName] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[IsAllowEdit] [bit] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Student_Table] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]