

CREATE OR REPLACE TABLE t_czechia_hdp AS
SELECT
*
FROM t_svobodova_final tsf 
WHERE country = "czech republic";

SELECT 
tzspspf.`year` AS YEAR,
tch.Interannual_percentage_difference AS HDP_Growth,
CASE
	WHEN AVG(tzspspf.Interannual_percentage_difference) > 0 THEN 1
	ELSE 0
END AS Recent_Industry_Growth,
CASE
	WHEN AVG(tzspspf2.Interannual_percentage_difference) > 0 THEN 1
	ELSE 0
END AS Future_Industry_Growth,
CASE
	WHEN AVG(tzspspf3.Interannual_percentage_difference) > 0 THEN 1
	ELSE 0
END AS Recent_Food_Growth,
CASE
	WHEN AVG(tzspspf4.Interannual_percentage_difference) > 0 THEN 1
	ELSE 0
END AS Future_Food_Growth
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
JOIN t_zaneta_svobodova_project_sql_primary_final tzspspf2 
	ON tzspspf.YEAR = tzspspf2.YEAR +1
JOIN t_zaneta_svobodova_project_sql_primary_final tzspspf3
	ON tzspspf.YEAR = tzspspf3.YEAR 
JOIN t_zaneta_svobodova_project_sql_primary_final tzspspf4
	ON tzspspf.YEAR = tzspspf4.YEAR +1
JOIN t_czechia_hdp tch 
	ON tzspspf.YEAR = tch.year
WHERE tzspspf.name_type_code = 111 AND tzspspf2.name_type_code = 111 AND tzspspf3.name_type_code = 222 AND tzspspf4.name_type_code = 222 AND tch.Interannual_percentage_difference >3
GROUP BY YEAR 
