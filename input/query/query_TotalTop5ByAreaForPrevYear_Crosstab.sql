TRANSFORM Sum(TotalTop5ByAreaForPrevYear.Count) AS SumOfCount
SELECT TotalTop5ByAreaForPrevYear.Area, Sum(TotalTop5ByAreaForPrevYear.Count) AS [Total Of ID]
FROM TotalTop5ByAreaForPrevYear
GROUP BY TotalTop5ByAreaForPrevYear.Area
PIVOT "Qtr " & Format([Date],"q");

