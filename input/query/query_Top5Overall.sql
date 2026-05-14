SELECT TOP 5 Top5Table.CriminalIncidentType, Top5Table.[No of Incidents]
FROM Top5Table
GROUP BY Top5Table.CriminalIncidentType, Top5Table.[No of Incidents]
ORDER BY Top5Table.[No of Incidents] DESC;

