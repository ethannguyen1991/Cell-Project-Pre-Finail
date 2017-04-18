CREATE PROC [dbo].[DeleteScenario]
@ScenarioID	INT
AS
BEGIN
DELETE FROM Scenario WHERE ScenarioID = @ScenarioID
END