SELECT n.type, AVG(n.SUM) as averageamount FROM
(SELECT m.eid, m.type, SUM(m.price) FROM 
(SELECT e.eid, e.type, s.vid, s.date, c.price 
FROM event e, schedule s, calendar c
WHERE e.eid = s.eid AND s.vid = c.vid AND s.date = c.date) m
GROUP BY m.type, m.eid
ORDER BY m.eid) n GROUP BY n.type
ORDER BY n.type;