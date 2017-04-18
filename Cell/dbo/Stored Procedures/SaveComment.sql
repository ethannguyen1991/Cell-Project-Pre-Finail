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