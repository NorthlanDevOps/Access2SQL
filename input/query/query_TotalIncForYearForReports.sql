INSERT INTO TotalIncidentsForYear ( [count], ID, [Date], IncidentType )
SELECT 0 AS [count], IncidentDetailsforReports.ID, IncidentDetailsforReports.Date, IncidentDetailsforReports.IncidentType
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!cfrom And forms!ytdselection!cto));

