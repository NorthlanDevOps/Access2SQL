using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class ByTypeModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ByTypeModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public List<string>? Types { get; set; }
    public string? SelectedType { get; set; }

    public async Task OnGetAsync(string? typeName)
    {
        SelectedType = typeName;

        // Load available types
        Types = await _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.IncidentType))
            .Select(i => i.IncidentType)
            .Distinct()
            .OrderBy(t => t)
            .ToListAsync();

        // Load incidents filtered by type
        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(typeName))
        {
            query = query.Where(i => i.IncidentType == typeName);
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
