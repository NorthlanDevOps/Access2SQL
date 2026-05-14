SELECT IncidentDetails.RadioLinkType, Count(IncidentDetails.RadioLinkType) AS [No of Radio Link], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
FROM IncidentDetails
GROUP BY IncidentDetails.RadioLinkType, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.RadioLinkType) Is Not Null) AND ((IncidentDetails.Date)>=[from] And (IncidentDetails.Date)<=[to]))
ORDER BY IncidentDetails.Watch, IncidentDetails.Date;

