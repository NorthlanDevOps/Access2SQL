TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.RadioLinkType, Count(IncidentDetails.ID) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.RadioLinkType) Is Not Null) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()))
GROUP BY IncidentDetails.RadioLinkType
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

