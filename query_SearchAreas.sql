select distinct areas.[area]
from areas
where database is null;
UNION SELECT addareas.[additional]
FROM addareas;

