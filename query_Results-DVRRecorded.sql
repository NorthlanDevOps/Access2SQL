INSERT INTO IncidentsByResults ( [Count], ID, Watch, Operator, Area, SubArea, [Date], Result, [Incident Type] )
SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result, IncidentDetails.DVRReferredType
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like forms!reportsmenu!area) And ((IncidentDetails.Date) Between forms!reportsmenu!from And forms!reportsmenu!to) And ((IncidentDetails.Result)="DVR Recorded"));

