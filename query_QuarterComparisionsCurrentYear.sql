TRANSFORM Sum(TotalIncidentsForYear.Count) AS SumOfCount
SELECT Year(Now()) AS [Year], Sum(TotalIncidentsForYear.Count) AS [Total Of Count]
FROM TotalIncidentsForYear
GROUP BY Year(Now())
PIVOT "Qtr " & Format([Date],"q");

