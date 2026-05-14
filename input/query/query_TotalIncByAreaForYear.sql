SELECT 1 AS [count], IncidentDetails.Area, IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType INTO TotalIncidentsByAreaForYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.Area, IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!cfrom And forms!ytdselection!cto));

