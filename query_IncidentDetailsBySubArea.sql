TRANSFORM Sum(IncidentsSubTable.ID) AS SumOfID
SELECT IncidentsSubTable.IncidentType, IncidentsSubTable.SubArea, Sum(IncidentsSubTable.ID) AS [Total Of ID]
FROM IncidentsSubTable
WHERE (((IncidentsSubTable.Date)>=#1/1/2007# And (IncidentsSubTable.Date)<=Date()) And ((IncidentsSubTable.SubArea)=Forms!search!subarea))
GROUP BY IncidentsSubTable.IncidentType, IncidentsSubTable.SubArea
ORDER BY IncidentsSubTable.IncidentType, IncidentsSubTable.SubArea
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

