create PROC [dbo].[UPDATE_STUDENT_Permission]
@StudenttId			INT,
@IsAllowEdit        bit

AS
BEGIN
	UPDATE Student_Table

    SET IsAllowEdit = @IsAllowEdit
		
		WHERE studentId = @StudenttId;	
END