---q2

SELECT
MIN(YEAR),
MAX(YEAR)
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
WHERE name_type_code = 222;

SELECT
*
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
WHERE name_type_code = 222 AND YEAR = 2018;

select 
(ROUND(AVG(tzspspf.value), 2)) / (tzspspf2.value + tzspspf5.value)  as 2007_Shopping_together,
(ROUND(AVG(tzspspf3.value), 2)) / (tzspspf6.value + tzspspf4.value) as 2018_shopping_together,
(ROUND(AVG(tzspspf.value), 2) / tzspspf2.value) as 2007_Shopping_bread,
(ROUND(AVG(tzspspf.value), 2) / tzspspf5.value) as 2007_Shopping_milk,
(ROUND(AVG(tzspspf3.value), 2) / tzspspf6.value) as 2018_Shopping_bread,
(ROUND(AVG(tzspspf3.value), 2) / tzspspf4.value) as 2018_Shopping_milk,
tzspspf.year as First_year,
tzspspf3.year as Last_year,
ROUND(AVG(tzspspf.value), 2) as Average_wages_2007,
ROUND(AVG(tzspspf3.value), 2) as Average_wages_2018,
tzspspf2.name as Food_1,
tzspspf2.value as Food_1_price_2007,
tzspspf6.value as Food_1_price_2018,
tzspspf4.name as Food_2,
tzspspf5.value as Food_2_price_2007,
tzspspf4.value as Food_2_price_2018
from t_zaneta_svobodova_project_sql_primary_final tzspspf 
join t_zaneta_svobodova_project_sql_primary_final tzspspf2 
on tzspspf2.year = tzspspf.year
join t_zaneta_svobodova_project_sql_primary_final tzspspf3
on tzspspf3.year - 11 = tzspspf.year
join t_zaneta_svobodova_project_sql_primary_final tzspspf4
on tzspspf4.year - 11 = tzspspf.year
join t_zaneta_svobodova_project_sql_primary_final tzspspf5
on tzspspf5.year = tzspspf.year
join t_zaneta_svobodova_project_sql_primary_final tzspspf6
on tzspspf6.year - 11 = tzspspf.year
where tzspspf.year = 2007 and tzspspf.Name_type_code = 111 and tzspspf3.year = 2018 and tzspspf3.Name_type_code = 111 and tzspspf4.year = 2018 and tzspspf2.code = 111301 and tzspspf4.code = 114201 and tzspspf5.year = 2007 and
 tzspspf5.code = 114201 and tzspspf6.year = 2018 and tzspspf6.code = 111301