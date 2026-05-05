INSERT INTO IncidentsByResults ( [Count], ID, Watch, Operator, Area, SubArea, [Date], Result, [Incident Type] )
SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result, IncidentDetails.FAGIType
FROM IncidentDetails
WHERE (((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.Date) Between forms!reportsmenu!from And forms!reportsmenu!to) And ((IncidentDetails.Result)="FAGI")) Or (((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date) Between forms!reportsmenu!from And forms!reportsmenu!to) And ((IncidentDetails.Result)="FAGI"));

