

select * from pizza_sales_db.pizza_sales;

-- 1. Total Revenue:

select sum(total_price) as Total_Revenue from pizza_sales;

-- 2. Average Order Value:

select sum(total_price)/count(distinct(order_id)) as Avg_Order_Value from pizza_sales;

-- 3. Total Pizzas Sold:

select sum(quantity) as pizza_sold  from pizza_sales;

-- 4. Total Orders:

select count(distinct(order_id)) as Total_Order from pizza_sales;

-- 5. Average Pizzas Per Order:

select Sum(quantity)/count(distinct(order_id)) as Avg_Pizza_Sold from pizza_sales;


-- Intermidiate Query
-- 6. Daily Trend for Total Orders:

select* from pizza_sales;

select dayofweek(order_date) as day , count(distinct(order_id)) as Daily_order  from pizza_sales

group by 1;  -- only retrive 7 days

-- 7. Monthly Trend for Orders:
select dayofmonth(order_date) as month , count(distinct(order_id)) as Daily_order  from pizza_sales group by 1;  -- same

select month(order_date) as day , count(distinct(order_id)) as Daily_order  from pizza_sales
group by 1; 

select day(order_date) as day , count(distinct(order_id)) as Daily_order  from pizza_sales
group by 1; -- same

-- 8. % of Sales by Pizza Category 

select * from pizza_sales;

select pizza_category ,sum(total_price) as Total_pizzas_sale,
round((sum(total_price)/(select sum(total_price) from pizza_sales)),4)* 100 percentage_pizza_category from pizza_sales
 
 group by 1;
 
-- 9.% of Sales by Pizza Size:

SELECT 
    pizza_size,
    SUM(total_price) AS Total_pizzas_sale,
    ROUND((SUM(total_price) / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales)),
            4) * 100 as percentage_pizza_size
FROM
    pizza_sales
GROUP BY pizza_size;

-- 10 Total Pizzas Sold by Pizza Category:

select pizza_category, sum(quantity) as quantity_ordered from pizza_sales
group by 1;

-- 11. Top 5 Pizzas by Revenue:
select * from pizza_sales;

select pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name order by Total_Revenue desc limit 5;

-- 12. Bottom 5 Pizzas by Revenue:
select pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name order by Total_Revenue asc limit 5;

-- 13. Top 5 Pizzas by Quantity:

select pizza_name, sum(quantity) as Total_quantity from pizza_sales
group by pizza_name order by Total_quantity desc limit 5;

-- 15. Bottom 5 Pizzas by Quantity
select pizza_name, sum(quantity) as Total_quantity from pizza_sales
group by pizza_name order by Total_quantity asc limit 5;


-- advanced query for pizza sales
-- 1. Total Sales per Pizza Type

select * from pizza_sales;
select pizza_category, sum(quantity) as total_sales from pizza_sales
group by pizza_category
order by sum(quantity);

-- 2. Daily Sales and Average Order Value
-- This query calculates daily sales, including the average order value (AOV).

select pizza_name, dayofmonth(order_date) as date ,sum(total_price)/count(distinct order_id) as Average_order_value from pizza_sales
group by pizza_name, dayofmonth(order_date);

-- 3. Sales During Peak Hours (e.g., Evening Time)
-- This query filters and calculates sales for orders placed between 6 PM and 9 PM:

select * from pizza_sales;

select pizza_category, hour(order_time) as Order_by_hour, sum(quantity) as Quantity_sold from pizza_sales
group by pizza_category, hour(order_time) ;

-- 4. Average Number of Pizzas Ordered per Customer
-- This query calculates the average number of pizzas ordered per customer

select order_id, avg(quantity) as Average_pizza_order from pizza_sales group by order_id;



















