INSERT INTO OperatorIncidentsTable ( ID, Operator, Watch, [Date], IncidentType )
SELECT IncidentDetails.NoAppCautions AS ID, IncidentDetails.Operator, IncidentDetails.Watch, IncidentDetails.Date, IncidentDetails.Result
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.Watch) Like forms!reportsmenu!watch) And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=forms!reportsmenu!to) And ((IncidentDetails.Result)="apprehended" Or (IncidentDetails.Result)="cautioned") And ((Areas.Database) Is Null));

