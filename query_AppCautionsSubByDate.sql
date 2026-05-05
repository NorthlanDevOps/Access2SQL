INSERT INTO IncidentsByDateTable ( [Count], ID, Area, SubArea, [Date], IncidentType )
SELECT IncidentDetails.NoAppCautions, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((Areas.Database) Is Null) AND ((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned"))
GROUP BY IncidentDetails.NoAppCautions, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions"
HAVING (((IncidentDetails.Area) Like [Forms]![reportsmenu]![area]) AND ((IncidentDetails.Date)>=[forms]![reportsmenu]![from] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![to]));

