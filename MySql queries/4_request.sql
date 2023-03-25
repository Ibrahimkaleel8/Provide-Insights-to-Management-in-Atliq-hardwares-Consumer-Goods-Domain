use gdb023;
with cte as 
(Select count(distinct f.product_code) as unique_product_2020,d.segment from fact_sales_monthly f 
join dim_product d on f.product_code=d.product_code WHERE f.fiscal_year=2020 group by d.segment order by unique_product_2020),

cte1 as (Select count(distinct f.product_code) as unique_product_2021,d.segment from fact_sales_monthly f 
join dim_product d on f.product_code=d.product_code WHERE f.fiscal_year=2021 group by d.segment order by unique_product_2021)

select cte.unique_product_2020, cte1.unique_product_2021,
Round((unique_product_2021-unique_product_2020)*100/unique_product_2020,2) as difference, cte.segment
 from cte join cte1 on cte.segment = cte1.segment group by segment order by difference desc