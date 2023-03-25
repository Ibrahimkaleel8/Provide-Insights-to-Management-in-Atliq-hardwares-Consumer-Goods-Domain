select case 
when month(date) In (9,10,11) Then "Q1"
when month(date) IN (12,1,2) then "Q2"
when month(date) IN (3,4,5) then "Q3"
when month(date) IN (6,7,8) then "Q4"
End as Quarter ,format(Sum(sold_quantity), "#0,000,000") as total_sold_quantity
from fact_sales_monthly 
where fiscal_year = 2020
 group by Quarter
 order by total_sold_quantity Desc