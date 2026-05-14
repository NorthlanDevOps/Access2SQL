TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.CriminalIncidentType, IncidentDetails.Area, IncidentDetails.SubArea, Count(IncidentDetails.ID) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.CriminalIncidentType) Is Not Null) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()) AND ((IncidentDetails.RadioLinkType) Is Null))
GROUP BY IncidentDetails.CriminalIncidentType, IncidentDetails.RadioLinkType, IncidentDetails.Area, IncidentDetails.SubArea
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

