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