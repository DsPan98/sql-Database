Select l.vid, SUM(num) AS numevents FROM 
((SELECT DISTINCT v.vid, 0 AS num FROM venue v)
Union ALL (SELECT d.vid, 1 FROM
    (SELECT DISTINCT vid, eid FROM schedule) d)) l
    GROUP BY l.vid
    ORDER BY l.vid;