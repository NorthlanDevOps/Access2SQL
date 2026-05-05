TRANSFORM Count(IncidentsByDatetable.ID) AS [Total Of ID]
SELECT IncidentsByDatetable.IncidentType
FROM IncidentsByDatetable
GROUP BY IncidentsByDatetable.IncidentType
ORDER BY IncidentsByDatetable.SubArea
PIVOT IncidentsByDatetable.SubArea;

