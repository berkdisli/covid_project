Select dt, sum(tests_done)/sum(population) AS testing_rate from covid 
where year(dt) =2021
group by 1
