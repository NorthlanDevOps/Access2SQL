using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Results;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public IncidentResult IncidentResult { get; set; } = new();

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

        IncidentResult.Active = true;
        _context.IncidentResults.Add(IncidentResult);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}
