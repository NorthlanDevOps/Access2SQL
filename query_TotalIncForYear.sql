SELECT 1 AS [count], IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType INTO TotalIncidentsForYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!cfrom And forms!ytdselection!cto));

