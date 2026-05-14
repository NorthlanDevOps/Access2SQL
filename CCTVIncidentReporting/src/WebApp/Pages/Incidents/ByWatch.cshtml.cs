using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class ByWatchModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ByWatchModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public List<string>? Watches { get; set; }
    public string? SelectedWatch { get; set; }

    public async Task OnGetAsync(string? watchName)
    {
        SelectedWatch = watchName;

        // Load available watches
        Watches = await _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.Watch))
            .Select(i => i.Watch)
            .Distinct()
            .OrderBy(w => w)
            .ToListAsync();

        // Load incidents filtered by watch
        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(watchName))
        {
            query = query.Where(i => i.Watch == watchName);
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
