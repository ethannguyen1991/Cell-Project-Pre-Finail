CREATE PROC [dbo].[ShowContentByScenarioID]
	@UserID						INT,
	@ScenarioID					INT 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText
	FROM
		Content					AS CONT
	INNER JOIN
		ScenarioContent			AS SC
	ON
		CONT.ContentID = SC.ContentID
	WHERE
		CONT.IsActive = 1
	AND
		(SC.ScenarioID = @ScenarioID)
END