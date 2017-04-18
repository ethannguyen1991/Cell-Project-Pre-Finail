CREATE PROC [dbo].[SaveSubContent]
	@ParentID				INT,
	@ChildID				INT,
	@IsDeleted				INT
AS
BEGIN
	SET NOCOUNT ON;

	--IF(@IsDeleted = 1)
	--BEGIN
	--	DELETE FROM 
	--		SubContent 
	--	WHERE 
	--		ParentID = @ParentID 
	--	AND 
	--		ChildID = @ChildID
	--END

	--ELSE
	--BEGIN
	--	IF (@ParentID != @ChildID)
	--	BEGIN
			INSERT INTO
				SubContent(ParentID, ChildID, IsActive)
			VALUES
				(@ParentID, @ChildID, 1)
	--	END
	--END
END