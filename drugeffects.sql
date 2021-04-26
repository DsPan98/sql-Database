SELECT COUNT(*)
FROM Observation o 
WHERE o.TRACK = '%dizz%' 
AND EXISTS
(SELECT 
FROM ADMINISTRATED a
WHERE DNAME = 'tocilizumab' AND O.iname = a.iname
 AND o.time > a.time
) 
AND NOT EXISTS
(SELECT 
FROM ADMINISTRATED a
WHERE DNAME = 'tocilizumab' AND O.iname = a.iname
 AND o.time < a.time
) 
