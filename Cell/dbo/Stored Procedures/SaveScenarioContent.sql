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