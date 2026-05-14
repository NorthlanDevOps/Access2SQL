SELECT IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.SubArea, IncidentDetails.DVRReferredType, IncidentDetails.DVRReferredTo, Areas.Database
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area = Areas.Area
WHERE (((IncidentDetails.Area) Like [forms]![reportsmenu]![area]) AND ((IncidentDetails.Date) Between [Forms]![YTDSelection]![from] And [forms]![ytdselection]![to]) AND ((Areas.Database) Is Null) AND ((IncidentDetails.IncidentType)="DVR"))
ORDER BY IncidentDetails.Area, IncidentDetails.SubArea;

