SELECT IncidentType.TypeNumber, IncidentType.IncidentType, IncidentsByDate.*
FROM IncidentType LEFT JOIN IncidentsByDate ON IncidentType.IncidentType = IncidentsByDate.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

