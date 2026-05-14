SELECT TOP 5 IncidentDetails.CommunitySafetyType, Count(IncidentDetails.CommunitySafetyType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.Watch
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
GROUP BY IncidentDetails.CommunitySafetyType, IncidentDetails.Area, IncidentDetails.Watch
HAVING (((IncidentDetails.CommunitySafetyType) Is Not Null) And ((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((IncidentDetails.Watch) Like forms!reportsmenu!watch))
ORDER BY Count(IncidentDetails.CommunitySafetyType) DESC;

