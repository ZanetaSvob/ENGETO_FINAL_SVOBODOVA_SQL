----Q4

SELECT 
tzspspf.YEAR AS YEAR,
AVG(tzspspf.interannual_percentage_difference) AS AVG_Interannual_Industry_Growth,
AVG(tzspspf2.interannual_percentage_difference) AS AVG_Interannual_Food_Growth,
(AVG(tzspspf2.interannual_percentage_difference)) - (AVG(tzspspf.interannual_percentage_difference)) AS Difference
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
JOIN t_zaneta_svobodova_project_sql_primary_final tzspspf2 
	ON tzspspf.YEAR = tzspspf2.YEAR 
WHERE tzspspf.name_type_code = 111 AND tzspspf2.name_type_code = 222 
GROUP BY YEAR 
ORDER BY difference DESC