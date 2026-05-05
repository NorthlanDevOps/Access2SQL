SELECT 1 AS ID, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Date, IncidentDetails.IncidentType, (Year([Date])) AS [Year] INTO IncidentsSubTable
FROM IncidentDetails
WHERE ((((Year([Date])))=Year(Now())-1));

