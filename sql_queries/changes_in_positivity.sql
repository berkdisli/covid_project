
WITH row_num_ AS
  (SELECT country_code,
          date_trunc('month',dt) MONTH,
              sum(positive_cases) positive_cases , sum(tests_done) tests_done ,
             ROW_NUMBER() OVER (PARTITION BY country_code
                                ORDER BY date_trunc('month',dt) ASC) row_num
   FROM covid
   WHERE date_trunc('year',dt)= 2021 
   GROUP BY 1,
            2)
SELECT country_code,
       MONTH,
       row_num,
(sum(positive_cases)/sum(tests_done)) AS positivity_rate, 
       ((sum(positive_cases)/sum(tests_done))  - LAG((sum(positive_cases)/sum(tests_done)) ) OVER (PARTITION BY country_code
                                               ORDER BY MONTH,
                                                        row_num ASC)) / LAG((sum(positive_cases)/sum(tests_done)) ) OVER (PARTITION BY country_code
                                                                                                ORDER BY MONTH,
                                                                                                         row_num ASC) AS difference
FROM row_num_
GROUP BY 1,
         2,
         3
