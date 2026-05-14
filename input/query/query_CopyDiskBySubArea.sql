TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.CopyDisc, Count(IncidentDetails.CopyDisc) AS [Total Of ID]
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.CopyDisc)=-1) And ((IncidentDetails.Date)>=Forms!reportsmenu!from And (IncidentDetails.Date)<=Forms!reportsmenu!to) And ((IncidentDetails.Area) Like Forms!reportsmenu!area) And ((Areas.Database) Is Null))
GROUP BY IncidentDetails.CopyDisc, Areas.Database
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

