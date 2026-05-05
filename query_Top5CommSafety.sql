SELECT TOP 5 IncidentDetails.CommunitySafetyType, Count(IncidentDetails.CommunitySafetyType) AS [No of Incidents]
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
GROUP BY IncidentDetails.CommunitySafetyType
HAVING (((IncidentDetails.CommunitySafetyType) Is Not Null))
ORDER BY Count(IncidentDetails.CommunitySafetyType) DESC;

