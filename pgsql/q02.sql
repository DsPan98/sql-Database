SELECT v.vid, v.capacity
FROM venue v JOIN calendar c
ON v.vid = c.vid AND v.area = 'C' 
	AND c.price < 100 AND c.date = '2020-01-16'
ORDER BY v.vid;