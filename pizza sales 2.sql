-- 1)Join the necessary tables to find the total quantity of each pizza category ordered.
select sum(order_details.quantity) , pizza_types.category
from pizzas join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.category
order by sum(order_details.quantity) desc

-- 2)Determine the distribution of orders by hour of the day.

 select hour(time), count(order_id)
 from orders 
 group by time 
 
 -- 3)Join relevant tables to find the category-wise distribution of pizzas.
 select category,count(name) 
 from pizza_types
 group by category
 
 -- 4)Group the orders by date and calculate the average number of pizzas ordered per day.
 select date, round(avg(order_id),0) as average_number_of_pizzas
 from orders
 group by date;
 
 -- 5) Determine the top 3 most ordered pizza types based on revenue.
 select pizza_types.name , round(sum(order_details.quantity * pizzas.price),0) as revenue
 from pizza_types join pizzas
 on pizzas.pizza_type_id=pizza_types.pizza_type_id
 join order_details 
 on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name 
order by revenue desc limit 3