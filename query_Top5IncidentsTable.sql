SELECT TOP 5 IncidentDetails.CriminalIncidentType, Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents] INTO Top5Table
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]))
GROUP BY IncidentDetails.CriminalIncidentType
HAVING (((IncidentDetails.CriminalIncidentType) Is Not Null))
ORDER BY Count(IncidentDetails.CriminalIncidentType) DESC;

