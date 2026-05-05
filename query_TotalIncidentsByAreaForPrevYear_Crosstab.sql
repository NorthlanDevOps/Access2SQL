TRANSFORM Sum(TotalIncidentsByAreaForPrevYear.count) AS SumOfCount
SELECT TotalIncidentsByAreaForPrevYear.Area, Sum(TotalIncidentsByAreaForPrevYear.count) AS [Total Of ID]
FROM TotalIncidentsByAreaForPrevYear
GROUP BY TotalIncidentsByAreaForPrevYear.Area
PIVOT "Qtr " & Format([Date],"q");

