using Microsoft.AspNetCore.Mvc.RazorPages;
using WebApp.Infrastructure;

namespace WebApp.Pages.Admin;

public class AdminIndexModel : PageModel
{
    private readonly ApplicationDbContext _context;

    public AdminIndexModel(ApplicationDbContext context)
    {
        _context = context;
    }

    public void OnGet()
    {
    }
}
