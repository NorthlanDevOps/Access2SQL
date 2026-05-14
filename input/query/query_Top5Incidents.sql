SELECT TOP 5 IncidentDetails.CriminalIncidentType, Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents]
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=forms!reportsmenu!to))
GROUP BY IncidentDetails.CriminalIncidentType
HAVING (((IncidentDetails.CriminalIncidentType) Is Not Null))
ORDER BY Count(IncidentDetails.CriminalIncidentType) DESC;

