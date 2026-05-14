INSERT INTO IncidentsbyWatch ( TypeNumber, [Date], Watch, Operator )
SELECT 97 AS [Type Number], IncidentDetails.Date, IncidentDetails.Watch, IncidentDetails.Operator
FROM IncidentDetails
WHERE (((IncidentDetails.Date) Between forms!reportsmenu!from And forms!reportsmenu!to) And ((IncidentDetails.Watch)=forms!reportsmenu!watch) And ((IncidentDetails.exceptional)="Yes"));

