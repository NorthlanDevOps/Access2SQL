SELECT IncidentDetails.IncidentType, IncidentDetails.Description, IncidentDetails.Action, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Operator, IncidentDetails.Date, IncidentDetails.couldimprove INTO CouldImprove
FROM IncidentDetails
WHERE (((IncidentDetails.Area) Like forms!reportsmenu!area) And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=forms!reportsmenu!to) And ((IncidentDetails.couldimprove)="yes"))
ORDER BY IncidentDetails.Area, IncidentDetails.Date;

