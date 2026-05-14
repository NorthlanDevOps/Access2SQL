# CCTV Incident Reporting System - Build & Deployment Guide

## Quick Start

### Prerequisites
- .NET 10.0 SDK or later
- Command line tool (PowerShell, bash, or cmd)

### Build & Run (Development)

Navigate to the project root and run:

```bash
cd CCTVIncidentReporting/src/WebApp
dotnet build
dotnet run
```

The application will be available at:
- **HTTP**: `http://localhost:5000`
- **HTTPS**: `https://localhost:5001`

The browser will automatically launch to the home page.

### Building for Production

```bash
dotnet publish -c Release -o ./publish
```

The published application will be in the `./publish` folder, ready for deployment.

## Project Structure

```
CCTVIncidentReporting/
├── src/
│   └── WebApp/
│       ├── Domain/                      # Entity models
│       │   └── Models.cs               # Incident, Area, Watch, Operator, etc.
│       ├── Infrastructure/              # Database configuration
│       │   └── ApplicationDbContext.cs
│       ├── Pages/                       # Razor Pages (UI)
│       │   ├── Index.cshtml            # Home page
│       │   ├── Error.cshtml            # Error page
│       │   ├── Incidents/              # Incident CRUD pages
│       │   │   ├── Index.cshtml        # List incidents
│       │   │   ├── Create.cshtml       # Create incident form
│       │   │   ├── Edit.cshtml         # Edit incident form
│       │   │   └── Details.cshtml      # View incident details
│       │   ├── Admin/                  # Administration pages
│       │   ├── Reports/                # Reporting & analytics
│       │   └── Shared/                 # Shared layouts
│       │       ├── _Layout.cshtml      # Master layout
│       │       └── _ValidationScriptsPartial.cshtml
│       ├── wwwroot/                    # Static files
│       │   ├── css/
│       │   │   └── site.css            # GitHub-inspired stylesheet
│       │   └── js/
│       │       └── site.js             # Client-side scripts
│       ├── Migrations/                 # EF Core migrations
│       │   └── 20240511000000_InitialCreate.cs
│       ├── Program.cs                  # Application entry point
│       ├── appsettings.json            # Configuration
│       ├── appsettings.Development.json
│       ├── WebApp.csproj               # Project file
│       └── Properties/
│           └── launchSettings.json
├── CCTVIncidentReporting.sln           # Solution file
└── README.md

```

## Key Features Implemented

### ✅ Database & Models
- 7 core entity models: Incident, Area, Watch, Operator, IncidentType, IncidentResult, IncidentSource
- SQLite database with automatic schema creation
- Entity Framework Core with migrations
- Seeded reference data for quick start

### ✅ Core Functionality
- **Create Incident**: Report new incidents with full details
- **View Incidents**: List all incidents with search capabilities
- **Edit Incidents**: Modify incident information
- **Delete Incidents**: Remove incidents when needed
- **Reports**: Analytics dashboard showing:
  - Total incidents count
  - Monthly incident trends
  - Incidents by type
  - Incidents by area

### ✅ User Interface
- GitHub-inspired modern design
- Responsive layout for desktop and mobile
- Dark navigation bar
- Clean form layouts with validation
- Dashboard cards for navigation
- Professional data tables
- Color-coded badges and alerts

### ✅ Architecture
- Clean separation of concerns (Domain, Infrastructure, Pages)
- Dependency injection for database access
- Razor Pages for UI (lightweight alternative to MVC)
- Automatic database initialization on startup

## Database

### Connection String
Default location: `cctv_incidents.db` (in project root)

To change location, edit `appsettings.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Data Source=path/to/database.db"
  }
}
```

### Initial Data
The following reference data is seeded on first run:

**Incident Types**: Anti-Social Behaviour, Criminal, Community Safety, Traffic
**Results**: Confirmed, No Action Required, Monitored, Dispersed, Arrest
**Sources**: CCTV Operator, Police Report, Public Report, Radio Link
**Areas**: City Center, North District, South District, East District, West District
**Watches**: Morning, Afternoon, Evening, Night
**Operators**: John Smith, Jane Doe, Bob Wilson

## Development

### Running in Debug Mode
```bash
dotnet run --configuration Debug
```

### Creating New Migrations
After modifying entity models:
```bash
dotnet ef migrations add MigrationName
dotnet ef database update
```

### Using Visual Studio
1. Open `CCTVIncidentReporting.sln`
2. Build solution (Ctrl+Shift+B)
3. Run (F5 or Ctrl+F5)

## Deployment

### Azure App Service
1. Publish to folder: `dotnet publish -c Release`
2. Deploy published folder to Azure App Service
3. Configure connection string in App Service settings

### Docker
Create a `Dockerfile`:
```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["src/WebApp/WebApp.csproj", "src/WebApp/"]
RUN dotnet restore "src/WebApp/WebApp.csproj"
COPY . .
RUN dotnet build "src/WebApp/WebApp.csproj" -c Release -o /app/build

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app/build .
EXPOSE 80
ENTRYPOINT ["dotnet", "WebApp.dll"]
```

### IIS
1. Install ASP.NET Core Hosting Bundle
2. Publish application
3. Create site in IIS Manager
4. Configure app pool and bindings

## Testing

### Manual Testing Checklist
- [ ] Create new incident
- [ ] View incident list
- [ ] Search incidents
- [ ] Edit incident
- [ ] Delete incident
- [ ] View incident details
- [ ] Check reports dashboard
- [ ] Verify responsive design on mobile
- [ ] Test form validation

### Expected Behaviors
- Form validation prevents incomplete submissions
- Search filters incidents by type, area, operator, or description
- Dropdowns populate with active reference data
- Incident timestamps record creation and updates
- Reports calculate totals and percentages correctly

## Troubleshooting

### Database Issues
**Problem**: "database is locked" error
**Solution**: Ensure only one instance is running; delete `.db-shm` and `.db-wal` files if corrupted

**Problem**: Migrations not applying
**Solution**: Delete `*.db` files and restart application to recreate database

### Port Already in Use
**Problem**: "address already in use" on port 5000 or 5001
**Solution**: Change ports in `launchSettings.json` or stop other applications using those ports

### Missing Dependencies
**Problem**: "Package not found" errors
**Solution**: 
```bash
dotnet restore
dotnet nuget locals all --clear
dotnet build
```

## Performance Optimization

### Database Indexes
Core queries are optimized with indexes on:
- Incident.Date
- Incident.Area
- Incident.Watch

### Caching (Future Enhancement)
Consider adding:
- Response caching for report queries
- In-memory caching for reference data

## Security Notes

### Future Enhancements
- Add ASP.NET Core Identity for user authentication
- Implement role-based authorization
- Add audit logging for incident changes
- Encrypt sensitive data in database
- Implement API rate limiting

## Support & Maintenance

### Regular Tasks
- Monitor database size
- Archive old incidents annually
- Update .NET dependencies quarterly
- Review and update reference data

### Logging
Application logs are output to console in development. For production, consider:
- Serilog integration
- Application Insights
- Custom logging middleware

## Version History

- **v1.0.0** (2024-05-11): Initial release
  - Core CRUD functionality
  - Reports dashboard
  - GitHub-inspired UI
  - SQLite database with migrations
