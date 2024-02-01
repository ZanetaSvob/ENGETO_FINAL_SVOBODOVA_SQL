---Q3

SELECT 
*
FROM t_zaneta_svobodova_project_sql_primary_final tzspspf 
WHERE Name_type_code = 222 AND Interannual_percentage_difference > 0
ORDER BY Interannual_percentage_difference 
LIMIT 1;