INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [Date], IncidentType )
SELECT IncidentDetails.NoFixedPenalties, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Fixed Penalty" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((IncidentDetails.Result)="fixed penalty") AND ((Areas.Database) Is Null))
GROUP BY IncidentDetails.NoFixedPenalties, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Fixed Penalty"
HAVING (((IncidentDetails.Date) Between [forms]![YTDSelection]![from] And [forms]![ytdselection]![to]));

