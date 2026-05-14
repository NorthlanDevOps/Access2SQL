using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Watches;

public class WatchesIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public WatchesIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Watch>? Watches { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.Watches.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(w => w.Name.Contains(searchString) || (w.Code != null && w.Code.Contains(searchString)));
        }

        Watches = await query.OrderBy(w => w.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var watch = await _context.Watches.FindAsync(id);
        if (watch != null)
        {
            _context.Watches.Remove(watch);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
