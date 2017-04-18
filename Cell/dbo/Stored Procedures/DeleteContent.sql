CREATE PROC [dbo].[DeleteContent]
@ContentId		INT
AS
BEGIN
DELETE FROM Content WHERE ContentID = @ContentId;
END