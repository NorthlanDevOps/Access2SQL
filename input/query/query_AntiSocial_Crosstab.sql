TRANSFORM Count(IncidentDetails.ID) AS CountOfID
SELECT IncidentDetails.AntiSocialBehaviourType, Count(IncidentDetails.ID) AS [Total Of ID]
FROM IncidentDetails
WHERE (((IncidentDetails.AntiSocialBehaviourType) Is Not Null) AND ((IncidentDetails.Date)>=#1/1/2007# And (IncidentDetails.Date)<=Date()) AND ((IncidentDetails.RadioLinkType) Is Null))
GROUP BY IncidentDetails.AntiSocialBehaviourType, IncidentDetails.RadioLinkType
PIVOT Format([Date],"mmm") In ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

