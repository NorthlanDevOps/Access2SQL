TRANSFORM Sum(TotalIncidentsForPrevYear.Count) AS SumOfCount
SELECT Year(Now())-1 AS [Year], Sum(TotalIncidentsForPrevYear.Count) AS [Total Of ID]
FROM TotalIncidentsForPrevYear
GROUP BY Year(Now())-1
PIVOT "Qtr " & Format([Date],"q");

