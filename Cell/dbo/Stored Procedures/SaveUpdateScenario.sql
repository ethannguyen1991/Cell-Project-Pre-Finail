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