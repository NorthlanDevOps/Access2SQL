SELECT OperatorIncidentsTable.ID, Operator.operatorname, Operator.watch, OperatorIncidentsTable.Date, OperatorIncidentsTable.IncidentType
FROM Operator LEFT JOIN OperatorIncidentsTable ON Operator.operatorname=OperatorIncidentsTable.Operator;

