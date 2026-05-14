TRANSFORM Sum(IncidentsSubTable.ID) AS SumOfID
SELECT IncidentsSubTable.IncidentType, IncidentsSubTable.Area, Sum(IncidentsSubTable.ID) AS [Total Of ID]
FROM IncidentsSubTable
WHERE (((IncidentsSubTable.Area)=Forms!reportsmenu!area))
GROUP BY IncidentsSubTable.IncidentType, IncidentsSubTable.Area
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

