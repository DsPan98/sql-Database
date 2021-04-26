SELECT borough, Count(*) AS "number of infected persons"
From patient
GROUP BY borough
Having COUNT(*) > 0
ORDER BY COUNT(*) DESC, borough