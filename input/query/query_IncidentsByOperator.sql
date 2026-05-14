SELECT IncidentDetails.ID, IncidentDetails.IncidentType, IncidentDetails.Date, IncidentDetails.Area, IncidentDetails.Watch, IncidentDetails.Operator, IncidentDetails.SubArea INTO AllIncidentsbyOperator
FROM IncidentDetails
WHERE (((IncidentDetails.IncidentType) Is Not Null) AND ((IncidentDetails.Date)>=[Forms]![operatormenu]![from] And (IncidentDetails.Date)<=[Forms]![operatormenu]![to]) AND ((IncidentDetails.Operator) Like [Forms]![operatormenu]![operator]));

