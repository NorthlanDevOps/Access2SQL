SELECT 1 AS [Count], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType, IncidentDetails.IncidentSource INTO SourcesDetails
FROM IncidentDetails
WHERE (((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.Date) Between Forms!Reportsmenu!from And forms!reportsmenu!to)) Or (((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date) Between Forms!Reportsmenu!from And forms!reportsmenu!to));

