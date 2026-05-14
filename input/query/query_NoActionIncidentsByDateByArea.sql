INSERT INTO AllIncidentsByDateByArea ( [Incident Type], [No of Incidents], Area, SubArea, Watch, [Date] )
SELECT IncidentDetails.Result, Count(IncidentDetails.Result) AS [No of Incidents], IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
FROM IncidentDetails
GROUP BY IncidentDetails.Result, IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.Watch, IncidentDetails.Date
HAVING (((IncidentDetails.Result)="Monitored No Action") AND ((IncidentDetails.Area) Like [Forms]![reportsmenu]![Area]) AND ((IncidentDetails.Watch) Like [Forms]![reportsmenu]![watch]) AND ((IncidentDetails.Date)>=[Forms]![reportsmenu]![From] And (IncidentDetails.Date)<=[Forms]![reportsmenu]![To]))
ORDER BY IncidentDetails.SubArea, IncidentDetails.Date;

