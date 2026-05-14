TRANSFORM Sum(TotalRadioLinkByAreaForPrevYear.ID) AS SumOfID
SELECT TotalRadioLinkByAreaForPrevYear.Area, Sum(TotalRadioLinkByAreaForPrevYear.ID) AS [Total Of ID]
FROM TotalRadioLinkByAreaForPrevYear
GROUP BY TotalRadioLinkByAreaForPrevYear.Area
PIVOT "Qtr " & Format([Date],"q");

