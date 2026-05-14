SELECT DISTINCT Areas.Area, TotalIncidentsByAreaForYear_Crosstab.[Total Of count], TotalIncidentsByAreaForYear_Crosstab.[Qtr 1] AS Expr1, TotalIncidentsByAreaForYear_Crosstab.[Qtr 2] AS Expr2, TotalIncidentsByAreaForYear_Crosstab.[Qtr 3] AS Expr3, TotalIncidentsByAreaForYear_Crosstab.[Qtr 4]
FROM Areas LEFT JOIN TotalIncidentsByAreaForYear_Crosstab ON Areas.Area = TotalIncidentsByAreaForYear_Crosstab.Area
WHERE (((Areas.Database) Is Null))
GROUP BY Areas.Area, TotalIncidentsByAreaForYear_Crosstab.[Total Of count], TotalIncidentsByAreaForYear_Crosstab.[Qtr 1], TotalIncidentsByAreaForYear_Crosstab.[Qtr 2], TotalIncidentsByAreaForYear_Crosstab.[Qtr 3], TotalIncidentsByAreaForYear_Crosstab.[Qtr 4]
HAVING (((Areas.Area) Is Not Null));

