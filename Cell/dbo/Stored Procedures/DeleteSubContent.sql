CREATE PROC [dbo].[DeleteSubContent]
@ParentId		INT
AS
BEGIN
DELETE FROM SubContent WHERE ParentID = @ParentId 
END