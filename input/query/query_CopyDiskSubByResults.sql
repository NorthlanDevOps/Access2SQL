INSERT INTO IncidentsByResults ( [Count], ID, Area, SubArea, [Date], [Incident Type], Watch, Operator )
SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk" AS Expr1, IncidentDetails.Watch, IncidentDetails.Operator
FROM IncidentDetails
WHERE (((IncidentDetails.CopyDisc)=-1))
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk", IncidentDetails.Watch, IncidentDetails.Operator
HAVING (((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to));

