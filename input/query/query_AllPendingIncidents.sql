SELECT IncidentDetails.ID, IncidentDetails.IncidentType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.CrimeRefNo, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Operator
FROM IncidentDetails
WHERE (((IncidentDetails.Checked) Is Null));

