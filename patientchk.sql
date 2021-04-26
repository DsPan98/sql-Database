SELECT DISTINCT O.Track, O.time, H.Hname
From Observation O join HCP H
ON O.Hid = H.Hid AND O.track like '%breathing%' AND Iname = 'Samantha Adam'
ORDER BY O.time DESC
