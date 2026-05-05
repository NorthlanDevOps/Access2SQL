SELECT IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.NPAReferredType, IncidentDetails.NPAReferredTo, IncidentDetails.NPADateReferred, IncidentDetails.NPADateComplete
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((IncidentDetails.SubArea) Like "*Town Centre*") AND ((IncidentDetails.NPADateReferred)>=[forms]![reportsmenu]![from] And (IncidentDetails.NPADateReferred)<=[forms]![reportsmenu]![to]) AND ((IncidentDetails.NPADateComplete) Is Null) AND ((IncidentDetails.IncidentType)="NPA") AND ((Areas.Database) Is Null)) OR (((IncidentDetails.SubArea) Like "*Shopping Area*") AND ((IncidentDetails.NPADateReferred)>=[forms]![reportsmenu]![from] And (IncidentDetails.NPADateReferred)<=[forms]![reportsmenu]![to]) AND ((IncidentDetails.NPADateComplete) Is Null) AND ((IncidentDetails.IncidentType)="NPA") AND ((Areas.Database) Is Null))
ORDER BY IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.NPADateReferred;

