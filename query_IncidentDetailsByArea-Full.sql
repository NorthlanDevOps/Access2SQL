SELECT IncidentDetailsByArea.Area, IncidentType.TypeNumber, IncidentType.IncidentType, IncidentDetailsByArea.[Total Of ID], IncidentDetailsByArea.Jan, IncidentDetailsByArea.Feb, IncidentDetailsByArea.Mar, IncidentDetailsByArea.Apr, IncidentDetailsByArea.May, IncidentDetailsByArea.Jun, IncidentDetailsByArea.Jul, IncidentDetailsByArea.Aug, IncidentDetailsByArea.Sep, IncidentDetailsByArea.Oct, IncidentDetailsByArea.Nov, IncidentDetailsByArea.Dec
FROM IncidentType LEFT JOIN IncidentDetailsByArea ON IncidentType.IncidentType = IncidentDetailsByArea.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

