SELECT IncidentDetails.ID, IncidentDetails.CriminalIncidentType AS IncidentType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea INTO AllIncidentsbyWatch
FROM IncidentDetails
WHERE (((IncidentDetails.Date) Between [Forms]![watchmenu]![from] And [Forms]![watchmenu]![to]) AND ((IncidentDetails.Watch)=[Forms]![watchmenu]![watch]));

