SELECT IncidentDetails.ID, IncidentDetails.CriminalIncidentType AS IncidentType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea INTO AllIncidents
FROM IncidentDetails
WHERE (((IncidentDetails.CriminalIncidentType) Is Not Null));

