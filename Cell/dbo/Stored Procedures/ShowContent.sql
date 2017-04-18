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