SELECT IncidentDetails.IncidentType, IncidentDetails.Description, IncidentDetails.Action, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Time, IncidentDetails.CameraNo, IncidentDetails.ID, IncidentDetails.NoAppCautions, IncidentDetails.Result INTO SubGroupRep
FROM IncidentDetails
WHERE (((IncidentDetails.IncidentType) Like forms!reportsmenu![incident type]) And ((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to)) Or (((IncidentDetails.IncidentType) Like forms!reportsmenu![incident type]) And ((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
ORDER BY IncidentDetails.IncidentType, IncidentDetails.SubArea, IncidentDetails.Date;

