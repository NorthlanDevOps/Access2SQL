TRANSFORM Sum(IncidentsByDatetable.Count) AS [Total Of Count]
SELECT IncidentsByDatetable.IncidentType
FROM Areas LEFT JOIN IncidentsByDatetable ON Areas.SubArea=IncidentsByDatetable.SubArea
WHERE (((Areas.Database) Is Null))
GROUP BY IncidentsByDatetable.IncidentType
ORDER BY Areas.Area
PIVOT Areas.Area;

