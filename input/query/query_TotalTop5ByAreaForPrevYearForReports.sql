INSERT INTO TotalTop5ByAreaForPrevYear ( [count], ID, Area, [Date], IncidentType )
SELECT 0 AS [count], IncidentDetailsforReports.ID, IncidentDetailsforReports.Area, IncidentDetailsforReports.Date, IncidentDetailsforReports.IncidentType
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto));

