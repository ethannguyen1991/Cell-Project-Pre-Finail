CREATE PROC [dbo].[GET_STUDENT_LIST_FOR_GRADE]
AS
BEGIN

	SELECT 
			CMT.Comments							AS COMMENT,
			CMT.ScenarioID							AS SCID,
			(ST.firstName+ST.lastName)	AS STUDENTNAME,
			CMT.[Grade]								AS GRADE,
			SC.Name									AS LEVEL,
			CMT.CommentID							AS COMMENTID
			 
	FROM	
			Comment	 AS CMT

			INNER JOIN

			Scenario AS SC

			ON      
				CMT.ScenarioID = SC.ScenarioID

			INNER JOIN

			Student_Table		AS ST

			ON		
				ST.[studentId]  = CMT.StudentID
END