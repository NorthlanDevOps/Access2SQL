using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class MonitoredModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public MonitoredModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Results { get; set; }
    public int TotalCount { get; set; }
    public int MonitoredOnlyCount { get; set; }
    public int MonitoredNoActionCount { get; set; }

    public async Task OnGetAsync(string? status = null)
    {
        Status = status;

        // Monitored incidents are those with a Description (action recorded/monitored)
        var monitoredQuery = _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.Description))
            .OrderByDescending(i => i.Date);

        TotalCount = await _context.Incidents.CountAsync();
        MonitoredOnlyCount = await monitoredQuery.CountAsync();
        MonitoredNoActionCount = await monitoredQuery.Where(i => string.IsNullOrEmpty(i.Action)).CountAsync();

        if (status == "noaction")
        {
            Results = await monitoredQuery.Where(i => string.IsNullOrEmpty(i.Action)).ToListAsync();
        }
        else
        {
            Results = await monitoredQuery.ToListAsync();
        }
    }

    public string? Status { get; set; }
}
