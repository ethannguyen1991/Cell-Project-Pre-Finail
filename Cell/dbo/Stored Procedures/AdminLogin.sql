CREATE PROC [dbo].[AdminLogin]
	@UserName			VARCHAR(100),
	@Password			VARCHAR(100),
	@AdminID			INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [Admin] WHERE UserName = @UserName AND [Password] = @Password AND IsActive = 1)
	BEGIN
		SELECT 
			@AdminID = AdminID 
		FROM 
			[Admin] 
		WHERE 
			UserName = @UserName 
		AND 
			[Password] = @Password
	END
END