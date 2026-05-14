SELECT Areas.SubArea, IncidentTypesByDate.IncidentType, IncidentTypesByDate.ID, IncidentTypesByDate.Watch, IncidentTypesByDate.Operator, IncidentTypesByDate.Area, IncidentTypesByDate.Date, IncidentTypesByDate.CriminalIncidentType, IncidentTypesByDate.CommunitySafetyType, IncidentTypesByDate.AntiSocialBehaviourType, IncidentTypesByDate.RadioLinkType
FROM Areas LEFT JOIN IncidentTypesByDate ON Areas.SubArea=IncidentTypesByDate.SubArea
WHERE (((Areas.SubArea) Is Not Null));

