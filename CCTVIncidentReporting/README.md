# CCTV Incident Reporting System

A modern ASP.NET Core web application for managing CCTV incident reports, migrated from a Microsoft Access database.

## Features

- 📋 **Incident Management**: Create, read, update, and delete incident reports
- 👤 **Operator Management**: Manage CCTV operators and their assignments
- 📍 **Area Management**: Define and manage geographic areas
- ⏰ **Watch Management**: Manage watch periods and schedules
- 📊 **Reporting & Analytics**: View incident statistics and trends
- 🎨 **Modern UI**: GitHub-inspired design with responsive layout
- 🔒 **Data Persistence**: SQLite database with Entity Framework Core

## Technology Stack

- **Framework**: ASP.NET Core 10.0
- **ORM**: Entity Framework Core
- **Database**: SQLite
- **Frontend**: Razor Pages with modern CSS
- **Language**: C# 12

## Getting Started

### Prerequisites

- .NET 10.0 SDK or later
- Visual Studio Code or Visual Studio 2022 (optional)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd CCTVIncidentReporting/src/WebApp
```

2. Build the application
```bash
dotnet build
```

3. Run the application
```bash
dotnet run
```

The application will start at `https://localhost:5001` or `http://localhost:5000`

### Database Initialization

The application automatically creates and initializes the SQLite database on first run. The database file (`cctv_incidents.db`) will be created in the project root.

## Project Structure

```
src/WebApp/
├── Domain/                 # Entity models
│   └── Models.cs
├── Infrastructure/         # Database context and configuration
│   └── ApplicationDbContext.cs
├── Pages/                  # Razor pages
│   ├── Index.cshtml       # Home page
│   ├── Error.cshtml       # Error page
│   ├── Incidents/         # Incident management pages
│   ├── Admin/             # Administration pages
│   ├── Reports/           # Reporting pages
│   └── Shared/            # Shared layout and components
├── wwwroot/               # Static files
│   ├── css/
│   │   └── site.css       # GitHub-inspired styling
│   └── js/
├── Program.cs             # Application startup
├── appsettings.json       # Configuration
└── WebApp.csproj          # Project file
```

## Usage

### Creating an Incident Report

1. Navigate to **Incidents** → **+ New Incident**
2. Fill in the required fields:
   - Date & Time
   - Incident Type
   - Area
   - Sub Area
   - Watch
   - Operator
   - Description (optional)
   - Action Taken (optional)
3. Click **Create Incident**

### Viewing Incidents

- **All Incidents**: View all recorded incidents with search functionality
- **Details**: Click "View" to see full incident details
- **Edit**: Click "Edit" to modify incident information

### Administration

Access the **Admin** panel to manage:
- Areas
- Operators
- Watches
- Incident Types
- Results
- Sources

### Reports & Analytics

View incident statistics including:
- Total incidents
- Incidents this month
- Incidents by type
- Incidents by area

## API Endpoints

The application uses Razor Pages for navigation. Key routes:

- `GET /` - Home page
- `GET /Incidents/Index` - List all incidents
- `GET /Incidents/Create` - Create incident form
- `POST /Incidents/Create` - Submit incident
- `GET /Incidents/Details/{id}` - View incident details
- `GET /Incidents/Edit/{id}` - Edit incident form
- `POST /Incidents/Edit/{id}` - Update incident
- `GET /Admin/Index` - Admin dashboard
- `GET /Reports/Index` - Reports dashboard

## Configuration

### Database Connection

Edit `appsettings.json` to change the database location:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Data Source=cctv_incidents.db"
  }
}
```

## Development

### Running in Development Mode

```bash
dotnet run --launch-profile https
```

### Entity Framework Migrations

To add a new migration after modifying models:

```bash
dotnet ef migrations add MigrationName
dotnet ef database update
```

## Design

The application features a GitHub-inspired design with:
- Clean, minimal layout
- Dark navigation bar
- Responsive grid system
- Consistent spacing and typography
- Professional color scheme (blue accents, neutral grays)
- Mobile-friendly interface

## License

This project is licensed under the MIT License.

## Support

For issues or questions, please open an issue in the repository.

## Migration Notes

This application was migrated from a Microsoft Access database. The original database included:
- Forms for incident reporting and data entry
- Queries for incident analysis and filtering
- VBA modules with business logic

The web application preserves the core functionality while modernizing the architecture for web deployment.
