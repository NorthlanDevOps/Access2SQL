using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin.Operators;

public class OperatorsIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public OperatorsIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Operator>? Operators { get; set; }
    public string? SearchString { get; set; }

    public async Task OnGetAsync(string? searchString)
    {
        SearchString = searchString;

        var query = _context.Operators.AsQueryable();

        if (!string.IsNullOrEmpty(searchString))
        {
            query = query.Where(o => o.Name.Contains(searchString) || (o.EmployeeId != null && o.EmployeeId.Contains(searchString)) || (o.Email != null && o.Email.Contains(searchString)));
        }

        Operators = await query.OrderBy(o => o.Name).ToListAsync();
    }

    public async Task<IActionResult> OnGetDeleteAsync(int id)
    {
        var op = await _context.Operators.FindAsync(id);
        if (op != null)
        {
            _context.Operators.Remove(op);
            await _context.SaveChangesAsync();
        }

        return RedirectToPage();
    }
}
