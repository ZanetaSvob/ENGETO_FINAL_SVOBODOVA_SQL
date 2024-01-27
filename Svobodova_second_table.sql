
/* VYTVÁŘENÍ DRUHÉ TABULKY/*
 * 
 */

select
GDP,
country as AREA,
`year` ,
gini,
population 
from economies e 
where country like "%Europ%";

select 
country,
population
from countries c 
where continent = 'Europe' ;


create or replace table t_svobodova_final  as
select 
e.year, 
e.country , 
e.population,
e.GINI, 
AVG(e.GDP) as GDP,
round( e.GDP - e2.GDP, 2) as Previous_year,
round( (e.GDP - e2.GDP) / e2.GDP * 100, 2) as Interannual_percentage_difference
from economies e 
join t_countries_final tcf 
on e.country = tcf.country and tcf.continent = "Europe"
join economies e2 
on e.year = e2.year+1
group by e.year, e.country; 


create or replace table t_zaneta_svobodova_project_SQL_secondary_final
select 
*
from t_svobodova_final 
where country != "Czech republic";




