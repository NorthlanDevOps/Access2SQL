INSERT INTO IncidentsbyWatch ( TypeNumber, [Date], Watch, Operator )
SELECT 98 AS [type number], IncidentDetails.Date, IncidentDetails.Watch, IncidentDetails.Operator
FROM IncidentDetails
WHERE (((IncidentDetails.Date) Between forms!reportsmenu!from And forms!reportsmenu!to) And ((IncidentDetails.Watch)=forms!reportsmenu!watch) And ((IncidentDetails.couldimprove)="Yes"));

