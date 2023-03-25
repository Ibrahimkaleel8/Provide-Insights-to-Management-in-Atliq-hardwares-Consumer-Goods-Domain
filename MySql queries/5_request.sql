use gdb023;
select f.product_code,product,manufacturing_cost from fact_manufacturing_cost f
 join dim_product d on f.product_code = d.product_code
 where manufacturing_cost IN
 ((Select max(manufacturing_cost) from fact_manufacturing_cost),(Select min(manufacturing_cost) from fact_manufacturing_cost)) 
 order by manufacturing_cost DESC
 