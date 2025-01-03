
-- 1)Retrieve the total number of orders placed.

select count(order_id)as total_orders from  orders;

-- 2) Calculate the total revenue generated from pizza sales.
select
round(sum(pizzas.price * order_details.quantity),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id=order_details.pizza_id

-- 3)Identify the highest-priced pizza.

select pizza_types.name , pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- 4)Identify the most common pizza size ordered.
select pizzas.size , count(order_details.quantity)
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size 
order by count(order_details.quantity)  desc ;

-- 5)List the top 5 most ordered pizza types along with their quantities.
select pizzas.pizza_id , count(order_details.quantity)
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizza_id
order by count(order_details.quantity) desc limit 5;
 