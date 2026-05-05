INSERT INTO IncidentsByDateTable ( [Count], ID, Area, SubArea, [Date], IncidentType )
SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.CopyDisc)=-1) AND ((Areas.Database) Is Null)) OR (((IncidentDetails.CopyDisc)=-1) AND ((Areas.Database) Is Null))
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk"
HAVING (((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to)) Or (((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to));

