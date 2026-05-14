SELECT TOP 5 IncidentDetails.CriminalIncidentType, Count(IncidentDetails.CriminalIncidentType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.Watch
FROM IncidentDetails
WHERE (((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=forms!reportsmenu!to))
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.Area, IncidentDetails.Watch
HAVING (((IncidentDetails.CriminalIncidentType) Is Not Null) And ((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((IncidentDetails.Watch) Like Forms!reportsmenu!watch))
ORDER BY Count(IncidentDetails.CriminalIncidentType) DESC;

