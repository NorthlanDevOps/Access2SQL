SELECT DISTINCT Areas.Area, TotalTop5ByAreaForYear_Crosstab.[Total Of Count], TotalTop5ByAreaForYear_Crosstab.[Qtr 1], TotalTop5ByAreaForYear_Crosstab.[Qtr 2], TotalTop5ByAreaForYear_Crosstab.[Qtr 3], TotalTop5ByAreaForYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalTop5ByAreaForYear_Crosstab ON Areas.Area = TotalTop5ByAreaForYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalTop5ByAreaForYear_Crosstab.[Total Of Count], TotalTop5ByAreaForYear_Crosstab.[Qtr 1], TotalTop5ByAreaForYear_Crosstab.[Qtr 2], TotalTop5ByAreaForYear_Crosstab.[Qtr 3], TotalTop5ByAreaForYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

