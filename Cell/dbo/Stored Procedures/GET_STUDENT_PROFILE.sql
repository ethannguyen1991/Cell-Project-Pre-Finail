CREATE PROC [dbo].[GET_STUDENT_PROFILE]
@studentId	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	ST.firstName AS FIRSTNAME,
	ST.lastName  AS LASTNAME,
	ST.email     AS EMAIL,
	ST.userName  AS USERNAME
	FROM Student_Table  ST 

	WHERE ST.[studentId] = @studentId
END