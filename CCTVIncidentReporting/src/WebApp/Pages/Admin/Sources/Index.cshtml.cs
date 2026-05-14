using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Sources;

public class SourcesIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public SourcesIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<IncidentSource>? Sources { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.IncidentSources.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(s => s.Name.Contains(searchString) || (s.Code != null && s.Code.Contains(searchString)));
        }

        Sources = await query.OrderBy(s => s.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var source = await _context.IncidentSources.FindAsync(id);
        if (source != null)
        {
            _context.IncidentSources.Remove(source);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
