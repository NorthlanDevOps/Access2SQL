SELECT IncidentDetails.IncidentType, IncidentDetails.Description, IncidentDetails.Action, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Time, IncidentDetails.CameraNo, IncidentDetails.ID, IncidentDetails.NoAppCautions, IncidentDetails.IncidentSource INTO SubSourcesRep
FROM IncidentDetails
WHERE (((IncidentDetails.IncidentType) Like forms!reportsmenu![incident type]) And ((IncidentDetails.Area) Like forms!reportsmenu!area) And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to))
ORDER BY IncidentDetails.IncidentType, IncidentDetails.SubArea, IncidentDetails.Date;

