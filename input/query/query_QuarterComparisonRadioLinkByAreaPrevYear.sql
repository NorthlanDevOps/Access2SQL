SELECT DISTINCT TotalRadioLinkByAreaForPrevYear_Crosstab.[Total Of ID], TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 1] AS Expr1, TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 2] AS Expr2, TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 3] AS Expr3, TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 4] AS Expr4
FROM Areas LEFT JOIN TotalRadioLinkByAreaForPrevYear_Crosstab ON Areas.Area=TotalRadioLinkByAreaForPrevYear_Crosstab.Area
WHERE (((Areas.Area) Is Not Null))
GROUP BY TotalRadioLinkByAreaForPrevYear_Crosstab.[Total Of ID], TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 1], TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 2], TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 3], TotalRadioLinkByAreaForPrevYear_Crosstab.[Qtr 4];

