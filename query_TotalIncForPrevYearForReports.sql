INSERT INTO TotalIncidentsForPrevYear ( [Count], ID, [Date], IncidentType )
SELECT 0 AS [Count], IncidentDetailsforReports.ID, IncidentDetailsforReports.Date, IncidentDetailsforReports.IncidentType
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto));

