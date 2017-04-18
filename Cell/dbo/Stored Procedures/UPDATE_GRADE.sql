CREATE PROC [dbo].[UPDATE_GRADE]
@commentId			INT,
@grade				VARCHAR(MAX)

AS
BEGIN
		UPDATE Comment
		
		SET		Grade = @grade 

		WHERE	CommentID = @commentId;
END