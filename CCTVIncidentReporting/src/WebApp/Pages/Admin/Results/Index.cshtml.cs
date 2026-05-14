using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Results;

public class ResultsIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ResultsIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<IncidentResult>? Results { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.IncidentResults.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(r => r.Name.Contains(searchString) || (r.Description != null && r.Description.Contains(searchString)));
        }

        Results = await query.OrderBy(r => r.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var result = await _context.IncidentResults.FindAsync(id);
        if (result != null)
        {
            _context.IncidentResults.Remove(result);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
