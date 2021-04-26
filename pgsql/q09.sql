SELECT DISTINCT e.eid, s.date 
FROM event e, schedule s WHERE e.eid = s.eid AND
e.type = 'music' AND
e.eid IN (SELECT eid from participate where pid = 12345678) AND
e.eid NOT IN (SELECT eid from participate where pid = 12345679)
ORDER BY e.eid DESC, s.date;