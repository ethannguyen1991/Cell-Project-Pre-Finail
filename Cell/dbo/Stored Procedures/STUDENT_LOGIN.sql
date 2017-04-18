CREATE PROC [dbo].[STUDENT_LOGIN]

	@UserName			VARCHAR(100),
	@Password			VARCHAR(100),
	@StudentId			INT OUT,
	@IsAllowEdit		bit OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [dbo].[Student_Table] WHERE userName = @UserName AND [Password] = @Password AND IsActive = 1)
	BEGIN
		SELECT 
			@StudentId = studentId,
			@IsAllowEdit=IsAllowEdit
		FROM 
			[dbo].[Student_Table]
		WHERE 
			userName = @UserName 
		AND 
			[Password] = @Password
	END
END