SELECT 1 AS ID, IncidentDetails.RadioLinkType, IncidentDetails.Area, IncidentDetails.Date, Year([date]) AS [Year]
FROM IncidentDetails
WHERE (((IncidentDetails.RadioLinkType)="Yes") AND ((Year([date]))=Year(Now())-1));

