SELECT p.pid, p.pname FROM person p WHERE
pid = ANY (
SELECT pid FROM participate 
WHERE pid != 12345678 AND eid = ANY
(SELECT eid FROM participate WHERE pid = 12345678)
)
ORDER BY p.pid;