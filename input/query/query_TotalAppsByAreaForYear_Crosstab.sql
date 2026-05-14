TRANSFORM Sum(TotalAppsByAreaForYear.NoAppCautions) AS SumOfNoAppCautions
SELECT TotalAppsByAreaForYear.Area, Sum(TotalAppsByAreaForYear.NoAppCautions) AS [Total Of NoAppCautions]
FROM TotalAppsByAreaForYear
GROUP BY TotalAppsByAreaForYear.Area
PIVOT "Qtr " & Format([Date],"q");

