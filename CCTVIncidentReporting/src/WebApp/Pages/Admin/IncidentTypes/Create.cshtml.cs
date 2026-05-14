using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.IncidentTypes;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentType IncidentType { get; set; } = new();

    public IActionResult OnGet()
    {
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        IncidentType.Active = true;
        _context.IncidentTypes.Add(IncidentType);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}
