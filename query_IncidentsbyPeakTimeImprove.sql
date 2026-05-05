INSERT INTO IncidentsbyWatch ( TypeNumber, [Date], Watch, Operator )
SELECT 98 AS [type number], IncidentDetails.Date, Operator.watch, Operator.operatorname
FROM IncidentDetails INNER JOIN Operator ON IncidentDetails.Operator = Operator.operatorname
WHERE (((IncidentDetails.Date) Between [forms]![reportsmenu]![from] And [forms]![reportsmenu]![to]) AND ((Operator.watch)="Part Time") AND ((IncidentDetails.couldimprove)="Yes"));

