TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.Result, Count(IncidentDetails.ID) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.Result)="cautioned" Or (IncidentDetails.Result)="apprehended") AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()))
GROUP BY IncidentDetails.Result
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

