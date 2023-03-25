with cte as(
 select distinct d.channel, round(sum(sold_quantity*g.gross_price)/1000000,2) as gross_sales_in_million
 from fact_sales_monthly f join dim_customer d on f.customer_code=d.customer_code
 join fact_gross_price g on f.product_code = g.product_code
 where f.fiscal_year = 2021
 group by channel),
cte1 as(select sum(gross_sales_in_million) as total_sales from cte) 
 
 select cte.*,round((gross_sales_in_million*100)/sum(total_sales),2) as percentage from cte
 join cte1 group by channel
 order by gross_sales_in_million DESC