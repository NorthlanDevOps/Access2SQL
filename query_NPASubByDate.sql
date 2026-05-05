INSERT INTO IncidentsByDateTable ( ID, Area, SubArea, [Date], IncidentType )
SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]) AND ((IncidentDetails.Result)="NPA"));

