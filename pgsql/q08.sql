SELECT e.eid, s.date 
FROM event e, schedule s WHERE
e.type = 'fundraising' AND
e.eid = s.eid AND
e.eid IN (SELECT eid from participate where pid = 12345678)
AND
e.eid IN (SELECT eid from participate where pid = 12345679)
ORDER BY eid DESC, date;