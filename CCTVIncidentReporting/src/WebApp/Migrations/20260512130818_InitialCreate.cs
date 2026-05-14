using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace WebApp.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Areas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Code = table.Column<string>(type: "TEXT", maxLength: 10, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Areas", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IncidentResults",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 300, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IncidentResults", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Incidents",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    IncidentType = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Date = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Area = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Watch = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Operator = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    SubArea = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 500, nullable: true),
                    Action = table.Column<string>(type: "TEXT", maxLength: 500, nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TEXT", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Incidents", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IncidentSources",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Code = table.Column<string>(type: "TEXT", maxLength: 10, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IncidentSources", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IncidentTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Code = table.Column<string>(type: "TEXT", maxLength: 10, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IncidentTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Operators",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    EmployeeId = table.Column<string>(type: "TEXT", maxLength: 20, nullable: true),
                    Email = table.Column<string>(type: "TEXT", maxLength: 100, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Operators", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Watches",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Code = table.Column<string>(type: "TEXT", maxLength: 10, nullable: true),
                    Active = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Watches", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Areas",
                columns: new[] { "Id", "Active", "Code", "Name" },
                values: new object[,]
                {
                    { 1, true, "CC", "City Center" },
                    { 2, true, "ND", "North District" },
                    { 3, true, "SD", "South District" },
                    { 4, true, "ED", "East District" },
                    { 5, true, "WD", "West District" }
                });

            migrationBuilder.InsertData(
                table: "IncidentResults",
                columns: new[] { "Id", "Active", "Description", "Name" },
                values: new object[,]
                {
                    { 1, true, "Incident confirmed by operator", "Confirmed" },
                    { 2, true, "No action needed", "No Action Required" },
                    { 3, true, "Incident being monitored", "Monitored" },
                    { 4, true, "Dispersed by police", "Dispersed" },
                    { 5, true, "Subject arrested", "Arrest" }
                });

            migrationBuilder.InsertData(
                table: "IncidentSources",
                columns: new[] { "Id", "Active", "Code", "Name" },
                values: new object[,]
                {
                    { 1, true, "CCTV", "CCTV Operator" },
                    { 2, true, "POL", "Police Report" },
                    { 3, true, "PUB", "Public Report" },
                    { 4, true, "RL", "Radio Link" }
                });

            migrationBuilder.InsertData(
                table: "IncidentTypes",
                columns: new[] { "Id", "Active", "Code", "Name" },
                values: new object[,]
                {
                    { 1, true, "ASB", "Anti-Social Behaviour" },
                    { 2, true, "CRM", "Criminal" },
                    { 3, true, "CS", "Community Safety" },
                    { 4, true, "TRF", "Traffic" }
                });

            migrationBuilder.InsertData(
                table: "Operators",
                columns: new[] { "Id", "Active", "Email", "EmployeeId", "Name" },
                values: new object[,]
                {
                    { 1, true, "john@example.com", "EMP001", "John Smith" },
                    { 2, true, "jane@example.com", "EMP002", "Jane Doe" },
                    { 3, true, "bob@example.com", "EMP003", "Bob Wilson" }
                });

            migrationBuilder.InsertData(
                table: "Watches",
                columns: new[] { "Id", "Active", "Code", "Name" },
                values: new object[,]
                {
                    { 1, true, "MON", "Morning" },
                    { 2, true, "AFT", "Afternoon" },
                    { 3, true, "EVE", "Evening" },
                    { 4, true, "NIT", "Night" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Areas_Name",
                table: "Areas",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_IncidentResults_Name",
                table: "IncidentResults",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Incidents_Area",
                table: "Incidents",
                column: "Area");

            migrationBuilder.CreateIndex(
                name: "IX_Incidents_Date",
                table: "Incidents",
                column: "Date");

            migrationBuilder.CreateIndex(
                name: "IX_Incidents_Watch",
                table: "Incidents",
                column: "Watch");

            migrationBuilder.CreateIndex(
                name: "IX_IncidentSources_Name",
                table: "IncidentSources",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_IncidentTypes_Name",
                table: "IncidentTypes",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Operators_EmployeeId",
                table: "Operators",
                column: "EmployeeId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Watches_Name",
                table: "Watches",
                column: "Name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Areas");

            migrationBuilder.DropTable(
                name: "IncidentResults");

            migrationBuilder.DropTable(
                name: "Incidents");

            migrationBuilder.DropTable(
                name: "IncidentSources");

            migrationBuilder.DropTable(
                name: "IncidentTypes");

            migrationBuilder.DropTable(
                name: "Operators");

            migrationBuilder.DropTable(
                name: "Watches");
        }
    }
}
