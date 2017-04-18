
USE [Cell]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Comment]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Content]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Scenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ScenarioContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SubContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Admin] ON
GO

INSERT [dbo].[Admin] ([AdminID], [Name], [EmailID], [UserName], [Password], [IsActive]) VALUES (1, N'Admin', N'admin@cellproject.com', N'admin', N'admin', 1)
GO

SET IDENTITY_INSERT [dbo].[Admin] OFF
GO

SET IDENTITY_INSERT [dbo].[Comment] ON
GO

INSERT [dbo].[Comment] ([CommentID], [ScenarioID], [ContentID], [StudentID], [CreatedOn], [IsActive]) VALUES (2, 2, 14, 1, CAST(N'2016-11-28 11:29:27.570' AS DateTime), 1)
GO

SET IDENTITY_INSERT [dbo].[Comment] OFF
GO

SET IDENTITY_INSERT [dbo].[Content] ON
GO

INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (11, N'Content A', N'Content A Heading Text', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:06:30.213' AS DateTime), 1)
GO

INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (12, N'Content B', N'Content B Heading Text', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', N'20161128111141659.jpg', 1, 1, 0, 1, CAST(N'2016-11-28 11:11:41.663' AS DateTime), 1)
GO

INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (13, N'Content C', N'Content C Heading Text', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:12:43.073' AS DateTime), 1)
GO

INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (14, N'Content D', N'Content D Heading Text', N'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:27:42.470' AS DateTime), 1)
GO

SET IDENTITY_INSERT [dbo].[Content] OFF
GO

SET IDENTITY_INSERT [dbo].[Scenario] ON
GO

INSERT [dbo].[Scenario] ([ScenarioID], [Name], [Details], [Image], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (2, N'Scenario 1', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', N'20161128111509582.jpg', 0, 1, CAST(N'2016-11-28 11:15:09.597' AS DateTime), 1)
GO

SET IDENTITY_INSERT [dbo].[Scenario] OFF
GO

SET IDENTITY_INSERT [dbo].[ScenarioContent] ON
GO

INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (2, 1, 8, 1)
GO

INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (3, 1, 9, 1)
GO

INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (4, 1, 10, 1)
GO

INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (5, 2, 11, 1)
GO

SET IDENTITY_INSERT [dbo].[ScenarioContent] OFF
GO

SET IDENTITY_INSERT [dbo].[SubContent] ON
GO

INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (8, 11, 12, 1)
GO

INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (9, 11, 13, 1)
GO

INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (10, 13, 14, 1)
GO

SET IDENTITY_INSERT [dbo].[SubContent] OFF
GO

/****** Object:  StoredProcedure [dbo].[AdminLogin]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveComment]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveScenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveScenarioContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveSubContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowContentByScenarioID]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowScenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowSubContentByContentID]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [Cell]
GO

/****** Object:  Table [dbo].[Content]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Comment]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Electives]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ScenarioContent]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Scenario]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[SubContent]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Student_Table]    Script Date: 04/03/2017 21:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_STUDENT_PROFILE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_STUDENT_Permission]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_GRADE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ADMIN_PROFILE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[STUDENT_LOGIN]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowSubContentByContentID]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowScenario]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowContentByScenarioID]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ShowContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SHOW_GRADE_TO_STUDENT]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveUpdateScenario]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveSubContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveScenarioContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveScenario]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SaveComment]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[REGISTER_STUDENT]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GET_STUDENT_PROFILE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GET_STUDENT_LIST_FOR_GRADE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GET_STUDENT]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GET_ADMIN_PROFILE]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[DeleteSubContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[DeleteScenario]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[DeleteContent]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[DELETE_STUDENT]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[AdminLogin]    Script Date: 04/03/2017 21:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
