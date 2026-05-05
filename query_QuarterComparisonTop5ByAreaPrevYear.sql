SELECT DISTINCT Areas.Area, TotalTop5ByAreaForPrevYear_Crosstab.[Total Of ID], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 1], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 2], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 3], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalTop5ByAreaForPrevYear_Crosstab ON Areas.Area = TotalTop5ByAreaForPrevYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalTop5ByAreaForPrevYear_Crosstab.[Total Of ID], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 1], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 2], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 3], TotalTop5ByAreaForPrevYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

