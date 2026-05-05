INSERT INTO AllIncidents ( ID, IncidentType, [Date], Area, Watch, Operator, SubArea )
SELECT IncidentDetails.ID, IncidentDetails.CommunitySafetyType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea
FROM IncidentDetails
WHERE (((IncidentDetails.CommunitySafetyType) Is Not Null));

