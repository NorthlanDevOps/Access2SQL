INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [Date], IncidentType )
SELECT IncidentDetails.NoAppCautions, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned") AND ((Areas.Database) Is Null))
GROUP BY IncidentDetails.NoAppCautions, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "App/Cautions"
HAVING (((IncidentDetails.Date) Between forms!YTDSelection!from And forms!ytdselection!to));

