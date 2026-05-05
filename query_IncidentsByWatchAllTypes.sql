SELECT DISTINCT IncidentsbyWatch.ID, IncidentType.TypeNumber, IncidentsbyWatch.Date, IncidentsbyWatch.Watch, IncidentsbyWatch.Operator
FROM IncidentType LEFT JOIN IncidentsbyWatch ON IncidentType.TypeNumber=IncidentsbyWatch.TypeNumber;

