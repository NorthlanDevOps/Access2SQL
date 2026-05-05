INSERT INTO IncidentsByDateTable ( [Count], ID, Area, SubArea, [Date], IncidentType )
SELECT IncidentDetails.NoAppCautions, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((Areas.Database) Is Null) AND ((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned")) OR (((Areas.Database) Is Null) AND ((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned"))
GROUP BY IncidentDetails.NoAppCautions, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions"
HAVING (((IncidentDetails.SubArea) Like "*Town Centres*") And ((IncidentDetails.Date)>=forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to)) Or (((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.Date)>=forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to));

