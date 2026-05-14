using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Sources;

public class EditModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public EditModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentSource IncidentSource { get; set; } = new();

    public async Task<IActionResult> OnGetAsync(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        IncidentSource = await _context.IncidentSources.FirstOrDefaultAsync(m => m.Id == id);
        if (IncidentSource == null)
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

        var source = await _context.IncidentSources.FindAsync(IncidentSource.Id);
        if (source == null)
        {
            return NotFound();
        }

        source.Name = IncidentSource.Name;
        source.Code = IncidentSource.Code;
        source.Active = IncidentSource.Active;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!SourceExists(IncidentSource.Id))
            {
                return NotFound();
            }
            throw;
        }

        return RedirectToPage("./Index");
    }

    private bool SourceExists(int id)
    {
        return _context.IncidentSources.Any(e => e.Id == id);
    }
}
