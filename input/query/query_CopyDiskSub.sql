INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [Date], IncidentType )
SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.CopyDisc)=-1) AND ((Areas.Database) Is Null))
GROUP BY 1, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk"
HAVING (((IncidentDetails.Date) Between forms!YTDSelection!from And forms!ytdselection!to));

