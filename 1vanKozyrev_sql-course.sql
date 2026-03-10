-- Select all brands.

SELECT brand_name AS Brand
FROM production.brands

-- Customers from Bronx and Brooklyn

SELECT
    customer_id AS "Cust ID",
    last_name AS "Last name",
    first_name AS "First name",
    email AS Email,
    street AS "Street Address",
    city AS City,
    state AS State
FROM sales.customers
WHERE city IN ('Bronx', 'Brooklyn')
ORDER BY city, last_name;

-- All Products, brand should be readable not id
SELECT
    product_name AS "Product name",
    brand_name AS Brand,
    model_year AS Model,
    list_price AS Price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
ORDER BY product_name DESC;

--All Products, brand should be readable not id. 
SELECT
    p.product_name AS "Product name",
    b.brand_name AS Brand,
    p.model_year AS Model,
    p.list_price AS Price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
ORDER BY p.product_name DESC;

--Use SQL COUNT() function to get number of customers who are from state NY.
SELECT COUNT(*) AS "NY Customers"
FROM sales.customers
WHERE state = 'NY';

--All products that Pamala Henry from Bronx NY has ordered.
SELECT 
    p.product_name AS "Product name",
    b.brand_name AS Brand,
    p.list_price AS Price
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.brands b ON p.brand_id = b.brand_id
WHERE o.customer_id = (
    SELECT customer_id 
    FROM sales.customers 
    WHERE first_name = 'Pamala' 
      AND last_name = 'Henry' 
      AND city = 'Bronx' 
      AND state = 'NY'
)
ORDER BY product_name ASC;
