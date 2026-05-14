using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Infrastructure;

namespace WebApp.Pages.Reports;

public class ReportsIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ReportsIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public int TotalIncidents { get; set; }
    public int ThisMonthIncidents { get; set; }
    public int UniqueAreas { get; set; }
    public int ActiveOperators { get; set; }
    public Dictionary<string, int>? IncidentsByType { get; set; }
    public Dictionary<string, int>? IncidentsByArea { get; set; }

    public async Task OnGetAsync()
    {
        TotalIncidents = await _context.Incidents.CountAsync();
        
        var thisMonth = DateTime.UtcNow.AddMonths(-1);
        ThisMonthIncidents = await _context.Incidents
            .Where(i => i.Date >= thisMonth)
            .CountAsync();

        UniqueAreas = await _context.Incidents
            .Select(i => i.Area)
            .Distinct()
            .CountAsync();

        ActiveOperators = await _context.Operators
            .Where(o => o.Active)
            .CountAsync();

        IncidentsByType = await _context.Incidents
            .GroupBy(i => i.IncidentType)
            .Select(g => new { Type = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Type, x => x.Count);

        IncidentsByArea = await _context.Incidents
            .GroupBy(i => i.Area)
            .Select(g => new { Area = g.Key, Count = g.Count() })
            .ToDictionaryAsync(x => x.Area, x => x.Count);
    }
}
