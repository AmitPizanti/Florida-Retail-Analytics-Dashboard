use Retail;

Select sa.*, 
	   sa.sales_usd/sa.customers as sales_per_customer,
	   DATENAME(WEEKDAY, sa.date) as day_of_week,
	   case when DATEPART(WEEKDAY, sa.date) in (1,7) then 'Weekend' else 'Weekday' end as day_type,
	   su.*, 
	   w.*
From sales as sa
left join survey as su ON sa.date = su.date
left join weather as w on sa.date = w.date
