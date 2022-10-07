
%%sql
postgresql:///international_debt

SELECT *
FROM international_debt
LIMIT 10;

%%sql
SELECT 
    COUNT(DISTINCT(country_name)) AS total_distinct_countries
FROM international_debt;

%%sql
SELECT
    DISTINCT (indicator_code) as distinct_debt_indicators
FROM international_debt
GROUP BY distinct_debt_indicators
ORDER BY distinct_debt_indicators;

%%sql
SELECT 
    ROUND(SUM(debt)/1000000, 2) as total_debt
FROM international_debt; 

%%sql
SELECT 
    country_name, 
    SUM(debt) as total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC 
LIMIT 1;

%%sql
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

%%sql
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                  MAX(debt)
              FROM international_debt
              WHERE indicator_code='DT.AMT.DLXF.CD');
              
%%sql
SELECT 
    indicator_code,
    COUNT(indicator_code) as indicator_count
FROM international_debt
GROUP BY indicator_code, indicator_name
ORDER BY indicator_count DESC
LIMIT 20;
