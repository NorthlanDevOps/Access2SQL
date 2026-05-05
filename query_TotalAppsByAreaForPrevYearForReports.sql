INSERT INTO TotalAppsByAreaForPrevYear ( [count], ID, Area, [Date], NoAppCautions, IncidentType )
SELECT 0 AS [count], IncidentDetailsforReports.ID, IncidentDetailsforReports.Area, IncidentDetailsforReports.Date, IncidentDetailsforReports.NoAppCautions, IncidentDetailsforReports.IncidentType
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto));

