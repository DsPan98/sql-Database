SELECT v.vid, v.area, v.capacity FROM venue v WHERE EXISTS
(select * from schedule s, host h WHERE
	s.eid = h.eid AND v.vid = s.vid AND h.oid = 6)
	ORDER BY v.vid, v.capacity;