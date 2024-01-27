
/* 1. 
 * 
ROSTOU V PRŮBĚHU LET MZDY VE VŠECH ODVĚTVÍCH, NEBO V NĚKTERÝCH KLESAJÍ?*
 * Ne, mzdy nerostou ve všech odvětvích, v některých dokonce klesají. 
 */

select 
*,
case
	when Previous_year > 0 then 1
	when previous_year < 0 then -1
	else 0
end as GROWING_WAGES
from t_zaneta_svobodova_project_sql_primary_final
where Name_type_code = 111 and Previous_year < 0
group by `year`, name
order by growing_wages 
;

¨/*nebo
/
 */

select 
*
from t_zaneta_svobodova_project_sql_primary_final
where Name_type_code = 111 and Previous_year < 0
group by `year`, name;


/*ukol 2
 * Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 * 
 * Měření mezd je od roku 2001 do roku 2021, měření jídla od 2007 a 2018.
*/ 



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




select  
min(`year`),
max(`year`)
from t_zaneta_svobodova_project_sql_primary_final tzspspf 
where Name_type_code = 222;

select 
max(`year`)
from t_zaneta_svobodova_project_sql_primary_final tzspspf ;

select 
round( avg(value), 2)
from t_zaneta_svobodova_project_sql_primary_final tzspspf 
where year = 2018 and Name_type_code = 111;

select 
*
from t_zaneta_svobodova_project_sql_primary_final tzspspf 
where Name_type_code = 222 and year 2001;

/* 3. OTÁZKA
 * KTERÁ KATEGORIE POTRAVIN ZDRAŽUJE NEJPOMALEJI (JE U NÍ NEJNIŽŠÍ PERCENTUÁLNÍ MEZIROČNÍ NÁRŮST)?
 * Nejnižší percentuální meziroční nárůst ceny byl v roce 2018 u eidamu.
 */

select 
name,
Interannual_percentage_difference,
`year` 
from t_zaneta_svobodova_project_sql_primary_final tzspspf 
where Name_type_code = 222 and Interannual_percentage_difference > 0
order by Interannual_percentage_difference 
limit 1;


/


/* otázka číslo 4
 * existuje rok, ve kterém byl meziročné nárůst cen potravin výrazně vyšší než růst mezd(větší než 10%)?
 * 
 * Ano, let je více, nicméně pokud limit 20 největších rozdílů - převažuje rok 2009 a 2011, dalším vévodícím rokem je rok 2007, ale je jich víc.
 */


 select 
 tzspspf.`year` as year,
 tzspspf.Name_type_code as 111_code,
 tzspspf.name as INDUSTRY,
 tzspspf.value as INDUSTRY_VALUE,
 tzspspf.Interannual_percentage_difference as 111_interannual,
 tzspspf2.Name_type_code as 222_code,
  tzspspf2.NAME as FOOD,
  tzspspf2.VALUE as FOOD_VALUE,
  tzspspf2.Interannual_percentage_difference as 222_interannual,
 (tzspspf2.Interannual_percentage_difference - tzspspf.Interannual_percentage_difference) as growth_rate_difference
 from t_zaneta_svobodova_project_sql_primary_final tzspspf 
 join t_zaneta_svobodova_project_sql_primary_final tzspspf2 
 on tzspspf2.year = tzspspf.year
 where tzspspf.Name_type_code = 111 and tzspspf2.Name_type_code = 222 and (tzspspf2.Interannual_percentage_difference - tzspspf.Interannual_percentage_difference) >= 10
and  tzspspf.Interannual_percentage_difference > 0 and tzspspf2.Interannual_percentage_difference > 0
order by GROWTH_RATE_DIFFERENCE desc 
limit 20;


/* 5. OTÁZKA
 *VÝŠKA HDP A JEJÍ VLIV NA RŮST MEZD A CENY POTRAVIN?
 *
 *Ano, růst HDP nad 3% může mít vliv na růst mezd v současném i budoucím roce, také má vliv na vývoj cen potravin 
 *a jejich zdražení v současnosti a také v budoucím roce, a to např. u hovězího masa či eidamu.
 Na konci je možné vytvořit podmínky pro zjištění potravin či mezd.
 /* ZJIŠTĚNÍ VLIVU HDP NA VÝVOJ CENY MEZD*/
 

 select 
 asa.`year`,
 asa.name,
 asa.value, 
 asa.name_type_code,
round( (asa.value - asa2.value ), 2) as Next_year,
round( (asa.value - asa3.value ), 2) as Last_year,
case 
	when se.Interannual_percentage_difference > 3  then 1
	else 0
end as Increace_HDP,
case 
	when asa.name_type_code = 111 and asa.value > asa3.value   then 1
	else 0
	end as WAGES_DIFFERENCE_PREVIOUS_YEAR,
case 
	when asa.name_type_code = 111 and asa.value > asa2.value +1000 then 1
	else 0
end as WAGES_DIFFERENCE_FUTURE_YEAR,
case 
	when asa.name_type_code = 222 and asa.value  > asa3.value then 1
	else 0
	end as FOOD_DIFFERENCE_PREVIOUS_YEAR,
case 
	when asa.name_type_code = 222 and asa.value > asa2.value +5  then 1
	else 0
	end as FOOD_DIFFERENCE_FUTURE_YEAR
 from t_zaneta_svobodova_project_sql_primary_final as asa
 join t_zaneta_svobodova_project_sql_secondary_final as SE 
 	on asa.`year` = se.`year` 
 join t_zaneta_svobodova_project_sql_primary_final as asa2 
 	on asa.name = asa2.name and asa.year = asa2.`year`+1  
 join t_zaneta_svobodova_project_sql_primary_final as asa3
 on asa.name = asa3.name and asa.year = asa3.`year`-1
;





