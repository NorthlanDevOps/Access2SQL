SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result, IncidentDetails.AssistDetectType AS [Incident Type] INTO IncidentsByResults
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [forms]![reportsmenu]![area]) AND ((IncidentDetails.Date) Between [forms]![reportsmenu]![from] And [forms]![reportsmenu]![to]) AND ((IncidentDetails.Result)="Assist Detection/Capture"));

