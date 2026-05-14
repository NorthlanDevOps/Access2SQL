SELECT IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.IncidentType INTO testquarter
FROM IncidentDetails
GROUP BY IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.IncidentType
HAVING (((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=#12/31/2007#) AND ((IncidentDetails.IncidentType) Is Not Null));

