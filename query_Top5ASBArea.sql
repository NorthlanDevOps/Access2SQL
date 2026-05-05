SELECT TOP 5 IncidentDetails.AntiSocialBehaviourType, Count(IncidentDetails.AntiSocialBehaviourType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.Watch
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
GROUP BY IncidentDetails.AntiSocialBehaviourType, IncidentDetails.Area, IncidentDetails.Watch
HAVING (((IncidentDetails.AntiSocialBehaviourType) Is Not Null) And ((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((IncidentDetails.Watch) Like forms!reportsmenu!watch))
ORDER BY Count(IncidentDetails.AntiSocialBehaviourType) DESC;

