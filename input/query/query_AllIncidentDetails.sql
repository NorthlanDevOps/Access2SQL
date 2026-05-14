TRANSFORM Count(IncidentsSubTable.ID) AS CountOfID
SELECT IncidentsSubTable.IncidentType, Count(IncidentsSubTable.ID) AS [Total Of ID]
FROM IncidentsSubTable
GROUP BY IncidentsSubTable.IncidentType
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

