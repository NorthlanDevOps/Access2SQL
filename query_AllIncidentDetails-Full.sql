SELECT IncidentType.TypeNumber, IncidentType.IncidentType, AllIncidentDetails.[Total Of ID], AllIncidentDetails.Jan, AllIncidentDetails.Feb, AllIncidentDetails.Mar, AllIncidentDetails.Apr, AllIncidentDetails.May, AllIncidentDetails.Jun, AllIncidentDetails.Jul, AllIncidentDetails.Aug, AllIncidentDetails.Sep, AllIncidentDetails.Oct, AllIncidentDetails.Nov, AllIncidentDetails.Dec
FROM IncidentType LEFT JOIN AllIncidentDetails ON IncidentType.IncidentType = AllIncidentDetails.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

