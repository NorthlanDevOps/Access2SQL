using Microsoft.EntityFrameworkCore;
using WebApp.Domain;

namespace WebApp.Infrastructure;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Incident> Incidents { get; set; } = null!;
    public DbSet<Area> Areas { get; set; } = null!;
    public DbSet<Watch> Watches { get; set; } = null!;
    public DbSet<Operator> Operators { get; set; } = null!;
    public DbSet<IncidentType> IncidentTypes { get; set; } = null!;
    public DbSet<IncidentResult> IncidentResults { get; set; } = null!;
    public DbSet<IncidentSource> IncidentSources { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Incident configuration
        modelBuilder.Entity<Incident>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.IncidentType).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Area).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Watch).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Operator).IsRequired().HasMaxLength(100);
            entity.Property(e => e.SubArea).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Action).HasMaxLength(500);
            entity.HasIndex(e => e.Date);
            entity.HasIndex(e => e.Area);
            entity.HasIndex(e => e.Watch);
        });

        // Area configuration
        modelBuilder.Entity<Area>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Code).HasMaxLength(10);
            entity.HasIndex(e => e.Name).IsUnique();
        });

        // Watch configuration
        modelBuilder.Entity<Watch>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Code).HasMaxLength(10);
            entity.HasIndex(e => e.Name).IsUnique();
        });

        // Operator configuration
        modelBuilder.Entity<Operator>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.EmployeeId).HasMaxLength(20);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.HasIndex(e => e.EmployeeId).IsUnique();
        });

        // IncidentType configuration
        modelBuilder.Entity<IncidentType>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Code).HasMaxLength(10);
            entity.HasIndex(e => e.Name).IsUnique();
        });

        // IncidentResult configuration
        modelBuilder.Entity<IncidentResult>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Description).HasMaxLength(300);
            entity.HasIndex(e => e.Name).IsUnique();
        });

        // IncidentSource configuration
        modelBuilder.Entity<IncidentSource>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Code).HasMaxLength(10);
            entity.HasIndex(e => e.Name).IsUnique();
        });

        // Seed reference data
        SeedReferenceData(modelBuilder);
    }

    private void SeedReferenceData(ModelBuilder modelBuilder)
    {
        // Seed IncidentTypes
        modelBuilder.Entity<IncidentType>().HasData(
            new IncidentType { Id = 1, Name = "Anti-Social Behaviour", Code = "ASB", Active = true },
            new IncidentType { Id = 2, Name = "Criminal", Code = "CRM", Active = true },
            new IncidentType { Id = 3, Name = "Community Safety", Code = "CS", Active = true },
            new IncidentType { Id = 4, Name = "Traffic", Code = "TRF", Active = true }
        );

        // Seed IncidentResults
        modelBuilder.Entity<IncidentResult>().HasData(
            new IncidentResult { Id = 1, Name = "Confirmed", Description = "Incident confirmed by operator" },
            new IncidentResult { Id = 2, Name = "No Action Required", Description = "No action needed" },
            new IncidentResult { Id = 3, Name = "Monitored", Description = "Incident being monitored" },
            new IncidentResult { Id = 4, Name = "Dispersed", Description = "Dispersed by police" },
            new IncidentResult { Id = 5, Name = "Arrest", Description = "Subject arrested" }
        );

        // Seed IncidentSources
        modelBuilder.Entity<IncidentSource>().HasData(
            new IncidentSource { Id = 1, Name = "CCTV Operator", Code = "CCTV" },
            new IncidentSource { Id = 2, Name = "Police Report", Code = "POL" },
            new IncidentSource { Id = 3, Name = "Public Report", Code = "PUB" },
            new IncidentSource { Id = 4, Name = "Radio Link", Code = "RL" }
        );

        // Seed Areas
        modelBuilder.Entity<Area>().HasData(
            new Area { Id = 1, Name = "City Center", Code = "CC" },
            new Area { Id = 2, Name = "North District", Code = "ND" },
            new Area { Id = 3, Name = "South District", Code = "SD" },
            new Area { Id = 4, Name = "East District", Code = "ED" },
            new Area { Id = 5, Name = "West District", Code = "WD" }
        );

        // Seed Watches
        modelBuilder.Entity<Watch>().HasData(
            new Watch { Id = 1, Name = "Morning", Code = "MON" },
            new Watch { Id = 2, Name = "Afternoon", Code = "AFT" },
            new Watch { Id = 3, Name = "Evening", Code = "EVE" },
            new Watch { Id = 4, Name = "Night", Code = "NIT" }
        );

        // Seed Operators
        modelBuilder.Entity<Operator>().HasData(
            new Operator { Id = 1, Name = "John Smith", EmployeeId = "EMP001", Email = "john@example.com" },
            new Operator { Id = 2, Name = "Jane Doe", EmployeeId = "EMP002", Email = "jane@example.com" },
            new Operator { Id = 3, Name = "Bob Wilson", EmployeeId = "EMP003", Email = "bob@example.com" }
        );
    }
}
