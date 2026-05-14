SELECT 1 AS ID, IncidentDetails.Operator, IncidentDetails.Watch, IncidentDetails.Date, IncidentDetails.IncidentType INTO OperatorIncidentsTable
FROM IncidentDetails
WHERE (((IncidentDetails.Watch) Like [forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[forms]![reportsmenu]![to]));

