SELECT DISTINCT i.iname, i.email, i.phone 
FROM individual i, contact c
WHERE i.iname = c.inameto AND c.iname IN
(SELECT i.iname FROM individual i, patient p where i.email = 'dub.vizer@br.com' AND i.iname = p.iname)

