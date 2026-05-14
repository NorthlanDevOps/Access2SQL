using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class IncidentsIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public IncidentsIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(i => 
                i.IncidentType.Contains(searchString) ||
                i.Area.Contains(searchString) ||
                i.Operator.Contains(searchString) ||
                i.Description!.Contains(searchString));
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
