using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Operators;

public class CreateModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public CreateModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public Operator Operator { get; set; } = new();

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

        Operator.Active = true;
        _context.Operators.Add(Operator);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}
