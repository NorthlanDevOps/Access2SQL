SELECT 1 AS count, IncidentDetails.ID,  IncidentDetails.RadioLinkType, IncidentDetails.Area, IncidentDetails.Date, Year([date]) AS [Year]
FROM IncidentDetails
WHERE (((IncidentDetails.RadioLinkType)="Yes") AND ((Year([date]))=Year(Now())));
UNION SELECT 0 AS count, IncidentDetailsforReports.ID, IncidentDetailsforReports.RadioLinkType, IncidentDetailsforReports.Area, IncidentDetailsforReports.Date, Year([date]) AS [Year]
FROM IncidentDetailsforReports
WHERE (Year([date]))=Year(Now());

