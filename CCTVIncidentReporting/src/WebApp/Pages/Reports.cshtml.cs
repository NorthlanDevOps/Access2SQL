using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages;

public class ReportsModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ReportsModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public int TotalIncidents { get; set; }
    public int PendingIncidents { get; set; }
    public int ConfirmedIncidents { get; set; }
    public Dictionary<string, int> IncidentsByType { get; set; } = new();
    public Dictionary<string, int> IncidentsByOperator { get; set; } = new();
    public Dictionary<string, int> IncidentsByArea { get; set; } = new();

    public async Task OnGetAsync()
    {
        TotalIncidents = await _context.Incidents.CountAsync();
        PendingIncidents = await _context.Incidents.Where(i => string.IsNullOrEmpty(i.Action)).CountAsync();
        ConfirmedIncidents = await _context.Incidents.Where(i => !string.IsNullOrEmpty(i.Action)).CountAsync();

        IncidentsByType = await _context.Incidents
            .GroupBy(i => i.IncidentType)
            .Select(g => new { Type = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Type, x => x.Count);

        IncidentsByOperator = await _context.Incidents
            .GroupBy(i => i.Operator)
            .Select(g => new { Operator = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Operator, x => x.Count);

        IncidentsByArea = await _context.Incidents
            .GroupBy(i => i.Area)
            .Select(g => new { Area = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Area, x => x.Count);
    }
}
