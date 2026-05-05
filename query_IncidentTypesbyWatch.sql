SELECT IncidentType.TypeNumber, IncidentDetails.ID, IncidentDetails.Date, IncidentDetails.Watch, IncidentDetails.Operator INTO IncidentsbyWatch
FROM IncidentType LEFT JOIN IncidentDetails ON IncidentType.IncidentType = IncidentDetails.IncidentType
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]));

