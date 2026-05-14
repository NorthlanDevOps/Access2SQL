SELECT IncidentDetails.CriminalIncidentType AS [Incident Type], Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date INTO AllIncidentsByDateByArea
FROM IncidentDetails
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.CriminalIncidentType) Is Not Null) AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![Area]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![From] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![To]))
ORDER BY IncidentDetails.SubArea, IncidentDetails.Date;

