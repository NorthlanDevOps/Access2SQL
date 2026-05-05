TRANSFORM Sum(SourcesDetails.Count) AS SumOfCount
SELECT SourcesDetails.IncidentType, Sum(SourcesDetails.Count) AS [Total Of Count]
FROM SourcesDetails RIGHT JOIN IncidentSource ON SourcesDetails.IncidentSource=IncidentSource.[Incident Source]
WHERE (((IncidentSource.Database) Is Null))
GROUP BY SourcesDetails.IncidentType, IncidentSource.Database
PIVOT IncidentSource.[Incident Source];

