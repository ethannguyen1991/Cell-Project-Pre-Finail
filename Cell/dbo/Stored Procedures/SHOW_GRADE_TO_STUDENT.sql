CREATE PROC [dbo].[SHOW_GRADE_TO_STUDENT]
@studentId		INT
AS
BEGIN
	
	SELECT 
	
	CT.Comments  AS COMMENT,
	SC.Name		 AS LEVEL,
	CT.Grade     AS GRADE	 
	
	FROM Comment AS CT

	INNER JOIN

	Scenario	AS SC	

	ON	CT.ScenarioID	= SC.ScenarioID

	WHERE CT.StudentID  = @studentId

END