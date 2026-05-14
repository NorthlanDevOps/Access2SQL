INSERT INTO TotalIncidentsByAreaForPrevYear ( [count], Area, ID, IncidentType, [Date] )
SELECT 0 AS [count], IncidentDetailsforReports.Area, IncidentDetailsforReports.ID, IncidentDetailsforReports.IncidentType, IncidentDetailsforReports.Date
FROM IncidentDetailsforReports
WHERE (((IncidentDetailsforReports.Date) Between forms!ytdselection!pfrom And Forms!ytdselection!pto));

