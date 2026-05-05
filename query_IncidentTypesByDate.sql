SELECT IncidentType.TypeNumber, IncidentsByDateTable.IncidentType, IncidentsByDateTable.ID, IncidentsByDateTable.Watch, IncidentsByDateTable.Operator, IncidentsByDateTable.Area, IncidentsByDateTable.SubArea, IncidentsByDateTable.Date, IncidentsByDateTable.CriminalIncidentType, IncidentsByDateTable.CommunitySafetyType, IncidentsByDateTable.AntiSocialBehaviourType, IncidentsByDateTable.RadioLinkType
FROM IncidentType LEFT JOIN IncidentsByDateTable ON IncidentType.IncidentType=IncidentsByDateTable.IncidentType
WHERE (((IncidentsByDateTable.IncidentType) Is Not Null))
ORDER BY IncidentType.TypeNumber, IncidentsByDateTable.IncidentType;

