SELECT 1 AS [count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.IncidentType INTO TotalTop5ByAreaForPrevYear
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto) And ((IncidentDetails.IncidentType)="breach of the peace" Or (IncidentDetails.IncidentType)="shoplifting" Or (IncidentDetails.IncidentType)="warrants" Or (IncidentDetails.IncidentType)="assault" Or (IncidentDetails.IncidentType)="street drinking"));

