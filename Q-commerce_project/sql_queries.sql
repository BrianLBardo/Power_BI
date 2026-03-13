-- Total Orders
SELECT COUNT(*) FROM orders;


-- Total number of products
SELECT COUNT(*) AS total_products
FROM products;


-- Total number of departments
SELECT COUNT(*) AS total_departments
FROM departments;


-- ORDER PER HOUR (DEMAND PATTERN)//
SELECT 
    order_hour_of_day AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour;


-- Total revenue//
SELECT 
    SUM(estimated_order_value) AS total_revenue
FROM order_profitability;


-- TOP SELLING DEPARTMENTS//
SELECT 
    d.department,
    COUNT(op.product_id) AS total_items_sold
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_items_sold DESC;


-- AVG DELIVERY TIME//
SELECT 
    AVG(delivery_time_minutes) AS avg_delivery_time
FROM deliveries;


-- STORE PERFORMANCE//
SELECT 
    ds.city,
    COUNT(d.order_id) AS total_orders,
    AVG(d.delivery_time_minutes) AS avg_delivery_time
FROM deliveries d
JOIN dark_stores ds 
ON d.dark_store_id = ds.dark_store_id
GROUP BY ds.city;


--Revenue by Department//

SELECT 
    d.department,
    SUM(op.estimated_order_value) AS department_revenue
FROM order_products p
JOIN products pr 
    ON p.product_id = pr.product_id
JOIN departments d 
    ON pr.department_id = d.department_id
JOIN order_profitability op
    ON p.order_id = op.order_id
GROUP BY d.department
ORDER BY department_revenue DESC;


-- Reorder Rate Calculation//
SELECT 
    d.department,
    AVG(CAST(p.reordered AS FLOAT)) AS reorder_rate
FROM order_products p
JOIN products pr 
    ON p.product_id = pr.product_id
JOIN departments d 
    ON pr.department_id = d.department_id
GROUP BY d.department
ORDER BY reorder_rate DESC;

--TOP product by orders//
SELECT 
    pr.product_name,
    COUNT(p.product_id) AS total_orders
FROM order_products p
JOIN products pr
    ON p.product_id = pr.product_id
GROUP BY pr.product_name
ORDER BY total_orders DESC;


-- TOP PROFITABLE ORDERS//
SELECT TOP 20 *
FROM order_profitability
ORDER BY contribution_margin DESC;
