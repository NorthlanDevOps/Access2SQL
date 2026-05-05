SELECT IncidentDetails.ID, IncidentDetails.EnteredBy, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result, IncidentDetails.Checked, IncidentDetails.IncidentType
FROM IncidentDetails
WHERE (((IncidentDetails.IncidentType) Is Null));

