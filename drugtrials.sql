SELECT Dname, Recovered, NotRecovered FROM(
	SELECT a.Dname,
		sum(case when p.status = 'recovered' then 1 else 0 end) AS Recovered,
		sum(case when p.status = 'deceased' or 'infected' then 1 else 0 end) AS NotRecovered
	FROM patient p, Administrated a
	WHERE p.iname = a.iname
	Group by Dname
) a
WHERE Recovered > 0 AND NotRecovered > 0
