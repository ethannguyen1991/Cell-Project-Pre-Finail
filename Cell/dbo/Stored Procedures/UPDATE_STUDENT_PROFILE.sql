CREATE PROC [dbo].[UPDATE_STUDENT_PROFILE]
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX)
AS
BEGIN
	UPDATE Student_Table

    SET firstName = @firstName,
		lastName  = @lastName,
		email	  = @email,
		userName  = @userName
		
		WHERE userName = @userName;	
END