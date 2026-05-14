using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Results;

public class EditModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public EditModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentResult IncidentResult { get; set; } = new();

    public async Task<IActionResult> OnGetAsync(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        IncidentResult = await _context.IncidentResults.FirstOrDefaultAsync(m => m.Id == id);
        if (IncidentResult == null)
        {
            return NotFound();
        }

        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        var result = await _context.IncidentResults.FindAsync(IncidentResult.Id);
        if (result == null)
        {
            return NotFound();
        }

        result.Name = IncidentResult.Name;
        result.Description = IncidentResult.Description;
        result.Active = IncidentResult.Active;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!ResultExists(IncidentResult.Id))
            {
                return NotFound();
            }
            throw;
        }

        return RedirectToPage("./Index");
    }

    private bool ResultExists(int id)
    {
        return _context.IncidentResults.Any(e => e.Id == id);
    }
}
