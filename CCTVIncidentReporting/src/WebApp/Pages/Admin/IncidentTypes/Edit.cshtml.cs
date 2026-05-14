using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.IncidentTypes;

public class EditModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public EditModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentType IncidentType { get; set; } = new();

    public async Task<IActionResult> OnGetAsync(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        IncidentType = await _context.IncidentTypes.FirstOrDefaultAsync(m => m.Id == id);
        if (IncidentType == null)
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

        var type = await _context.IncidentTypes.FindAsync(IncidentType.Id);
        if (type == null)
        {
            return NotFound();
        }

        type.Name = IncidentType.Name;
        type.Code = IncidentType.Code;
        type.Active = IncidentType.Active;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!IncidentTypeExists(IncidentType.Id))
            {
                return NotFound();
            }
            throw;
        }

        return RedirectToPage("./Index");
    }

    private bool IncidentTypeExists(int id)
    {
        return _context.IncidentTypes.Any(e => e.Id == id);
    }
}
