TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.CopyDisc, Count(IncidentDetails.CopyDisc) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.CopyDisc)=-1) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()) AND ((IncidentDetails.Area)=[Forms]![reportsmenu]![area]))
GROUP BY IncidentDetails.CopyDisc
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

