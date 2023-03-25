use gdb023;
with cte as
 (Select count( distinct product_code) as unique_products_2020 from fact_sales_monthly where fiscal_year = 2020)
,
 cte1 as (Select count(distinct product_code) as unique_products_2021 from fact_sales_monthly where fiscal_year = 2021)

 select  unique_products_2020,unique_products_2021, round((unique_products_2021-unique_products_2020)*100/unique_products_2020,2)
 as percentage_difference
 from cte cross join cte1 
