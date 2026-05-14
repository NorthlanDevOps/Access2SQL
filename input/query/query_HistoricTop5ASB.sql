INSERT INTO HistoricTop5 ( [No of Incidents], Area, IncidentType )
SELECT TOP 5 Count(IncidentDetails.AntiSocialBehaviourType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.AntiSocialBehaviourType
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]))
GROUP BY IncidentDetails.Area, IncidentDetails.AntiSocialBehaviourType
HAVING (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.AntiSocialBehaviourType)="Street Drinking"))
ORDER BY Count(IncidentDetails.AntiSocialBehaviourType) DESC;

