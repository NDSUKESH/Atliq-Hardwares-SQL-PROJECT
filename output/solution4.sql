WITH T1 AS 
	(SELECT P.segment AS A , COUNT(DISTINCT(P.product_code)) AS B 
    FROM dim_product P, fact_sales_monthly FS
    WHERE P.product_code = FS.product_code
    GROUP BY FS.fiscal_year, P.segment
    HAVING FS.fiscal_year = "2020"),
T2 AS
    (
	SELECT P.segment AS C , COUNT(DISTINCT(P.product_code)) AS D 
    FROM dim_product P, fact_sales_monthly FS
    WHERE P.product_code = FS.product_code
    GROUP BY FS.fiscal_year, P.segment
    HAVING FS.fiscal_year = "2021"
    )     
    
SELECT T1.A AS segment, T1.B AS product_count_2020, T2.D AS product_count_2021, (T2.D-T1.B) AS difference  
FROM T1, T2
WHERE T1.A = T2.C  order by difference desc;
