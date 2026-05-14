using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Operators;

public class EditModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public EditModel(ApplicationDbContext context)
    {
        _context = context;
    }

    [BindProperty]
    public Operator Operator { get; set; } = new();

    public async Task<IActionResult> OnGetAsync(int? id)
    {
        if (id == null)
        {
            return NotFound();
        }

        Operator = await _context.Operators.FirstOrDefaultAsync(m => m.Id == id);
        if (Operator == null)
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

        var op = await _context.Operators.FindAsync(Operator.Id);
        if (op == null)
        {
            return NotFound();
        }

        op.Name = Operator.Name;
        op.EmployeeId = Operator.EmployeeId;
        op.Email = Operator.Email;
        op.Active = Operator.Active;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!OperatorExists(Operator.Id))
            {
                return NotFound();
            }
            throw;
        }

        return RedirectToPage("./Index");
    }

    private bool OperatorExists(int id)
    {
        return _context.Operators.Any(e => e.Id == id);
    }
}
