SELECT DISTINCT Areas.Area, TotalAppsByAreaForPrevYear_Crosstab.[Total Of NoAppCautions], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 1], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 2], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 3], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalAppsByAreaForPrevYear_Crosstab ON Areas.Area = TotalAppsByAreaForPrevYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalAppsByAreaForPrevYear_Crosstab.[Total Of NoAppCautions], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 1], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 2], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 3], TotalAppsByAreaForPrevYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

