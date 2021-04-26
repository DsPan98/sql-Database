SELECT vid, capacity
FROM venue
WHERE (AREA = 'B' OR AREA = 'C')
AND capacity >100
ORDER BY capacity DESC, vid;