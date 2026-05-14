SELECT 1 AS [count], IncidentDetails.Area, IncidentDetails.ID, IncidentDetails.IncidentType, IncidentDetails.Date INTO TotalIncidentsByAreaForPrevYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.Area, IncidentDetails.ID, IncidentDetails.IncidentType, IncidentDetails.Date
HAVING (((IncidentDetails.Date) Between forms!ytdselection!pfrom And Forms!ytdselection!pto));

