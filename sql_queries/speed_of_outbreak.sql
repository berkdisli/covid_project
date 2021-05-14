
Select 
case when sum(positive_cases)/sum(population) <= 0.0005 then 'Low'
when sum(positive_cases)/sum(population) > 0.0005 and  sum(positive_cases)/sum(population) <= 0.001  then 'Moderately Low'
when sum(positive_cases)/sum(population) > 0.001 and  sum(positive_cases)/sum(population) <=0.002  then 'Moderate'
when sum(positive_cases)/sum(population)> 0.002 and  sum(positive_cases)/sum(population)<=0.003  then 'Moderately High'
When sum(positive_cases)/sum(population)> 0.003 then 'High' END as speed_categorisation from covid 
where year(dt) =2021
---and country_code = 'USA'



