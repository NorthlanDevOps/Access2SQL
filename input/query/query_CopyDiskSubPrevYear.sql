INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [Date], IncidentType, [Year] )
SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk" AS Expr1, (Year([Date])) AS [Year]
FROM IncidentDetails
WHERE (((IncidentDetails.CopyDisc)=-1))
GROUP BY 1, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Copy Disk", (Year([Date]))
HAVING ((((Year([Date])))=Year(Now())-1));

