CREATE PROC [dbo].[ShowScenario]
	@UserID						INT = NULL,
	@ScenarioID					INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		--'Scenario ' + 
		--CONVERT(VARCHAR, ROW_NUMBER() 
		--OVER(PARTITION BY ScenarioID ORDER BY ScenarioID ASC)) AS ScenarioNumber,
		SCN.Name				AS ScenarioNumber,
		SCN.ScenarioID			AS ScenarioID,
		SCN.Name				AS Name,
		SCN.Welcome				AS Welcome,
		SCN.LearnAbout				AS LearnAbout,
		scn.Desciption			as Desciption,
		SCN.Details				AS Details,
		SCN.[Image]				AS [Image],
		SCN.[Rank]				AS [Rank]
		
	FROM 
		Scenario				AS SCN
	WHERE
		SCN.IsActive = 1
	AND
		(SCN.ScenarioID = @ScenarioID OR @ScenarioID IS NULL)
END