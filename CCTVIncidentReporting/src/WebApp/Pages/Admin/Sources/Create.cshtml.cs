using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Sources;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentSource IncidentSource { get; set; } = new();

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

        IncidentSource.Active = true;
        _context.IncidentSources.Add(IncidentSource);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}
