SELECT TOP 5 IncidentDetails.CriminalIncidentType AS IncidentType, Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.RadioLinkType INTO HistoricTop5
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]))
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.Area, IncidentDetails.RadioLinkType
HAVING (((IncidentDetails.CriminalIncidentType)="Breach of the Peace" Or (IncidentDetails.CriminalIncidentType)="shoplifting" Or (IncidentDetails.CriminalIncidentType)="warrants" Or (IncidentDetails.CriminalIncidentType)="assault") AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.RadioLinkType) Is Null))
ORDER BY Count(IncidentDetails.CriminalIncidentType) DESC;

