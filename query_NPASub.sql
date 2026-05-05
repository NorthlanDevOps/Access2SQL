INSERT INTO IncidentsSubTable ( ID, Area, SubArea, [date], IncidentType, [Year] )
SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.Result, (Year([Date])) AS [Year]
FROM IncidentDetails
WHERE (((IncidentDetails.Result)="NPA") AND (((Year([Date])))=Year(Now())));

