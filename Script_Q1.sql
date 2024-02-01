
SELECT 
*,
CASE 
	WHEN Interannual_percentage_difference > 0 THEN 1
	ELSE 0
END AS Growth_wages
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
WHERE Name_type_code = 111 
ORDER BY growth_wages;

