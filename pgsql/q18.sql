SELECT v.vid, COALESCE(numevents, 0) FROM venue v LEFT OUTER JOIN
(SELECT vid, COUNT(DISTINCT eid) as numevents FROM schedule GROUP BY vid) c
ON v.vid = c.vid
Order BY v.vid;