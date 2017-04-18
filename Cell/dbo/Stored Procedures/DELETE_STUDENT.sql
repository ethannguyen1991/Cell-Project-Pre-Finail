CREATE PROC [dbo].[DELETE_STUDENT]
@studentId		INT
AS
BEGIN
	DELETE FROM Student_Table WHERE studentId = @studentId
END