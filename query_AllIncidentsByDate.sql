TRANSFORM Count(IncidentsByDate.ID) AS CountOfID
SELECT IncidentsByDate.IncidentType, Count(IncidentsByDate.ID) AS [Total Of ID]
FROM IncidentsByDate
GROUP BY IncidentsByDate.IncidentType
PIVOT IncidentsByDate.SubArea;

