SELECT DISTINCT TotalRadioLinkByAreaForYear_Crosstab.[Total Of Count], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 1], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 2], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 3], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalRadioLinkByAreaForYear_Crosstab ON Areas.Area=TotalRadioLinkByAreaForYear_Crosstab.Area
WHERE (((Areas.Area) Is Not Null))
GROUP BY TotalRadioLinkByAreaForYear_Crosstab.[Total Of Count], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 1], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 2], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 3], TotalRadioLinkByAreaForYear_Crosstab.[Qtr 4];

