SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType INTO IncidentsByDateTable
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]) AND ((IncidentDetails.IncidentType)=[Forms]![reportsmenu]![incident type]));

