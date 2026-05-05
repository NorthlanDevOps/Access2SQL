TRANSFORM Count(IncidentsByWatchAllTypes.Date) AS CountOfDate
SELECT IncidentsByWatchAllTypes.Operator, Count(IncidentsByWatchAllTypes.Date) AS [Total Of Date]
FROM IncidentsByWatchAllTypes
GROUP BY IncidentsByWatchAllTypes.Operator
PIVOT IncidentsByWatchAllTypes.TypeNumber;

