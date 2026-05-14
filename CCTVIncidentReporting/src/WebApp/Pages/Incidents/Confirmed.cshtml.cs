using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class ConfirmedModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ConfirmedModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }

    public async Task OnGetAsync()
    {
        // Confirmed incidents: those with both action and description recorded
        Incidents = await _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.Description) && !string.IsNullOrEmpty(i.Action))
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
