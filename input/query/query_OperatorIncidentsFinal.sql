SELECT IncidentType.TypeNumber, IncidentType.IncidentType, OperatorIncidents2.ID, OperatorIncidents2.operatorname, OperatorIncidents2.watch, OperatorIncidents2.Date
FROM IncidentType LEFT JOIN OperatorIncidents2 ON IncidentType.IncidentType=OperatorIncidents2.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

