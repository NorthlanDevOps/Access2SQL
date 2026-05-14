using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using WebApp.Domain;
using WebApp.Infrastructure;

namespace WebApp.Pages.Incidents;

public class ByOperatorModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public ByOperatorModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public IList<Incident>? Incidents { get; set; }
    public List<string>? Operators { get; set; }
    public string? SelectedOperator { get; set; }

    public async Task OnGetAsync(string? operatorName)
    {
        SelectedOperator = operatorName;

        // Load available operators
        Operators = await _context.Incidents
            .Where(i => !string.IsNullOrEmpty(i.Operator))
            .Select(i => i.Operator)
            .Distinct()
            .OrderBy(o => o)
            .ToListAsync();

        // Load incidents filtered by operator
        var query = _context.Incidents.AsQueryable();

        if (!string.IsNullOrEmpty(operatorName))
        {
            query = query.Where(i => i.Operator == operatorName);
        }

        Incidents = await query
            .OrderByDescending(i => i.Date)
            .ToListAsync();
    }
}
