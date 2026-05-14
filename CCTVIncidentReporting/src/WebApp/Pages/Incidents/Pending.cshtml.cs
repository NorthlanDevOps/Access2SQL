using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class PendingModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public PendingModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }

    public async Task OnGetAsync()
    {
        // Pending incidents: those without action recorded
        Incidents = await _context.Incidents
            .Where(i => string.IsNullOrEmpty(i.Action))
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
