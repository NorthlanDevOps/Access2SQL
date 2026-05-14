TRANSFORM Sum(TotalIncidentsByAreaForYear.count) AS SumOfCount
SELECT TotalIncidentsByAreaForYear.Area, Sum(TotalIncidentsByAreaForYear.count) AS [Total Of count]
FROM TotalIncidentsByAreaForYear
GROUP BY TotalIncidentsByAreaForYear.Area
PIVOT "Qtr " & Format([Date],"q");

