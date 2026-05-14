using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Watches;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public Watch Watch { get; set; } = new();

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

        Watch.Active = true;
        _context.Watches.Add(Watch);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}
