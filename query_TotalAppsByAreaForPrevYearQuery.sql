SELECT 1 AS [count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.NoAppCautions, IncidentDetails.IncidentType INTO TotalAppsByAreaForPrevYear
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((Areas.Database) Is Null))
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.NoAppCautions, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date) Between forms!ytdselection!pfrom And forms!ytdselection!pto) And ((IncidentDetails.NoAppCautions)>0));

