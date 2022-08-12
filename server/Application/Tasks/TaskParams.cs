using System.ComponentModel;

namespace Application.Tasks;

/// <summary>
/// Query Parameters for fetching tasks    
/// </summary>
[DisplayName("TaskParams")]
public class TaskParams
{
    public Guid? StepId { get; set; }
    public Guid? AssigneeId { get; set; }
    public bool IsMain { get; set; }
}
