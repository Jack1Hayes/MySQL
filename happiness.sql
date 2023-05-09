
-- top 10 for each metric
SELECT country,  RANK() OVER (
        ORDER BY `Happiness Rank`) As `Rank`
FROM y2015 -- change for year
LIMIT 10;

SELECT `country name`, Generosity, `Explained by: Social support`, GENxSOC, RANK() OVER (
        ORDER BY GENxSOC DESC) As `Rank Gen`
FROM (SELECT *, Generosity*`Explained by: Social support` as GENxSOC
FROM y2020) as T1 -- change for year
LIMIT 10;

-- Most Generous countries with best social support
SELECT `country name`, Generosity, `Social support`, RANK() OVER (
        ORDER BY `Rank Generosity`+`Rank Social support` ) As `Rank Genxsoc`, `Rank Generosity`, `Rank Social support`
FROM (SELECT *, RANK() OVER (
        ORDER BY Generosity DESC) As `Rank Generosity`, RANK() OVER (
        ORDER BY `Social support` DESC) as `Rank Social support`
FROM y2020) as T1 -- change for year
LIMIT 100;

-- Does the perception of generosity depend on GDP per capita?

SELECT `country name`, Generosity, `Logged GDP per capita`, RANK() OVER (
        ORDER BY `Rank Generosity`+`Rank Logged GDP per capita` ) As `Rank Genxsoc`, `Rank Generosity`, `Rank Logged GDP per capita`
FROM (SELECT *, RANK() OVER (
        ORDER BY Generosity DESC) As `Rank Generosity`, RANK() OVER (
        ORDER BY `Logged GDP per capita` DESC) as `Rank Logged GDP per capita`
FROM y2020) as T1 -- change for year
LIMIT 100;

-- What are the average happiness scores by region?

SELECT `Regional indicator`, `Ladder score`, RANK() OVER(ORDER BY `Ladder score`DESC) AS `happy rank`
FROM y2020
GROUP BY `Regional indicator`;


