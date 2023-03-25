use gdb023;
Select f.customer_code,customer,
Round(avg(pre_invoice_discount_pct) over(order by pre_invoice_discount_pct DESC)*100,2) as avg_disc_perc
 from fact_pre_invoice_deductions f 
join dim_customer d on f.customer_code = d.customer_code
where fiscal_year = 2021 and market = 'India'
order by avg_disc_perc DESC LIMIT 5