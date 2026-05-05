SELECT TOP 5 IncidentDetails.CriminalIncidentType, Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.Watch INTO Top5Table
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]))
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.Area, IncidentDetails.Watch
HAVING (((IncidentDetails.CriminalIncidentType) Is Not Null) AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]))
ORDER BY Count(IncidentDetails.CriminalIncidentType) DESC;

