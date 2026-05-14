TRANSFORM Sum(TotalTop5ByAreaForYear.Count) AS SumOfCount
SELECT TotalTop5ByAreaForYear.Area, Sum(TotalTop5ByAreaForYear.Count) AS [Total Of Count]
FROM TotalTop5ByAreaForYear
GROUP BY TotalTop5ByAreaForYear.Area
PIVOT "Qtr " & Format([Date],"q");

