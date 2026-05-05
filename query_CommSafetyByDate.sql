SELECT IncidentDetails.CommunitySafetyType, Count(IncidentDetails.CommunitySafetyType) AS [No of Comm Safety], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
FROM IncidentDetails
GROUP BY IncidentDetails.CommunitySafetyType, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.CommunitySafetyType) Is Not Null) AND ((IncidentDetails.Date)>=[from] And (IncidentDetails.Date)<=[to]))
ORDER BY IncidentDetails.Watch, IncidentDetails.Date;

