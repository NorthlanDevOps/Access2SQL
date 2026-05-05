INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [Date], IncidentType, [Year] )
SELECT IncidentDetails.NoAppCautions, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions" AS Expr1, (Year([date])) AS Expr2
FROM IncidentDetails
WHERE (((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned"))
GROUP BY IncidentDetails.NoAppCautions, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions", (Year([date]))
HAVING ((((Year([date])))=Year(Now())-1));

