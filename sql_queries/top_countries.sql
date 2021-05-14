WITH top AS
  (SELECT DISTINCT country_code,
                   sum(positive_cases) AS positive_cases
   FROM covid
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 10)
SELECT country_code,
       dt,
       sum(positive_cases)/sum(tests_done) AS positivity_rate
FROM covid
WHERE country_code IN
    (SELECT country_code
     FROM top)
And year(dt) =2021
group by 1,2
