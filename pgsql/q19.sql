SELECT DISTINCT h.oid FROM host h WHERE
NOT EXISTS ((SELECT vid FROM venue WHERE area = 'C')
EXCEPT (SELECT s.vid FROM schedule s, host h WHERE
    h.eid = s.eid))
    ORDER BY h.oid;