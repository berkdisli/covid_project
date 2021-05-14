SELECT count(DISTINCT country_code) distinct_locations,
       sum(positive_cases) AS positive_cases,
       sum(tests_done) tests_done,
       sum(positive_cases)/sum(tests_done) AS positivity_rate,
       sum(tests_done)/sum(population) AS testing_rate
FROM covid
---WHERE date(dt) BETWEEN date'2021-01-01' AND ---date'2021-02-01'
---AND country_code = 'USA'
