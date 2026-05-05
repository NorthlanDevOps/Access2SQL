TRANSFORM Sum(TotalRadioLinkByAreaForYear.count) AS SumOfcount
SELECT TotalRadioLinkByAreaForYear.Area, Sum(TotalRadioLinkByAreaForYear.count) AS [Total Of Count]
FROM TotalRadioLinkByAreaForYear
GROUP BY TotalRadioLinkByAreaForYear.Area
PIVOT "Qtr " & Format([Date],"q");

