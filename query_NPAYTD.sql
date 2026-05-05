SELECT IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.SubArea, IncidentDetails.NPAReferredType, IncidentDetails.NPADateReferred, IncidentDetails.NPADateComplete
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((IncidentDetails.Area) Like [forms]![reportsmenu]![area]) AND ((IncidentDetails.Date) Between [Forms]![YTDSelection]![from] And [forms]![ytdselection]![to]) AND ((IncidentDetails.NPADateReferred) Is Not Null) AND ((IncidentDetails.IncidentType)="NPA") AND ((Areas.Database) Is Null))
ORDER BY IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.NPADateReferred;

