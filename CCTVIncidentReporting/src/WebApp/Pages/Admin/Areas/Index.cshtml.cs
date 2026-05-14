using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Areas;

public class AreasIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public AreasIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Area>? Areas { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.Areas.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(a => a.Name.Contains(searchString) || (a.Code != null && a.Code.Contains(searchString)));
        }

        Areas = await query.OrderBy(a => a.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var area = await _context.Areas.FindAsync(id);
        if (area != null)
        {
            _context.Areas.Remove(area);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
