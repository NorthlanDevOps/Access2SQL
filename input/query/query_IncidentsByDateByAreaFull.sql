SELECT IncidentType.TypeNumber, IncidentType.IncidentType, IncidentsByDateByArea.*
FROM IncidentType LEFT JOIN IncidentsByDateByArea ON IncidentType.IncidentType = IncidentsByDateByArea.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

