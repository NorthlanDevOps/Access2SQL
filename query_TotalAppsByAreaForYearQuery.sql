SELECT 1 AS [count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.NoAppCautions, IncidentDetails.IncidentType INTO TotalAppsByAreaForYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.NoAppCautions, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!cfrom And forms!ytdselection!cto) And ((IncidentDetails.NoAppCautions)>0));

