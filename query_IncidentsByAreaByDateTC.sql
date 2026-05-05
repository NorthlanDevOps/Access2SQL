SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType INTO IncidentsByDateTable
FROM IncidentDetails
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType
HAVING (((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to)) Or (((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to));

