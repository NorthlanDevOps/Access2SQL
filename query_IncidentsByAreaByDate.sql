SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType INTO IncidentsByDateTable
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]));

