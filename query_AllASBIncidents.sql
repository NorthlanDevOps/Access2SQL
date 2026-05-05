INSERT INTO AllIncidents ( ID, IncidentType, [Date], Area, Watch, Operator, SubArea )
SELECT IncidentDetails.ID, IncidentDetails.AntiSocialBehaviourType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea
FROM IncidentDetails
WHERE (((IncidentDetails.AntiSocialBehaviourType) Is Not Null));

