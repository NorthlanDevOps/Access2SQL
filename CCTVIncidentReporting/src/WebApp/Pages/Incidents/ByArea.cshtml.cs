using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class ByAreaModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ByAreaModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public List<string>? Areas { get; set; }
    public string? SelectedArea { get; set; }

    public async Task OnGetAsync(string? areaName)
    {
        SelectedArea = areaName;

        // Load available areas
        Areas = await _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.Area))
            .Select(i => i.Area)
            .Distinct()
            .OrderBy(a => a)
            .ToListAsync();

        // Load incidents filtered by area
        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(areaName))
        {
            query = query.Where(i => i.Area == areaName);
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
