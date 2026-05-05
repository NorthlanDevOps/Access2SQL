TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.CopyDisc, Count(IncidentDetails.CopyDisc) AS [Total Of CopyDisc]
FROM IncidentDetails
WHERE (((IncidentDetails.CopyDisc)=-1) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()))
GROUP BY IncidentDetails.CopyDisc
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

