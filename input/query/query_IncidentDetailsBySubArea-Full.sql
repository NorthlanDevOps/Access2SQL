SELECT IncidentType.TypeNumber, IncidentType.IncidentType, IncidentDetailsBySubArea.SubArea, IncidentDetailsBySubArea.[Total Of ID], IncidentDetailsBySubArea.Jan, IncidentDetailsBySubArea.Feb, IncidentDetailsBySubArea.Mar, IncidentDetailsBySubArea.Apr, IncidentDetailsBySubArea.May, IncidentDetailsBySubArea.Jun, IncidentDetailsBySubArea.Jul, IncidentDetailsBySubArea.Aug, IncidentDetailsBySubArea.Sep, IncidentDetailsBySubArea.Oct, IncidentDetailsBySubArea.Nov, IncidentDetailsBySubArea.Dec
FROM IncidentType LEFT JOIN IncidentDetailsBySubArea ON IncidentType.IncidentType = IncidentDetailsBySubArea.IncidentType
ORDER BY IncidentType.TypeNumber, IncidentType.IncidentType;

