select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)*1.0/count(distinct(order_id)) as Average_Order_Value  from pizza_sales

select sum(quantity) as Total_Quantity from pizza_sales

--  % of sales by pizza_category 
 select pizza_category , sum(total_price) * 100 /(select sum(total_price) from pizza_sales  where month(order_date)=1) as Total_sales
 from pizza_sales 
 where month(order_date)=1 /*january*/
 group by pizza_category

-- total pizza sold by pizza catogery
select pizza_size ,sum(total_price) as Total_sales,
cast(sum(total_price) * 100 /(select sum(total_price) from pizza_sales  where datepart(quarter,order_date)=1)as decimal(10,2)) as PCT
from pizza_sales 
where datepart(quarter,order_date)=1
group by pizza_size
order by PCT DESC

-- Top 5 best sellers by Revenue 
select top 5 pizza_name , sum(total_price) as Total_r from pizza_sales 
group by pizza_name
order by Total_r desc

-- Bottom 5 best sellers by Revenue
select top 5 pizza_name , sum(total_price) as Total_r from pizza_sales 
group by pizza_name
order by Total_r asc

-- Top 5 best sellers by Quantity
select top 5 pizza_name , sum(quantity) as Total_q from pizza_sales 
group by pizza_name
order by Total_q desc

-- Bottom 5 best sellers by Quantity
select top 5 pizza_name , sum(quantity) as Total_q from pizza_sales 
group by pizza_name
order by Total_q asc

-- Top 5 best sellers by Orders
select top 5 pizza_name , count(distinct order_id) as Total_o from pizza_sales 
group by pizza_name
order by Total_o desc

-- Bottom 5 best sellers by Orders
select top 5 pizza_name , count(distinct order_id) as Total_o from pizza_sales 
group by pizza_name
order by Total_o asc