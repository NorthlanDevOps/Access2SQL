SELECT IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.CriminalIncidentType, IncidentDetails.CommunitySafetyType, IncidentDetails.AntiSocialBehaviourType, IncidentDetails.RadioLinkType, IncidentDetails.IncidentType INTO IncidentsByDateTable
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like [Forms]![reportsmenu]![Area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![From] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]));

