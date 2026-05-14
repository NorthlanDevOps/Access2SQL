TRANSFORM Count(OperatorIncidentsFinal.ID) AS CountOfID
SELECT OperatorIncidentsFinal.TypeNumber, OperatorIncidentsFinal.IncidentType, Count(OperatorIncidentsFinal.ID) AS [Total Of ID]
FROM OperatorIncidentsFinal
GROUP BY OperatorIncidentsFinal.TypeNumber, OperatorIncidentsFinal.IncidentType
PIVOT OperatorIncidentsFinal.operatorname;

