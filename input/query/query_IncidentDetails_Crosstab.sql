TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.CriminalIncidentType, Count(IncidentDetails.ID) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.CriminalIncidentType) Is Not Null) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()) AND ((IncidentDetails.RadioLinkType) Is Null))
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.RadioLinkType
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

