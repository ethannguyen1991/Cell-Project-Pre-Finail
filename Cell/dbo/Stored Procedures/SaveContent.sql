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