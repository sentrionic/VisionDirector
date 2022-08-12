namespace API;

public static class Constants
{
    // Typed AuthorizationHandlers 
    public const string IsScenarioOwner = "IsScenarioOwner";
    public const string IsAdmin = "IsAdmin";
    public const string IsProjectCollaborator = "IsProjectCollaborator";
    public const string IsScenarioCollaborator = "IsScenarioCollaborator";
    public const string IsProjectHubCollaborator = "IsProjectHubCollaborator";
    public const string IsEngineer = "IsEngineer";
    public const string IsEngineerOrAdmin = "IsEngineerOrAdmin";

    // Typed ScenarioHub Methods
    public const string AddSteps = "AddSteps";
    public const string ChangePosition = "ChangePosition";
    public const string EditStep = "EditStep";
    public const string EditSteps = "EditSteps";
    public const string RemoveStep = "RemoveStep";
    public const string ToggleLock = "ToggleLock";
    public const string UpdateScenario = "UpdateScenario";
    public const string AddTask = "AddTask";
    public const string EditTask = "EditTask";
    
    // Typed ChatHub Methods
    public const string ReceiveComment = "ReceiveComment";
}
