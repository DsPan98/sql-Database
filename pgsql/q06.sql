SELECT DISTINCT o.oid, o.oname 
FROM organization o, host h, schedule s 
WHERE o.oid = h.oid AND h.eid = s.eid AND s.date = '2020-01-16'
ORDER BY o.oid;