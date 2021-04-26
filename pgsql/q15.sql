 SELECT o.oid, o.oname FROM organization o WHERE o.oid IN
  (SELECT oid FROM 
    (SELECT oid, COUNT(*) AS span from host h, schedule s WHERE h.eid = s.eid
    Group by oid, h.eid) d where span > 2)
    ORDER BY oid;