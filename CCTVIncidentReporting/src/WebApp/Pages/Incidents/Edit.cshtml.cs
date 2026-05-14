using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class EditModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public EditModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public Incident Incident { get; set; } = new();

    public SelectList IncidentTypes { get; set; } = new(new List<SelectListItem>());
    public SelectList Areas { get; set; } = new(new List<SelectListItem>());
    public SelectList Watches { get; set; } = new(new List<SelectListItem>());
    public SelectList Operators { get; set; } = new(new List<SelectListItem>());

    public async Task<IActionResult> OnGetAsync(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        Incident = await _context.Incidents.FirstOrDefaultAsync(m => m.Id == id);
        if (Incident == null)
        {
            return NotFound();
        }

        await LoadDropdowns();
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            await LoadDropdowns();
            return Page();
        }

        var incident = await _context.Incidents.FindAsync(Incident.Id);
        if (incident == null)
        {
            return NotFound();
        }

        incident.Date = Incident.Date;
        incident.IncidentType = Incident.IncidentType;
        incident.Area = Incident.Area;
        incident.SubArea = Incident.SubArea;
        incident.Watch = Incident.Watch;
        incident.Operator = Incident.Operator;
        incident.Description = Incident.Description;
        incident.Action = Incident.Action;
        incident.UpdatedAt = DateTime.UtcNow;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!IncidentExists(Incident.Id))
            {
                return NotFound();
            }
            throw;
        }

        return RedirectToPage("./Details", new { id = Incident.Id });
    }

    private bool IncidentExists(int id)
    {
        return _context.Incidents.Any(e => e.Id == id);
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

        IncidentTypes = new SelectList(incidentTypes, "Value", "Text", Incident.IncidentType);
        Areas = new SelectList(areas, "Value", "Text", Incident.Area);
        Watches = new SelectList(watches, "Value", "Text", Incident.Watch);
        Operators = new SelectList(operators, "Value", "Text", Incident.Operator);
    }
}
