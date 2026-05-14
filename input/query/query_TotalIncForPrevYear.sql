SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType INTO TotalIncidentsForPrevYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto));

