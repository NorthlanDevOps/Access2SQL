TRANSFORM Sum(IncidentsByResults.Count) AS SumOfCount
SELECT IncidentType.IncidentType, Sum(IncidentsByResults.Count) AS [Total Of Count]
FROM IncidentType LEFT JOIN IncidentsByResults ON IncidentType.IncidentType = IncidentsByResults.[Incident Type]
WHERE (((IncidentType.TypeNumber)="1" Or (IncidentType.TypeNumber)="2" Or (IncidentType.TypeNumber)="3"))
GROUP BY IncidentType.TypeNumber, IncidentType.IncidentType
PIVOT IncidentsByResults.Result;

