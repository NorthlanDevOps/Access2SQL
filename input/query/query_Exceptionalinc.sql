SELECT IncidentDetails.IncidentType, IncidentDetails.Description, IncidentDetails.Action, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Operator, IncidentDetails.Date, IncidentDetails.exceptional INTO Exceptional
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[forms]![reportsmenu]![to]) AND ((IncidentDetails.exceptional)="yes"))
ORDER BY IncidentDetails.Area, IncidentDetails.Date;

