
Select country_code, sum(positive_cases)/sum(tests_done) AS positivity_rate from covid
where year(dt) =2021
group by 1
