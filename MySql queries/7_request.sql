select 	monthname(date) as month,Extract(year from date) as year,
 round(sum(sold_quantity*g.gross_price)/1000000,2) as gross_sales_amt_in_millions
 from fact_sales_monthly f join dim_customer d on f.customer_code=d.customer_code
						   join fact_gross_price g on f.product_code = g.product_code
						   where d.customer = "Atliq Exclusive"
						   group by month,year
                           