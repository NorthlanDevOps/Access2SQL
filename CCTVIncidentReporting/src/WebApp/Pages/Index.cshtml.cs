using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages;

public class IndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public IndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? RecentIncidents { get; set; }

    public async Task OnGetAsync()
    {
        RecentIncidents = await _context.Incidents
            .OrderByDescending(i => i.Date)
            .Take(10)
            .ToListAsync();
    }
}
