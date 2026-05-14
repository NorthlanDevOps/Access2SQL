using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

[Authorize]
public class MyIncidentsModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public MyIncidentsModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Results { get; set; }
    public int TotalCount { get; set; }
    public int PendingCount { get; set; }

    public async Task OnGetAsync()
    {
        var currentUser = User.Identity?.Name ?? string.Empty;
        
        var query = _context.Incidents
            .Where(i => i.Operator == currentUser)
            .OrderByDescending(i => i.Date);

        TotalCount = await _context.Incidents.CountAsync();
        PendingCount = await query.Where(i => string.IsNullOrEmpty(i.Action)).CountAsync();
        
        Results = await query.ToListAsync();
    }
}
