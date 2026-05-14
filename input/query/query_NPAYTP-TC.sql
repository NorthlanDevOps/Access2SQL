SELECT IncidentDetails.Area, IncidentDetails.Date, IncidentDetails.SubArea, IncidentDetails.NPAReferredType, IncidentDetails.NPADateReferred, IncidentDetails.NPADateComplete
FROM IncidentDetails INNER JOIN Areas ON IncidentDetails.Area=Areas.Area
WHERE (((IncidentDetails.Date) Between Forms!YTDSelection!from And forms!ytdselection!to) And ((IncidentDetails.SubArea) Like "*Town Centre*") And ((IncidentDetails.NPADateReferred) Is Not Null) And ((IncidentDetails.IncidentType)="NPA") And ((Areas.Database) Is Null)) Or (((IncidentDetails.Date) Between Forms!YTDSelection!from And forms!ytdselection!to) And ((IncidentDetails.SubArea) Like "*Shopping Area*") And ((IncidentDetails.NPADateReferred) Is Not Null) And ((IncidentDetails.IncidentType)="NPA") And ((Areas.Database) Is Null))
ORDER BY IncidentDetails.Area, IncidentDetails.SubArea, IncidentDetails.NPADateReferred;

