using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class AllModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public AllModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public string? SearchString { get; set; }
    public string? FilterType { get; set; }

    public async Task OnGetAsync(string? searchString, string? filterType)
    {
        SearchString = searchString;
        FilterType = filterType;

        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(i => 
                i.IncidentType.Contains(searchString) ||
                i.Area.Contains(searchString) ||
                i.Operator.Contains(searchString) ||
                (i.Description != null && i.Description.Contains(searchString)));
        }

        if (!string.IsNullOrEmpty(filterType))
        {
            query = filterType switch
            {
                "pending" => query.Where(i => string.IsNullOrEmpty(i.Action)),
                "confirmed" => query.Where(i => !string.IsNullOrEmpty(i.Description) && !string.IsNullOrEmpty(i.Action)),
                _ => query
            };
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
