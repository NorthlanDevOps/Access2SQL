using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public Incident Incident { get; set; } = new();

    public SelectList IncidentTypes { get; set; } = new(new List<SelectListItem>());
    public SelectList Areas { get; set; } = new(new List<SelectListItem>());
    public SelectList Watches { get; set; } = new(new List<SelectListItem>());
    public SelectList Operators { get; set; } = new(new List<SelectListItem>());

    public async Task OnGetAsync()
    {
        await LoadDropdowns();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadDropdowns();
            return Page();
        }

        Incident.CreatedAt = DateTime.UtcNow;
        _context.Incidents.Add(Incident);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index", new { message = "Incident created successfully" });
    }

    private async Task LoadDropdowns()
    {
        var incidentTypes = await _context.IncidentTypes
            .Where(x => x.Active)
            .Select(x => new SelectListItem { Text = x.Name, Value = x.Name })
            .ToListAsync();

        var areas = await _context.Areas
            .Where(x => x.Active)
            .Select(x => new SelectListItem { Text = x.Name, Value = x.Name })
            .ToListAsync();

        var watches = await _context.Watches
            .Where(x => x.Active)
            .Select(x => new SelectListItem { Text = x.Name, Value = x.Name })
            .ToListAsync();

        var operators = await _context.Operators
            .Where(x => x.Active)
            .Select(x => new SelectListItem { Text = x.Name, Value = x.Name })
            .ToListAsync();

        IncidentTypes = new SelectList(incidentTypes, "Value", "Text");
        Areas = new SelectList(areas, "Value", "Text");
        Watches = new SelectList(watches, "Value", "Text");
        Operators = new SelectList(operators, "Value", "Text");
    }
}
