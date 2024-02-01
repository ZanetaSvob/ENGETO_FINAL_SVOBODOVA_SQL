
SELECT 
GDP,
country AS AREA,
`year` ,
gini,
population 
FROM economies e 
WHERE country LIKE "%Europ%";

CREATE OR REPLACE TABLE t_countries_final AS
SELECT 
country,
continent,
population
FROM countries c 
WHERE continent = 'Europe' ;

CREATE OR REPLACE TABLE t_svobodova_final  AS
SELECT 
e.year, 
e.country , 
e.population,
e.GINI, 
e.GDP AS GDP,
ROUND( e.GDP - e2.GDP, 2) AS Previous_year,
ROUND( (AVG(e.GDP) * 100) / AVG(e2.GDP)-100, 2) AS Interannual_percentage_difference				
FROM economies e 
JOIN t_countries_final AS tcf 
ON e.country = tcf.country AND tcf.continent = "Europe"
JOIN economies e2
ON e.country = e2.country AND e.YEAR = e2.YEAR+1
GROUP BY e.YEAR, tcf.country;


CREATE OR REPLACE TABLE t_zaneta_svobodova_project_SQL_secondary_final
SELECT 
*
FROM  t_svobodova_final 
WHERE country != "Czech republic";