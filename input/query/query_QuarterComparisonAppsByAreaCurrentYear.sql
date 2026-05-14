SELECT DISTINCT Areas.Area, TotalAppsByAreaForYear_Crosstab.[Total Of NoAppCautions], TotalAppsByAreaForYear_Crosstab.[Qtr 1], TotalAppsByAreaForYear_Crosstab.[Qtr 2], TotalAppsByAreaForYear_Crosstab.[Qtr 3], TotalAppsByAreaForYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalAppsByAreaForYear_Crosstab ON Areas.Area = TotalAppsByAreaForYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalAppsByAreaForYear_Crosstab.[Total Of NoAppCautions], TotalAppsByAreaForYear_Crosstab.[Qtr 1], TotalAppsByAreaForYear_Crosstab.[Qtr 2], TotalAppsByAreaForYear_Crosstab.[Qtr 3], TotalAppsByAreaForYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

