INSERT INTO AllIncidentsByDateByArea ( [Incident Type], [No of Incidents], Area, SubArea, Watch, [Date] )
SELECT IncidentDetails.AntiSocialBehaviourType, Count(IncidentDetails.AntiSocialBehaviourType) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
FROM IncidentDetails
GROUP BY IncidentDetails.AntiSocialBehaviourType, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.AntiSocialBehaviourType) Is Not Null) AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![Area]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![From] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![To]))
ORDER BY IncidentDetails.SubArea, IncidentDetails.Date;

