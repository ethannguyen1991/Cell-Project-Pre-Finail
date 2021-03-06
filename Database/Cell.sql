
GO

/****** Object: Table [dbo].[Account] Script Date: 5/6/2017 10:43:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Account] (
    [AccountId]   INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50)  NULL,
    [LastName]    VARCHAR (50)  NULL,
    [EmailID]     VARCHAR (100) NULL,
    [UserName]    VARCHAR (100) NULL,
    [Password]    VARCHAR (100) NULL,
    [IsAllowEdit] BIT           NULL,
    [IsActive]    BIT           NULL,
    [IsAdmin]     BIT           NULL
);

GO

/****** Object: Table [dbo].[Comment] Script Date: 5/6/2017 10:43:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Comment] (
    [CommentID]  INT           IDENTITY (1, 1) NOT NULL,
    [ScenarioID] INT           NOT NULL,
    [ContentID]  INT           NULL,
    [StudentID]  INT           NOT NULL,
    [CreatedOn]  DATETIME      NOT NULL,
    [IsActive]   BIT           NOT NULL,
    [Comments]   VARCHAR (MAX) NULL,
    [Grade]      VARCHAR (50)  NULL
);

GO

/****** Object: Table [dbo].[Content] Script Date: 5/6/2017 10:43:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Content] (
    [ContentID]          INT           IDENTITY (1, 1) NOT NULL,
    [HeadingID]          VARCHAR (100) NOT NULL,
    [HeadingText]        VARCHAR (100) NOT NULL,
    [Contents]           VARCHAR (MAX) NOT NULL,
    [Image]              VARCHAR (200) NULL,
    [HasCommentBox]      BIT           NOT NULL,
    [HasButtons]         BIT           NOT NULL,
    [Link1Caption]       VARCHAR (150) NULL,
    [Link1Description]   VARCHAR (MAX) NULL,
    [Link2Caption]       VARCHAR (150) NULL,
    [Link2Description]   VARCHAR (MAX) NULL,
    [Link3Caption]       VARCHAR (150) NULL,
    [Link3Description]   VARCHAR (MAX) NULL,
    [Link4Caption]       VARCHAR (150) NULL,
    [Link4Description]   VARCHAR (MAX) NULL,
    [Link5Caption]       VARCHAR (150) NULL,
    [Link5Description]   VARCHAR (MAX) NULL,
    [Link6Caption]       VARCHAR (150) NULL,
    [Link6Description]   VARCHAR (MAX) NULL,
    [IsCreatedByStudent] BIT           NOT NULL,
    [CreatedBy]          INT           NOT NULL,
    [CreatedOn]          DATETIME      NOT NULL,
    [IsActive]           BIT           NOT NULL
);


GO

/****** Object: Table [dbo].[Electives] Script Date: 5/6/2017 10:43:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Electives] (
    [electiveId] INT           IDENTITY (1, 1) NOT NULL,
    [ScenarioId] INT           NULL,
    [text]       VARCHAR (150) NULL
);

GO

/****** Object: Table [dbo].[Scenario] Script Date: 5/6/2017 10:44:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Scenario] (
    [ScenarioID]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (100)  NOT NULL,
    [Welcome]            VARCHAR (MAX)  NULL,
    [LearnAbout]         NVARCHAR (MAX) NULL,
    [Desciption]         NVARCHAR (MAX) NULL,
    [Details]            VARCHAR (MAX)  NOT NULL,
    [Rank]               VARCHAR (50)   NULL,
    [Image]              VARCHAR (200)  NULL,
    [IsCreatedByStudent] BIT            NOT NULL,
    [CreatedBy]          INT            NOT NULL,
    [CreatedOn]          DATETIME       NOT NULL,
    [IsActive]           BIT            NOT NULL
);

GO

/****** Object: Table [dbo].[ScenarioContent] Script Date: 5/6/2017 10:44:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ScenarioContent] (
    [ScenarioContentID] INT IDENTITY (1, 1) NOT NULL,
    [ScenarioID]        INT NOT NULL,
    [ContentID]         INT NOT NULL,
    [IsActive]          BIT NOT NULL
);

GO

/****** Object: Table [dbo].[SubContent] Script Date: 5/6/2017 10:44:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SubContent] (
    [SubContentID] INT IDENTITY (1, 1) NOT NULL,
    [ParentID]     INT NOT NULL,
    [ChildID]      INT NOT NULL,
    [IsActive]     BIT NOT NULL
);

GO

/****** Object: SqlProcedure [dbo].[ChangePassword] Script Date: 5/6/2017 10:44:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChangePassword]
	@newPassword varchar(100),
	@currentPassword varchar(100),
	@accountId int,
	@success BIT OUT
AS
BEGIN
	IF EXISTS(
			SELECT * 
			FROM DBO.ACCOUNT 
			WHERE AccountId = @accountId
			and [Password] = @currentPassword
		)
		BEGIN
			SET @success = 1
			UPDATE DBO.Account
			SET [Password] = @newPassword
			WHERE AccountId = @accountId
			and [Password] = @currentPassword
		END
	ELSE 
		BEGIN
			SET @success = 0 
		END
	
END

GO

/****** Object: SqlProcedure [dbo].[DELETE_STUDENT] Script Date: 5/6/2017 10:44:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DELETE_STUDENT]
@studentId		INT
AS
BEGIN
	DELETE FROM Student_Table WHERE studentId = @studentId
END

GO

/****** Object: SqlProcedure [dbo].[DeleteContent] Script Date: 5/6/2017 10:44:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteContent]
@ContentId		INT
AS
BEGIN
DELETE FROM Content WHERE ContentID = @ContentId;
END

GO

/****** Object: SqlProcedure [dbo].[DeleteScenario] Script Date: 5/6/2017 10:44:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteScenario]
@ScenarioID	INT
AS
BEGIN
DELETE FROM Scenario WHERE ScenarioID = @ScenarioID
END

GO

/****** Object: SqlProcedure [dbo].[DeleteSubContent] Script Date: 5/6/2017 10:44:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteSubContent]
@ParentId		INT
AS
BEGIN
DELETE FROM SubContent WHERE ParentID = @ParentId 
END

GO

/****** Object: SqlProcedure [dbo].[GET_STUDENT_PROFILE] Script Date: 5/6/2017 10:44:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_STUDENT_PROFILE]
@studentId	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	ST.firstName AS FIRSTNAME,
	ST.lastName  AS LASTNAME,
	ST.email     AS EMAIL,
	ST.userName  AS USERNAME
	FROM Student_Table  ST 

	WHERE ST.[studentId] = @studentId
END

GO

/****** Object: SqlProcedure [dbo].[GetAccountProfile] Script Date: 5/6/2017 10:44:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetAccountProfile]
@AccountId	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	FirstName AS FIRSTNAME,
	LastName  AS LASTNAME,
	EmailID     AS EMAIL,
	UserName  AS USERNAME
	FROM Account
	WHERE AccountId = @AccountId
END

GO

/****** Object: SqlProcedure [dbo].[GetStudent] Script Date: 5/6/2017 10:45:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC	[dbo].GetStudent
AS
BEGIN
	SELECT  
	AccountId AS STUDENTID,IsAllowEdit,
	(FirstName+' '+LastName) AS STUDENTNAME
	FROM Account
END

GO

/****** Object: SqlProcedure [dbo].[GetStudentListForGrade] Script Date: 5/6/2017 10:45:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].GetStudentListForGrade
AS
BEGIN

	SELECT 
			CMT.Comments							AS COMMENT,
			CMT.ScenarioID							AS SCID,
			(acc.FirstName+ ' ' +acc.LastName)	AS STUDENTNAME,
			CMT.[Grade]								AS GRADE,
			SC.Name									AS LEVEL,
			CMT.CommentID							AS COMMENTID
			 
	FROM	
			Comment	 AS CMT

			INNER JOIN

			Scenario AS SC

			ON      
				CMT.ScenarioID = SC.ScenarioID

			INNER JOIN

			Account		AS acc

			ON		
				acc.AccountId  = CMT.StudentID
END

GO

/****** Object: SqlProcedure [dbo].[Login] Script Date: 5/6/2017 10:45:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Login]
	@UserName			VARCHAR(100),
	@Password			VARCHAR(100),
	@AccountID			INT OUT,
	@IsAllowEdit		BIT OUT,
	@IsAdmin			BIT OUT,
	@displayName		VARCHAR(100) OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [Account] WHERE UserName = @UserName AND [Password] = @Password AND IsActive = 1)
	BEGIN
		SELECT 
			@AccountID = AccountId,
			@IsAllowEdit = IsAllowEdit,
			@IsAdmin = IsAdmin,
			@displayName = FirstName+' '+LastName
		FROM 
			[Account] 
		WHERE 
			UserName = @UserName 
		AND 
			[Password] = @Password
	END
END

GO

/****** Object: SqlProcedure [dbo].[REGISTER_STUDENT] Script Date: 5/6/2017 10:45:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[REGISTER_STUDENT]
(
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX),
@password		VARCHAR(MAX),
@isActive		BIT

)
AS

BEGIN
	
	SET NOCOUNT ON;

		INSERT INTO [dbo].[Student_Table]
		(
			[firstName],
			[lastName],
			[email],
			[userName],
			[password],
			IsActive,
			IsAllowEdit
		)
		VALUES
		(
			@firstName,
			@lastName,
			@email,
			@userName,
			@password,
			@isActive,
			0

		)

END

GO

/****** Object: SqlProcedure [dbo].[RegisterStudent] Script Date: 5/6/2017 10:45:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[RegisterStudent]
(
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX),
@password		VARCHAR(MAX),
@IsAllowEdit	BIT,
@isActive		BIT

)
AS

BEGIN
	
	SET NOCOUNT ON;

		INSERT INTO [dbo].[Account]
		(
			[FirstName],
			[LastName],
			[EmailID],
			[UserName],
			[Password],
			IsAllowEdit,
			IsActive,
			IsAdmin
		)
		VALUES
		(
			@firstName,
			@lastName,
			@email,
			@userName,
			@password,
			@IsAllowEdit,
			@isActive,
			0

		)

END

GO

/****** Object: SqlProcedure [dbo].[SaveComment] Script Date: 5/6/2017 10:45:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveComment]
	@ScenarioID					INT,
	@ContentID					INT = NULL,
	@StudentID					INT,
	@Comment					VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO
		Comment(ScenarioID, ContentID, StudentID, CreatedOn, IsActive,Comments)
	VALUES
		(@ScenarioID, @ContentID, @StudentID, GETDATE(), 1,@Comment)
END

GO

/****** Object: SqlProcedure [dbo].[SaveContent] Script Date: 5/6/2017 10:45:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveContent]
	@ContentID					INT,
	@HeadingID					VARCHAR(100),
	@HeadingText				VARCHAR(100),
	@Contents					VARCHAR(MAX),
	@Image						VARCHAR(200) = NULL,
	@Link1Caption					varchar(150),
	@Link1Description					varchar(MAX),
	@Link2Caption					varchar(150),
	@Link2Description					varchar(MAX),
	@Link3Caption					varchar(150),
	@Link3Description					varchar(MAX),
	@Link4Caption					varchar(150),
	@Link4Description					varchar(MAX),
	@Link5Caption					varchar(150),
	@Link5Description					varchar(MAX),
	@Link6Caption					varchar(150),
	@Link6Description					varchar(MAX),
	@HasCommentBox				BIT,
	@HasButtons					BIT,
	@IsCreatedByStudent			BIT,
	@CreatedBy					INT,
	@NewContentID				INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Content WHERE ContentID = @ContentID AND @ContentID != -1)
	BEGIN
		UPDATE
			Content
		SET
			HeadingID = @HeadingID, HeadingText = @HeadingText, Contents = @Contents,
			[Image] = @Image, HasCommentBox = @HasCommentBox, 
			Link1Caption=@Link1Caption,
			Link1Description=@Link1Description,
			Link2Caption=@Link2Caption,
			Link2Description=@Link2Description,
			Link3Caption=@Link3Caption,
			Link3Description=@Link3Description,
			Link4Caption=@Link4Caption,
			Link4Description=@Link4Description,
			Link5Caption=@Link5Caption,
			Link5Description=@Link5Description,
			Link6Caption=@Link6Caption,
			Link6Description=@Link6Description,
			HasButtons = @HasButtons
		WHERE
			ContentID = @ContentID;

		SET
			@NewContentID = @ContentID;
	END

	ELSE
	BEGIN
		INSERT INTO
			Content(HeadingID, HeadingText, Contents, [Image], HasCommentBox, Link1Caption,Link1Description,Link2Caption,Link2Description,Link3Caption,Link3Description,
			Link4Caption,Link4Description,
			Link5Caption,Link5Description,
			Link6Caption,Link6Description,
			HasButtons, IsCreatedByStudent,
			CreatedBy, CreatedOn, IsActive)
		VALUES
			(@HeadingID, @HeadingText, @Contents, @Image, @HasCommentBox, @Link1Caption,@Link1Description,@Link2Caption,@Link2Description,@Link3Caption,@Link3Description,
			@Link4Caption,@Link4Description,
			@Link5Caption,@Link5Description,
			@Link6Caption,@Link6Description,
			@HasButtons, @IsCreatedByStudent,
			@CreatedBy, GETDATE(), 1);

		SET
			@NewContentID = SCOPE_IDENTITY();
	END
END

GO

/****** Object: SqlProcedure [dbo].[SaveScenario] Script Date: 5/6/2017 10:45:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveScenario]
	@ScenarioID					INT,
	@Name						VARCHAR(50),
	@Welcome					VARCHAR(MAX),
	@LearnAbt					VARCHAR(MAX),
	@Desc					VARCHAR(MAX),
	@Details					VARCHAR(MAX),
	@Rank						VARCHAR(50),
	@Image						VARCHAR(200) = NULL,
	@IsCreatedByStudent			BIT,
	@CreatedBy					INT,
	@NewScenarioID				INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM Scenario WHERE ScenarioID = @ScenarioID AND @ScenarioID != -1)
	BEGIN
		UPDATE
			Scenario
		SET
			Name = @Name, Welcome = @Welcome, LearnAbout = @LearnAbt,Desciption = @Desc,Details = @Details,[Rank]=@Rank,[Image] = @Image, 
			IsCreatedByStudent = @IsCreatedByStudent, IsActive = 1
		WHERE
			ScenarioID = @ScenarioID
		SET
			@NewScenarioID = @ScenarioID
	END

	ELSE
	BEGIN
		INSERT INTO
			Scenario(Name,Welcome,LearnAbout,Desciption, Details, [Rank],[Image], IsCreatedByStudent, CreatedBy, CreatedOn, IsActive)
		VALUES
			(@Name,@Welcome,@LearnAbt,@Desc, @Details,@Rank, @Image,@IsCreatedByStudent, @CreatedBy, GETDATE(), 1)

		SET
			@NewScenarioID = SCOPE_IDENTITY();
	END
END

GO

/****** Object: SqlProcedure [dbo].[SaveScenarioContent] Script Date: 5/6/2017 10:45:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveScenarioContent]
	@ScenarioID				INT,
	@ContentID				INT,
	@IsDeleted				INT
AS
BEGIN
	SET NOCOUNT ON;

	IF(@IsDeleted = 1)
	BEGIN
		DELETE FROM 
			ScenarioContent 
		WHERE 
			ScenarioID = @ScenarioID 
		AND 
			ContentID = @ContentID
	END

	ELSE
	BEGIN
		INSERT INTO
			ScenarioContent(ScenarioID, ContentID, IsActive)
		VALUES
			(@ScenarioID, @ContentID, 1)
	END
END

GO

/****** Object: SqlProcedure [dbo].[SaveSubContent] Script Date: 5/6/2017 10:45:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveSubContent]
	@ParentID				INT,
	@ChildID				INT,
	@IsDeleted				INT
AS
BEGIN
	SET NOCOUNT ON;

	--IF(@IsDeleted = 1)
	--BEGIN
	--	DELETE FROM 
	--		SubContent 
	--	WHERE 
	--		ParentID = @ParentID 
	--	AND 
	--		ChildID = @ChildID
	--END

	--ELSE
	--BEGIN
	--	IF (@ParentID != @ChildID)
	--	BEGIN
			INSERT INTO
				SubContent(ParentID, ChildID, IsActive)
			VALUES
				(@ParentID, @ChildID, 1)
	--	END
	--END
END

GO

/****** Object: SqlProcedure [dbo].[SaveUpdateScenario] Script Date: 5/6/2017 10:45:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveUpdateScenario]
	@ScenarioID					INT,
	@Welcome					VARCHAR(MAX),
	@LearnAbt					VARCHAR(MAX),
	@Desc					VARCHAR(MAX),
	@Details					VARCHAR(MAX)
	
AS
BEGIN
	SET NOCOUNT ON;

		UPDATE
			Scenario
		SET
			Welcome = @Welcome, LearnAbout = @LearnAbt,Desciption = @Desc,Details = @Details
		WHERE
			ScenarioID = @ScenarioID
		
END

GO

/****** Object: SqlProcedure [dbo].[SHOW_GRADE_TO_STUDENT] Script Date: 5/6/2017 10:45:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SHOW_GRADE_TO_STUDENT]
@studentId		INT
AS
BEGIN
	
	SELECT 
	
	CT.Comments  AS COMMENT,
	SC.Name		 AS LEVEL,
	CT.Grade     AS GRADE	 
	
	FROM Comment AS CT

	INNER JOIN

	Scenario	AS SC	

	ON	CT.ScenarioID	= SC.ScenarioID

	WHERE CT.StudentID  = @studentId

END

GO

/****** Object: SqlProcedure [dbo].[ShowContent] Script Date: 5/6/2017 10:46:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ShowContent]
	@UserID						INT,
	@ContentID					INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText,
		CONT.[Image]			AS [Image],
		CONT.Contents			AS Contents,
		CONT.HasCommentBox		AS HasCommentBox,
		CONT.HasButtons			AS HasButtons,
		CONT.Link1Caption	as  Link1Caption,
		CONT.Link2Caption	as  Link2Caption,
		CONT.Link3Caption	as  Link3Caption,
		CONT.Link4Caption	as  Link4Caption,
		CONT.Link5Caption	as  Link5Caption,
		CONT.Link6Caption	as  Link6Caption,
		cont.Link1Description as Link1Description,
		cont.Link2Description as Link2Description,
		cont.Link3Description as Link3Description,
		cont.Link4Description as Link4Description,
		cont.Link5Description as Link5Description,
		cont.Link6Description as Link6Description
	FROM
		Content					AS CONT
	WHERE
		CONT.IsActive = 1
	AND
		(CONT.ContentID = @ContentID OR @ContentID IS NULL)
END

GO

/****** Object: SqlProcedure [dbo].[ShowContentByScenarioID] Script Date: 5/6/2017 10:46:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ShowContentByScenarioID]
	@UserID						INT,
	@ScenarioID					INT 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText
	FROM
		Content					AS CONT
	INNER JOIN
		ScenarioContent			AS SC
	ON
		CONT.ContentID = SC.ContentID
	WHERE
		CONT.IsActive = 1
	AND
		(SC.ScenarioID = @ScenarioID)
END

GO

/****** Object: SqlProcedure [dbo].[ShowScenario] Script Date: 5/6/2017 10:46:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ShowScenario]
	@UserID						INT = NULL,
	@ScenarioID					INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		--'Scenario ' + 
		--CONVERT(VARCHAR, ROW_NUMBER() 
		--OVER(PARTITION BY ScenarioID ORDER BY ScenarioID ASC)) AS ScenarioNumber,
		SCN.Name				AS ScenarioNumber,
		SCN.ScenarioID			AS ScenarioID,
		SCN.Name				AS Name,
		SCN.Welcome				AS Welcome,
		SCN.LearnAbout				AS LearnAbout,
		scn.Desciption			as Desciption,
		SCN.Details				AS Details,
		SCN.[Image]				AS [Image],
		SCN.[Rank]				AS [Rank]
		
	FROM 
		Scenario				AS SCN
	WHERE
		SCN.IsActive = 1
	AND
		(SCN.ScenarioID = @ScenarioID OR @ScenarioID IS NULL)
END

GO

/****** Object: SqlProcedure [dbo].[ShowSubContentByContentID] Script Date: 5/6/2017 10:46:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ShowSubContentByContentID] 
	@UserID						INT = NULL,
	@ContentID					INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText
	FROM
		SubContent				AS SC
	INNER JOIN
		Content					AS CONT
	ON
		SC.ChildID = CONT.ContentID
	WHERE
		SC.ParentID = @ContentID
END

GO

/****** Object: SqlProcedure [dbo].[UPDATE_GRADE] Script Date: 5/6/2017 10:46:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_GRADE]
@commentId			INT,
@grade				VARCHAR(MAX)

AS
BEGIN
		UPDATE Comment
		
		SET		Grade = @grade 

		WHERE	CommentID = @commentId;
END

GO

/****** Object: SqlProcedure [dbo].[UPDATE_STUDENT_Permission] Script Date: 5/6/2017 10:47:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[UPDATE_STUDENT_Permission]
@StudenttId			INT,
@IsAllowEdit        bit

AS
BEGIN
	UPDATE Student_Table

    SET IsAllowEdit = @IsAllowEdit
		
		WHERE studentId = @StudenttId;	
END

GO

/****** Object: SqlProcedure [dbo].[UPDATE_STUDENT_PROFILE] Script Date: 5/6/2017 10:47:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_STUDENT_PROFILE]
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX)
AS
BEGIN
	UPDATE Student_Table

    SET firstName = @firstName,
		lastName  = @lastName,
		email	  = @email,
		userName  = @userName
		
		WHERE userName = @userName;	
END

GO

/****** Object: SqlProcedure [dbo].[UpdateAccountProfile] Script Date: 5/6/2017 10:47:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[UpdateAccountProfile]
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX)
AS
BEGIN
	UPDATE		Account 
    SET			FirstName = @firstName,
				LastName  = @lastName,
				EmailID	  = @email,
				UserName  = @userName
		
	WHERE		UserName = @userName;	
END

GO

/****** Object: SqlProcedure [dbo].[UpdateStudentPermission] Script Date: 5/6/2017 10:47:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROC [dbo].UpdateStudentPermission
@StudenttId			INT,
@IsAllowEdit        bit

AS
BEGIN
	UPDATE Account

    SET IsAllowEdit = @IsAllowEdit
		
		WHERE AccountId = @StudenttId;	
END

INSERT INTO [dbo].[Account] ([FirstName], [LastName], [EmailID], [UserName], [Password], [IsAllowEdit], [IsActive], [IsAdmin]) VALUES (N'admin', N'admin', N'admin@admin.com', N'admin', N'admin', 1, 1, 1)











