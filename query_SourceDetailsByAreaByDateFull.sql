SELECT IncidentType.TypeNumber, IncidentType.IncidentType, SourcesDetailsbyDateFull.*
FROM IncidentType LEFT JOIN SourcesDetailsbyDateFull ON IncidentType.IncidentType = SourcesDetailsbyDateFull.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

