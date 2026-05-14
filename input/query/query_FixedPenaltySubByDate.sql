INSERT INTO IncidentsByDateTable ( [Count], ID, Area, SubArea, [Date], IncidentType )
SELECT IncidentDetails.NoFixedPenalties, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Fixed Penalties Issued" AS Expr1
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((Areas.Database) Is Null) AND ((IncidentDetails.Result)="Fixed Penalty"))
GROUP BY IncidentDetails.NoFixedPenalties, IncidentDetails.ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, "Fixed Penalties Issued"
HAVING (((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((IncidentDetails.Date)>=forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to));

