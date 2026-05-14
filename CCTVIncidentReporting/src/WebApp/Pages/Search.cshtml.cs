using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages;

public class SearchModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public SearchModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Results { get; set; }
    public string? Query { get; set; }
    public List<string>? IncidentTypes { get; set; }
    public List<string>? Areas { get; set; }
    public List<string>? Operators { get; set; }
    public string? SelectedType { get; set; }
    public string? SelectedArea { get; set; }
    public string? SelectedOperator { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }

    public async Task OnGetAsync(string? q, string? type, string? area, string? op, string? startDate, string? endDate)
    {
        Query = q;
        SelectedType = type;
        SelectedArea = area;
        SelectedOperator = op;

        // Load filter options
        IncidentTypes = await _context.Incidents
            .Select(i => i.IncidentType)
            .Distinct()
            .OrderBy(t => t)
            .ToListAsync();

        Areas = await _context.Incidents
            .Select(i => i.Area)
            .Distinct()
            .OrderBy(a => a)
            .ToListAsync();

        Operators = await _context.Incidents
            .Select(i => i.Operator)
            .Distinct()
            .OrderBy(o => o)
            .ToListAsync();

        var query = _context.Incidents.AsQueryable();

        // Text search
        if (!string.IsNullOrEmpty(q))
        {
            query = query.Where(i =>
                i.IncidentType.Contains(q) ||
                i.Area.Contains(q) ||
                i.Operator.Contains(q) ||
                i.SubArea.Contains(q) ||
                (i.Description != null && i.Description.Contains(q)) ||
                (i.Action != null && i.Action.Contains(q)));
        }

        // Filter by type
        if (!string.IsNullOrEmpty(type))
        {
            query = query.Where(i => i.IncidentType == type);
        }

        // Filter by area
        if (!string.IsNullOrEmpty(area))
        {
            query = query.Where(i => i.Area == area);
        }

        // Filter by operator
        if (!string.IsNullOrEmpty(op))
        {
            query = query.Where(i => i.Operator == op);
        }

        // Filter by date range
        if (DateTime.TryParse(startDate, out var start))
        {
            StartDate = start;
            query = query.Where(i => i.Date >= start);
        }

        if (DateTime.TryParse(endDate, out var end))
        {
            EndDate = end.AddDays(1); // Include entire end day
            query = query.Where(i => i.Date <= EndDate);
        }

        Results = await query.OrderByDescending(i => i.Date).ToListAsync();
    }
}
