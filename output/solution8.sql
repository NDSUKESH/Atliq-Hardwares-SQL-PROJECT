SELECT 
CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then '1(september to november)'
    WHEN date BETWEEN '2019-12-01' AND '2020-02-01' then '2(december to february)'
    WHEN date BETWEEN '2020-03-01' AND '2020-05-01' then '3(march to may)'
    WHEN date BETWEEN '2020-06-01' AND '2020-08-01' then '4(june to augest)'
    END AS Quarters,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
order by total_sold_quantity desc limit 1;