
/*VYTVOŘENÍ FINÁLNÍ VERZE TABULKY*/ 


create or replace table t_zaneta_svobodova_project_sql_primary_final AS
select 
tm.year,
tm.Name_type_code,
tm.code,
tm.name, 
tm.value,
round( (tm.value - tm2.value ), 2) as Previous_year,
round( (tm.value - tm2.value) / tm.value * 100, 2) as Interannual_percentage_difference
from t_mzdy_1 tm 
join t_mzdy_1 tm2 
on tm.name = tm2.name
and tm.year = tm2.year + 1
union 
select tp.`year` , 
tp.name_type_code,
tp.code,
tp.name, 
tp.value,
round( (tp2.value - tp.value ), 2) as Previous_year,
round( (tp2.value - tp.value) / tp2.value * 100, 2) as Interannual_percentage_difference
from t_potraviny_1 tp 
join t_potraviny_1 tp2 
on tp.name = tp2.name
and tp.year = tp2.year + 1;



