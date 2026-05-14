TRANSFORM Sum(TotalAppsByAreaForPrevYear.NoAppCautions) AS SumOfNoAppCautions
SELECT TotalAppsByAreaForPrevYear.Area, Sum(TotalAppsByAreaForPrevYear.NoAppCautions) AS [Total Of NoAppCautions]
FROM TotalAppsByAreaForPrevYear
GROUP BY TotalAppsByAreaForPrevYear.Area
PIVOT "Qtr " & Format([Date],"q");

