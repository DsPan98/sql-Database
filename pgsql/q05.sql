SELECT p.pid, p.pname
FROM person p
WHERE EXISTS (SELECT *
			 	FROM participate pt
			 	WHERE pt.pid = p.pid
			 	AND pt.eid = 5)
ORDER BY p.pid;