select t1.a as unique2020 , t2.b as unique2021 , round(((b-a)*100/a),2) from (
(select count(distinct product_code) as a from fact_sales_monthly where fiscal_year=2020) t1,
(select count(distinct product_code) as b from fact_sales_monthly where fiscal_year=2021 ) t2
);