# ENGETO_FINAL_SVOBODOVA_SQL
ENGETO SQL. FINAL PROJECT
Zdravím,

Předkládám vám průvodní list k datům, která jste chtěli zpracovat. 
První úkol a vytvoření tabulek byl opravdu velký oříšek, ale po několikadenním trápení se to snad podařilo.

Velký problém pro mě představovaly duplicitní záznamy u mezd při join tabulky, nicméně jsem nakonec po poradě Matouše se rozhodla data zařadit pod sebe, a tak se zbavit duplicit. Někdy jsem si v průběhu úkolu vypomohla vytvořením podtabulky, veškerou cestu tvorby najdete v přiložených sql. Dokumentech. 

U druhé tabulky představovalo velký problém zobrazení roku, respektive měření jen pro rok 2018 v tabulce countries, ale snad se mi to podařilo vyřešit. 

Při řešení jednotlivých úkolů a otázek jsem si zpětně pouštěla záznamy z lekce, procházela postupně všechny úkoly v doplňujících a sem tam jsem se poradila s ChatGTP, který mě v jednom případě dobře navedl, ale musela jsem to ještě hodně poupravit a zároveň si i zopakovat základní matematické úlohy a ověřit si tak správnost dat. 

Nyní již konkrétněji k datům.
U tabulky číslo 1 jsem se rozhodla zavést kód 111 pro MZDY a 222 pro POTRAVINY, abych s nimi mohla dále pracovat, pro ulehčení zodpovídání dalších úkolů jsem rovnou vytvořila tabulku meziročního rozdílu jak v konkrétní hodnotě, tak v procentech. Pro další práci jsem přidala i kód potravin z tabulky czechia_price a kód oborů z tabulky czechia_payroll. 

V sql. Dokumentu jsem ponechala poznámky. Snad to nevadí.

Nyní k zodpovězení otázek.

1.	Otázka
-	V průběhu let nerostou mzdy ve všech odvětvích, v některých dokonce klesají. Jedná se např. o meziroční rozdíl v oboru Zdravotní a sociální péče či v roce 2021 meziroční rozdíl v Zemědělství, lesnictví a rybářství. Vytvořila jsem odstavec Growing_Wages, kde když je hodnota -1, značí to, že mzdy oproti předchozímu roku poklesly. Když je tam hodnota 0, mzdy se meziročně nezměnily a při hodnotě 1 mzdy meziročně vzrostly.

2.	Otázka 
-	U této otázky bych potřebovala upřesnit, zdali se myslí chleba a mléka dohromady, nebo odděleně, vypočítala jsem to tedy vše. Měření mezd probíhalo od roku 2001 do roku 2021, potravin od roku 2007 do roku 2018, proto jsem jako roky měření vybrala první a poslední společný průsečík – tedy rok 2007 a 2018.
-	Pro účely této otázky jsem u mzdy vypočítala její průměrnou částku pro rok 2007 a 2018. 
-	Jednotlivé sloupce jsem pojmenovala, snad pochopitelně. 
-	Pokud by šlo o nákup společně, v roce 2007 bylo možné získat dohromady 602,85 kilo chleba a litrů mléka dohromady! Nikoliv každého zvlášť, v roce 2018 to bylo už 715.
-	V roce 2007 bylo možné za průměrnou mzdu nakoupit cca 1101 kilo chleba, anebo nakoupit 1331.76 litrů mléka.
-	V roce 2018 bylo možné za průměrnou mzdu nakoupit cca 1300 kilo chleba, anebo cca 1590 litrů mléka.

3.	Otázka
-	Potravinou, u níž je nejnižší meziroční nárůst, je Eidamská cihla v roce 2018, kdy meziroční nárůst činil pouze 0,09 procenta. Pracovala jsem pouze s těmi daty, kde byl růst větší než 0.

4.	Otázka 
-	Tato otázka byla velmi těžká, ale to byly všechny. Meziroční nárůst cen potravin výrazně vyšší než růst mezi o více jak 10 % byl největší v letech 2009 a 2011. Velmi výrazný byl i v roce 2007. Ale bylo možné nalézt i v dalších letech některé případy, kdy tomu tak bylo. Určila jsem proto limit 20, abych mohla vybrat nejčastěji zastoupené roky. Jednalo se navíc hlavně a v prvních 20případech pouze o rajčata a pečivo.

5.	Otázka
-	U této otázky jsem vytvořila podmínky zvlášť pro ovlivnění mezd v současném roce a v dalším roce a také pro ovlivnění cen potravin v současném roce a v dalším roce. 
-	Pro vyšší růst HDP jsem určila hodnotu více jak tři, pokud HDP tedy vzrostlo meziročně o víc jak tři procenta, v tabulce Increace_HDP je číslo 1. Pokud tento růst ovlivnil výši mezd a potravin, musí být v jednotlivých tabulkách také číslo jedna. Tabulky jsou rozděleny na současnost, která je vytvořena rozdílem oproti předchozímu roku a budoucnost, která je určena rozdílem oproti současnosti.

Pokud budete mít jakékoliv dotazy, kontaktujte mě na e-mail: vojtechovska.z@gmail.com.

Mějte se fajn! Jdu na druhý úkol.
Žaneta Svobodová

