with cte as 
(Select f.product_code, division,d.product,sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly f join dim_product d on f.product_code=d.product_code
where fiscal_year = 2021
group by division,f.product_code,d.product_code
order by total_sold_quantity desc ) ,
cte1 as(select division,product_code,dense_rank() over(partition by division order by total_sold_quantity DESC) as rank_number  from cte)
select division,product_code from cte1 where rank_number<=3