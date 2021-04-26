SELECT s.eid,SUM(c.price) AS totalamount 
FROM calendar c,schedule s 
WHERE c.vid = s.vid AND c.date = s.date 
GROUP BY s.eid
ORDER BY s.eid DESC;