SELECT TOP 5 IncidentDetails.AntiSocialBehaviourType, Count(IncidentDetails.AntiSocialBehaviourType) AS [No of Incidents]
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
GROUP BY IncidentDetails.AntiSocialBehaviourType
HAVING (((IncidentDetails.AntiSocialBehaviourType) Is Not Null))
ORDER BY Count(IncidentDetails.AntiSocialBehaviourType) DESC;

