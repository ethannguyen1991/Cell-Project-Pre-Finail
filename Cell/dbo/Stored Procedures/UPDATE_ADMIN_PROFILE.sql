CREATE PROC [dbo].[UPDATE_ADMIN_PROFILE]
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX)
AS
BEGIN
	UPDATE		Admin 
    SET			FName = @firstName,
				LName  = @lastName,
				EmailID	  = @email,
				UserName  = @userName
		
	WHERE		UserName = @userName;	
END