SELECT DISTINCT Areas.Area, TotalIncidentsByAreaForPrevYear_Crosstab.[Total Of ID], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 1], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 2], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 3], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalIncidentsByAreaForPrevYear_Crosstab ON Areas.Area = TotalIncidentsByAreaForPrevYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalIncidentsByAreaForPrevYear_Crosstab.[Total Of ID], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 1], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 2], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 3], TotalIncidentsByAreaForPrevYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

