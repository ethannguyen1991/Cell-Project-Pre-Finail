CREATE PROC [dbo].[SaveScenario]
	@ScenarioID					INT,
	@Name						VARCHAR(50),
	@Welcome					VARCHAR(MAX),
	@LearnAbt					VARCHAR(MAX),
	@Desc					VARCHAR(MAX),
	@Details					VARCHAR(MAX),
	@Rank						VARCHAR(50),
	@Image						VARCHAR(200) = NULL,
	@IsCreatedByStudent			BIT,
	@CreatedBy					INT,
	@NewScenarioID				INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM Scenario WHERE ScenarioID = @ScenarioID AND @ScenarioID != -1)
	BEGIN
		UPDATE
			Scenario
		SET
			Name = @Name, Welcome = @Welcome, LearnAbout = @LearnAbt,Desciption = @Desc,Details = @Details,[Rank]=@Rank,[Image] = @Image, 
			IsCreatedByStudent = @IsCreatedByStudent, IsActive = 1
		WHERE
			ScenarioID = @ScenarioID
		SET
			@NewScenarioID = @ScenarioID
	END

	ELSE
	BEGIN
		INSERT INTO
			Scenario(Name,Welcome,LearnAbout,Desciption, Details, [Rank],[Image], IsCreatedByStudent, CreatedBy, CreatedOn, IsActive)
		VALUES
			(@Name,@Welcome,@LearnAbt,@Desc, @Details,@Rank, @Image,@IsCreatedByStudent, @CreatedBy, GETDATE(), 1)

		SET
			@NewScenarioID = SCOPE_IDENTITY();
	END
END