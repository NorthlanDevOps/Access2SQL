SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType INTO IncidentsSubTable
FROM IncidentDetails
WHERE (((IncidentDetails.Date) Between [forms]![YTDSelection]![from] And [forms]![ytdselection]![to]));

