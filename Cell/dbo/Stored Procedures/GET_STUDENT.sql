CREATE PROC	[dbo].[GET_STUDENT]
AS
BEGIN
	
	SELECT  
	ST.studentId AS STUDENTID,st.IsAllowEdit,
	(ST.firstName+ST.lastName) AS STUDENTNAME
	FROM Student_Table ST
END