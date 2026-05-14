INSERT INTO TotalTop5ByAreaForYear ( [count], ID, Area, [Date], IncidentType )
SELECT 0 AS [count], IncidentDetailsforReports.ID, IncidentDetailsforReports.Area, IncidentDetailsforReports.Date, IncidentDetailsforReports.IncidentType
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!cfrom And forms!ytdselection!cto));

