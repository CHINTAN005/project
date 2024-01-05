Create database pizza_sales;
use pizza_sales;

-- KPI
-- Problem statment 

-- 1. Total Revenue
select round(sum(total_price),2) as "Total Revenue" from pizza_sales1;

-- 2. Average Order Value
select round((sum(total_price)) / count(order_id),2) as "Average Order Value" from pizza_sales1;

-- 3. Total Pizzas Sold
select sum(quantity) as "Total Pizzas Sold" from pizza_sales1;

-- 4. Total Orders
select count(order_id) from pizza_sales1;

-- 5. Average Pizza Per Order
select round(sum(quantity),2)/count(distinct order_id) as Average_pizza_per_order from pizza_sales1 ;




-- Charts requirements 
-- 1. Daily trend for total Orders 
select order_date ,round(sum(total_price),2) 
from pizza_sales1
group by order_date
order by order_date desc
limit 5;


-- 2. Monthly Trend for Total Orders
select extract(hour from order_time) as hour_of_day,count(order_id) as total_price
from pizza_sales1
group by extract(hour from order_time)
order by hour_of_day desc
limit 10;

-- Q3. Percentage of Sales by Pizza Category
select  pizza_category, sum(total_price) as category_sales from  pizza_sales1
group by pizza_category;

-- Q4. Percentage of Sales by Pizza Size
select pizza_size ,sum(total_price) as category_sales
from pizza_sales1
group by pizza_size;

-- Q5. Total Pizza Sold by Pizza Category
select pizza_category,sum(quantity) as total_sales 
from pizza_sales1
group by pizza_category;

-- Q6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name_id as pizza_name,sum(total_price) as revenue
from pizza_sales1
group by pizza_name
order by total_price desc
limit 5;

-- Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales1
group by pizza_name
order by total_quantity desc
limit 5;
 
-- total orders
select pizza_name, count(order_id) as total_orders
from pizza_sales1
group by pizza_name
order by total_orders desc
limit 5;


-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name_id as pizza_name , sum(total_price) as revenue
from pizza_sales1
group by pizza_name
order by revenue asc
limit 5;

-- Total Quantity
select pizza_name_id as pizza_name , sum(quantity) as total_quantity
from pizza_sales1
group by pizza_name
order by total_quantity asc
limit 5;

-- Total orders
select pizza_name_id as pizza_name , count(order_id) as total_orders
from pizza_sales1
group by pizza_name
order by total_orders asc
limit 5;
