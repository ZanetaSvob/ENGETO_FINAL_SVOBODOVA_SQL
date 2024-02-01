

CREATE OR REPLACE TABLE t_POTRAVINY_1 AS
SELECT
		year(cp.date_from) AS Year,
		cpc.code as Code,
    	cpc.name,
    	ROUND(AVG(cp.value), 2) AS Value,
    	CASE 
	    WHEN category_code IS NOT NULL THEN 222
	    	ELSE 0
		END AS Name_type_code
 FROM czechia_price cp 
   JOIN czechia_price_category cpc
   ON cp.category_code = cpc.code
 GROUP by year(cp.date_from), cpc.name;
 

SELECT tp.`year` , 
tp.name_type_code,
tp.name, 
tp.value,
ROUND( (tp2.value - tp.value), 2) as Previous_year,
ROUND( (tp.value * 100) / tp2.value - 100, 2) as Interannual_percentage_difference
FROM t_potraviny_1 tp 
JOIN t_potraviny_1 tp2 
ON tp.name = tp2.name
AND  tp.year = tp2.year + 1;

CREATE OR REPLACE TABLE t_MZDY_1 AS
SELECT 
cp.payroll_year AS year,
cp.industry_branch_code AS Code,
cpib.name, 
cp.value,
CASE 
	WHEN value_type_code = 5958 THEN 111
	ELSE 0
END AS Name_type_code
FROM czechia_payroll cp 
	JOIN czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code and cp.value_type_code = 5958 and cp.value is not null  
GROUP BY cpib.name, cp.payroll_year ;

CREATE OR REPLACE TABLE t_zaneta_svobodova_project_sql_primary_final AS
SELECT 
tm.year,
tm.Name_type_code,
tm.code,
tm.name, 
tm.value,
ROUND( (tm2.value - tm.value ), 2) AS Previous_year,
ROUND( (tm.value * 100) / tm2.value - 100, 2) AS Interannual_percentage_difference
FROM t_mzdy_1 tm 
JOIN t_mzdy_1 tm2 
ON tm.name = tm2.name
AND tm.year = tm2.year + 1
UNION  
SELECT tp.`year` , 
tp.name_type_code,
tp.code,
tp.name, 
tp.value,
ROUND( (tp2.value - tp.value ), 2) as Previous_year,
ROUND( (tp.value * 100) / tp2.value - 100, 2) as Interannual_percentage_difference
FROM t_potraviny_1 tp 
JOIN t_potraviny_1 tp2 
ON tp.name = tp2.name
AND tp.year = tp2.year + 1;
