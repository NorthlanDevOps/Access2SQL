SELECT IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.SubArea, IncidentDetails.DVRReferredType, IncidentDetails.DVRReferredTo, Areas.Database
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.Date) Between Forms!YTDSelection!from And forms!ytdselection!to) And ((IncidentDetails.SubArea) Like "*Town Centres*") And ((Areas.Database) Is Null) And ((IncidentDetails.IncidentType)="DVR")) Or (((IncidentDetails.Date) Between Forms!YTDSelection!from And forms!ytdselection!to) And ((IncidentDetails.SubArea) Like "*Shopping Area*") And ((Areas.Database) Is Null) And ((IncidentDetails.IncidentType)="DVR"))
ORDER BY IncidentDetails.Area, IncidentDetails.SubArea;

