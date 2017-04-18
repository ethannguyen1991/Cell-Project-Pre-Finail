CREATE PROC [dbo].[REGISTER_STUDENT]
(
@firstName		VARCHAR(MAX),
@lastName		VARCHAR(MAX),
@email			VARCHAR(MAX),
@userName		VARCHAR(MAX),
@password		VARCHAR(MAX),
@isActive		BIT

)
AS

BEGIN
	
	SET NOCOUNT ON;

		INSERT INTO [dbo].[Student_Table]
		(
			[firstName],
			[lastName],
			[email],
			[userName],
			[password],
			IsActive,
			IsAllowEdit
		)
		VALUES
		(
			@firstName,
			@lastName,
			@email,
			@userName,
			@password,
			@isActive,
			0

		)

END