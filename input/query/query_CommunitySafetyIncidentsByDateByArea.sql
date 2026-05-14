INSERT INTO AllIncidentsByDateByArea ( [Incident Type], [No of Incidents], Area, SubArea, Watch, [Date] )
SELECT IncidentDetails.CommunitySafetyType, Count(IncidentDetails.CommunitySafetyType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
FROM IncidentDetails
GROUP BY IncidentDetails.CommunitySafetyType, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.CommunitySafetyType) Is Not Null) AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![Area]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![From] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![To]))
ORDER BY IncidentDetails.SubArea, IncidentDetails.Date;

