INSERT INTO AllIncidents ( ID, IncidentType, [Date], Area, Watch, Operator, SubArea )
SELECT IncidentDetails.ID, IncidentDetails.Result AS IncidentType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea
FROM IncidentDetails
WHERE (((IncidentDetails.Result)="monitored no action"));

