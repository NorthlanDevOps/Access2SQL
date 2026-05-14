INSERT INTO OperatorIncidentsTable ( ID, Operator, Watch, [Date], IncidentType )
SELECT 1 AS ID, IncidentDetails.Operator, IncidentDetails.Watch, IncidentDetails.Date, IncidentDetails.Result
FROM IncidentDetails
WHERE (((IncidentDetails.Watch) Like [forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[forms]![reportsmenu]![to]) AND ((IncidentDetails.Result)="NPA"));

