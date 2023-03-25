use gdb023;
select distinct(market) from dim_customer
where region = "APAC" and customer="Atliq Exclusive"
