using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.IncidentTypes;

public class IncidentTypesIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public IncidentTypesIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<IncidentType>? IncidentTypes { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.IncidentTypes.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(i => i.Name.Contains(searchString) || (i.Code != null && i.Code.Contains(searchString)));
        }

        IncidentTypes = await query.OrderBy(i => i.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var type = await _context.IncidentTypes.FindAsync(id);
        if (type != null)
        {
            _context.IncidentTypes.Remove(type);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
