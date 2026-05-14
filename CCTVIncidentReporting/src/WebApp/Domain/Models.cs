namespace WebApp.Domain;

public class Incident
{
    public int Id { get; set; }
    public string IncidentType { get; set; } = string.Empty;
    public DateTime Date { get; set; }
    public string Area { get; set; } = string.Empty;
    public string Watch { get; set; } = string.Empty;
    public string Operator { get; set; } = string.Empty;
    public string SubArea { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string? Action { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
}

public class Area
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Code { get; set; }
    public bool Active { get; set; } = true;
}

public class Watch
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Code { get; set; }
    public bool Active { get; set; } = true;
}

public class Operator
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? EmployeeId { get; set; }
    public string? Email { get; set; }
    public bool Active { get; set; } = true;
}

public class IncidentType
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Code { get; set; }
    public bool Active { get; set; } = true;
}

public class IncidentResult
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public bool Active { get; set; } = true;
}

public class IncidentSource
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Code { get; set; }
    public bool Active { get; set; } = true;
}
