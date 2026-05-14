CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);

BEGIN TRANSACTION;
CREATE TABLE "Areas" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Areas" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Code" TEXT NULL,
    "Active" INTEGER NOT NULL
);

CREATE TABLE "IncidentResults" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_IncidentResults" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Description" TEXT NULL,
    "Active" INTEGER NOT NULL
);

CREATE TABLE "Incidents" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Incidents" PRIMARY KEY AUTOINCREMENT,
    "IncidentType" TEXT NOT NULL,
    "Date" TEXT NOT NULL,
    "Area" TEXT NOT NULL,
    "Watch" TEXT NOT NULL,
    "Operator" TEXT NOT NULL,
    "SubArea" TEXT NOT NULL,
    "Description" TEXT NULL,
    "Action" TEXT NULL,
    "CreatedAt" TEXT NOT NULL,
    "UpdatedAt" TEXT NULL
);

CREATE TABLE "IncidentSources" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_IncidentSources" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Code" TEXT NULL,
    "Active" INTEGER NOT NULL
);

CREATE TABLE "IncidentTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_IncidentTypes" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Code" TEXT NULL,
    "Active" INTEGER NOT NULL
);

CREATE TABLE "Operators" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Operators" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "EmployeeId" TEXT NULL,
    "Email" TEXT NULL,
    "Active" INTEGER NOT NULL
);

CREATE TABLE "Watches" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Watches" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Code" TEXT NULL,
    "Active" INTEGER NOT NULL
);

INSERT INTO "Areas" ("Id", "Active", "Code", "Name")
VALUES (1, 1, 'CC', 'City Center');
SELECT changes();

INSERT INTO "Areas" ("Id", "Active", "Code", "Name")
VALUES (2, 1, 'ND', 'North District');
SELECT changes();

INSERT INTO "Areas" ("Id", "Active", "Code", "Name")
VALUES (3, 1, 'SD', 'South District');
SELECT changes();

INSERT INTO "Areas" ("Id", "Active", "Code", "Name")
VALUES (4, 1, 'ED', 'East District');
SELECT changes();

INSERT INTO "Areas" ("Id", "Active", "Code", "Name")
VALUES (5, 1, 'WD', 'West District');
SELECT changes();


INSERT INTO "IncidentResults" ("Id", "Active", "Description", "Name")
VALUES (1, 1, 'Incident confirmed by operator', 'Confirmed');
SELECT changes();

INSERT INTO "IncidentResults" ("Id", "Active", "Description", "Name")
VALUES (2, 1, 'No action needed', 'No Action Required');
SELECT changes();

INSERT INTO "IncidentResults" ("Id", "Active", "Description", "Name")
VALUES (3, 1, 'Incident being monitored', 'Monitored');
SELECT changes();

INSERT INTO "IncidentResults" ("Id", "Active", "Description", "Name")
VALUES (4, 1, 'Dispersed by police', 'Dispersed');
SELECT changes();

INSERT INTO "IncidentResults" ("Id", "Active", "Description", "Name")
VALUES (5, 1, 'Subject arrested', 'Arrest');
SELECT changes();


INSERT INTO "IncidentSources" ("Id", "Active", "Code", "Name")
VALUES (1, 1, 'CCTV', 'CCTV Operator');
SELECT changes();

INSERT INTO "IncidentSources" ("Id", "Active", "Code", "Name")
VALUES (2, 1, 'POL', 'Police Report');
SELECT changes();

INSERT INTO "IncidentSources" ("Id", "Active", "Code", "Name")
VALUES (3, 1, 'PUB', 'Public Report');
SELECT changes();

INSERT INTO "IncidentSources" ("Id", "Active", "Code", "Name")
VALUES (4, 1, 'RL', 'Radio Link');
SELECT changes();


INSERT INTO "IncidentTypes" ("Id", "Active", "Code", "Name")
VALUES (1, 1, 'ASB', 'Anti-Social Behaviour');
SELECT changes();

INSERT INTO "IncidentTypes" ("Id", "Active", "Code", "Name")
VALUES (2, 1, 'CRM', 'Criminal');
SELECT changes();

INSERT INTO "IncidentTypes" ("Id", "Active", "Code", "Name")
VALUES (3, 1, 'CS', 'Community Safety');
SELECT changes();

INSERT INTO "IncidentTypes" ("Id", "Active", "Code", "Name")
VALUES (4, 1, 'TRF', 'Traffic');
SELECT changes();


INSERT INTO "Operators" ("Id", "Active", "Email", "EmployeeId", "Name")
VALUES (1, 1, 'john@example.com', 'EMP001', 'John Smith');
SELECT changes();

INSERT INTO "Operators" ("Id", "Active", "Email", "EmployeeId", "Name")
VALUES (2, 1, 'jane@example.com', 'EMP002', 'Jane Doe');
SELECT changes();

INSERT INTO "Operators" ("Id", "Active", "Email", "EmployeeId", "Name")
VALUES (3, 1, 'bob@example.com', 'EMP003', 'Bob Wilson');
SELECT changes();


INSERT INTO "Watches" ("Id", "Active", "Code", "Name")
VALUES (1, 1, 'MON', 'Morning');
SELECT changes();

INSERT INTO "Watches" ("Id", "Active", "Code", "Name")
VALUES (2, 1, 'AFT', 'Afternoon');
SELECT changes();

INSERT INTO "Watches" ("Id", "Active", "Code", "Name")
VALUES (3, 1, 'EVE', 'Evening');
SELECT changes();

INSERT INTO "Watches" ("Id", "Active", "Code", "Name")
VALUES (4, 1, 'NIT', 'Night');
SELECT changes();


CREATE UNIQUE INDEX "IX_Areas_Name" ON "Areas" ("Name");

CREATE UNIQUE INDEX "IX_IncidentResults_Name" ON "IncidentResults" ("Name");

CREATE INDEX "IX_Incidents_Area" ON "Incidents" ("Area");

CREATE INDEX "IX_Incidents_Date" ON "Incidents" ("Date");

CREATE INDEX "IX_Incidents_Watch" ON "Incidents" ("Watch");

CREATE UNIQUE INDEX "IX_IncidentSources_Name" ON "IncidentSources" ("Name");

CREATE UNIQUE INDEX "IX_IncidentTypes_Name" ON "IncidentTypes" ("Name");

CREATE UNIQUE INDEX "IX_Operators_EmployeeId" ON "Operators" ("EmployeeId");

CREATE UNIQUE INDEX "IX_Watches_Name" ON "Watches" ("Name");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20260512130818_InitialCreate', '9.0.7');

COMMIT;

