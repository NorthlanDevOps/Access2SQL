INSERT INTO IncidentsByDateTable ( [Count], ID, Area, SubArea, [Date], IncidentType )
SELECT 1 AS [Count], IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((IncidentDetails.CopyDisc)=True) AND ((Areas.Database) Is Null))
GROUP BY 1, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk"
HAVING (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]));

