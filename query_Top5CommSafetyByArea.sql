INSERT INTO Top5Table ( CriminalIncidentType, [No of Incidents], Watch, Area )
SELECT TOP 5 IncidentDetails.CommunitySafetyType, Count(IncidentDetails.CommunitySafetyType) AS [No of Incidents], IncidentDetails.Watch, IncidentDetails.Area
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]))
GROUP BY IncidentDetails.CommunitySafetyType, IncidentDetails.Watch, IncidentDetails.Area
HAVING (((IncidentDetails.CommunitySafetyType) Is Not Null) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]) AND ((IncidentDetails.Area) Like [Forms]![Reportsmenu]![Area]))
ORDER BY Count(IncidentDetails.CommunitySafetyType) DESC;

