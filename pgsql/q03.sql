SELECT v.vid, v.capacity
FROM venue v
WHERE EXISTS (
SELECT * 
FROM calendar c
WHERE v.vid = c.vid AND c.price < 100 AND c.date = '2020-01-16')
 AND v.area = 'C'
ORDER BY v.vid;
