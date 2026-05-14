SELECT IncidentType.TypeNumber, IncidentType.ID, IncidentDetails.Date, Operator.watch, Operator.operatorname AS Operator INTO IncidentsbyWatch
FROM (IncidentType INNER JOIN IncidentDetails ON IncidentType.IncidentType = IncidentDetails.IncidentType) LEFT JOIN Operator ON IncidentDetails.Operator = Operator.operatorname
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]) AND ((Operator.watch)="Part Time"));

