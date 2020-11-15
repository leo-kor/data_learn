select 
city,
count(distinct order_id) as number_orders,
sum(sales) as revenue
from public.orders o
where category in ('Furniture', 'Technology') --category not in ('Office Supplies')
and extract('year' from order_date) = 2018
group by 1
having sum(sales) > 10000
order by revenue desc;

/*select distinct 
category
from orders;*/

select 
count(*),
count(distinct o.order_id)
from orders o left join returns r on o.order_id = r.order_id 

---9994 rows
-- inner 3226 rows
-- left 5009 rows

select 
count(*),
count(distinct o.order_id)
from orders o
where order_id in (select distinct order_id from "returns")

select date_trunc('day',now()) --timestamp