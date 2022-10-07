SELECT industry,EXTRACT(YEAR FROM d.date_joined) AS year,COUNT(*) AS num_unicorns,ROUND(AVG(f.valuation)/1000000000,2)
AS average_valuation_billions
FROM industries AS i
INNER JOIN companies AS c
ON c.company_id=i.company_id
INNER JOIN dates AS d
ON d.company_id=c.company_id
INNER JOIN funding AS f
On f.company_id=d.company_id
WHERE EXTRACT(YEAR FROM d.date_joined) IN (2021,2020,2019)
AND 
industry IN 
--start of the subquery for top three performing industries
(SELECT industry
FROM industries AS i
INNER JOIN companies AS c
ON c.company_id=i.company_id
INNER JOIN dates AS d
ON d.company_id=c.company_id
WHERE EXTRACT(YEAR FROM d.date_joined) IN (2021,2020,2019)
GROUP BY industry
ORDER BY COUNT(*) DESC 
LIMIT 3) 
--end of subquery

GROUP BY year,industry
ORDER BY industry,year DESC;
