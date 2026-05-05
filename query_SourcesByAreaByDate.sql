SELECT 1 AS [Count], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType, IncidentDetails.IncidentSource INTO SourcesDetails
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [forms]![reportsmenu]![area]) AND ((IncidentDetails.Date) Between [Forms]![Reportsmenu]![from] And [forms]![reportsmenu]![to]));

