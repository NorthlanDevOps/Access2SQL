TRANSFORM Count(IncidentsByDateBySubArea.ID) AS CountOfID
SELECT IncidentsByDateBySubArea.IncidentType, Count(IncidentsByDateBySubArea.ID) AS [Total Of ID]
FROM IncidentsByDateBySubArea
GROUP BY IncidentsByDateBySubArea.IncidentType
PIVOT IncidentsByDateBySubArea.SubArea;

