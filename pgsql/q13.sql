SELECT COUNT (DISTINCT pid) AS numpeople FROM person WHERE pid = ANY (SELECT pid FROM participate WHERE eid =  ANY (SELECT eid FROM host WHERE oid = 1));