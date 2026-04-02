-- CREATE TABLE: SALES
CREATE TABLE sales (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    state VARCHAR(50),
    product VARCHAR(50),
    sales_amount INT,
    order_date DATE,
    channel VARCHAR(20)
);

-- INSERT DATA INTO SALES
INSERT INTO sales 
(customer_id, name, gender, age, state, product, sales_amount, order_date, channel)
VALUES
(101, 'Laxmi', 'Female', 23, 'Telangana', 'Clothing', 1500, '2024-01-10', 'Amazon'),
(102, 'Prasanna', 'Female', 25, 'Andhra Pradesh', 'Electronics', 2500, '2024-01-12', 'Flipkart'),
(103, 'Sony', 'Female', 22, 'Telangana', 'Beauty', 1200, '2024-01-15', 'Amazon'),
(104, 'Shiny', 'Female', 24, 'Karnataka', 'Clothing', 1800, '2024-01-18', 'Myntra'),
(105, 'Sai', 'Male', 26, 'Tamil Nadu', 'Electronics', 3000, '2024-01-20', 'Amazon'),
(106, 'Chandana', 'Female', 23, 'Telangana', 'Beauty', 900, '2024-01-22', 'Flipkart'),
(107, 'Deepa', 'Female', 21, 'Andhra Pradesh', 'Clothing', 1100, '2024-01-25', 'Myntra'),
(108, 'Mahi', 'Male', 27, 'Karnataka', 'Electronics', 2700, '2024-01-28', 'Amazon'),
(109, 'Krishna', 'Male', 28, 'Telangana', 'Clothing', 1600, '2024-02-01', 'Flipkart'),
(110, 'Vamsi', 'Male', 24, 'Tamil Nadu', 'Beauty', 800, '2024-02-03', 'Amazon'),
(111, 'Vijay', 'Male', 29, 'Karnataka', 'Electronics', 3200, '2024-02-05', 'Myntra'),
(112, 'Khanthi', 'Male', 26, 'Andhra Pradesh', 'Clothing', 1400, '2024-02-07', 'Flipkart'),
(113, 'Sokki', 'Female', 23, 'Telangana', 'Beauty', 1000, '2024-02-10', 'Amazon'),
(114, 'Bakku', 'Male', 27, 'Tamil Nadu', 'Electronics', 2800, '2024-02-12', 'Myntra'),
(115, 'Ravi', 'Male', 30, 'Kerala', 'Clothing', 1700, '2024-02-15', 'Amazon');

-- CHECK TABLE
DESC sales;

-- CREATE TABLE: CUSTOMERS_INFO
CREATE TABLE customers_info (
    customer_id INT,
    city VARCHAR(50),
    membership VARCHAR(20)
);

-- INSERT DATA INTO CUSTOMERS_INFO
INSERT INTO customers_info VALUES
(101, 'Hyderabad', 'Gold'),
(102, 'Vijayawada', 'Silver'),
(103, 'Warangal', 'Gold'),
(104, 'Bangalore', 'Platinum'),
(105, 'Chennai', 'Silver'),
(106, 'Hyderabad', 'Gold'),
(107, 'Vijayawada', 'Silver'),
(108, 'Bangalore', 'Gold'),
(109, 'Hyderabad', 'Platinum'),
(110, 'Chennai', 'Silver'),
(111, 'Kerala', 'Gold'),
(112, 'Delhi', 'Silver'),
(113, 'Mumbai', 'Gold'),
(114, 'Pune', 'Platinum'),
(115, 'Kolkata', 'Silver');

-- =====================
-- QUERIES
-- =====================

-- 1. View data
SELECT * FROM sales;

-- 2. Average sales
SELECT AVG(sales_amount) FROM sales;

-- 3. Highest sales
SELECT MAX(sales_amount) FROM sales;

-- 4. Lowest sales
SELECT MIN(sales_amount) FROM sales;

-- 5. Count customers
SELECT COUNT(*) FROM sales;

-- 6. Sales by gender
SELECT gender, SUM(sales_amount)
FROM sales
GROUP BY gender;

-- 7. Sales by state
SELECT state, SUM(sales_amount)
FROM sales
GROUP BY state;

-- 8. Sales by product
SELECT product, SUM(sales_amount)
FROM sales
GROUP BY product;

-- 9. Top customer
SELECT name, SUM(sales_amount) AS total
FROM sales
GROUP BY name
ORDER BY total DESC
LIMIT 1;

-- 10. Top 3 customers
SELECT name, SUM(sales_amount) AS total
FROM sales
GROUP BY name
ORDER BY total DESC
LIMIT 3;

-- 11. Female customers
SELECT * FROM sales
WHERE gender = 'Female';

-- 12. Sales > 2000
SELECT * FROM sales
WHERE sales_amount > 2000;

-- 13. Female & sales > 1500
SELECT * FROM sales
WHERE gender = 'Female' AND sales_amount > 1500;

-- 14. Sort by sales desc
SELECT * FROM sales
ORDER BY sales_amount DESC;

-- 15. February orders
SELECT * FROM sales
WHERE order_date BETWEEN '2024-02-01' AND '2024-02-29';

-- =====================
-- JOINS
-- =====================

-- 16. Name, product, city
SELECT s.name, s.product, c.city
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id;


-- 17.Show name, product, membership

SELECT s.name, s.product, c.membership
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id;


-- 18️.Total sales by city

SELECT c.city, SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
GROUP BY c.city;


-- 19️.Total sales by membership

SELECT c.membership, SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
GROUP BY c.membership;


-- 20.Highest sales with city

SELECT s.name, c.city, SUM(s.sales_amount) AS total
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
GROUP BY s.name, c.city
ORDER BY total DESC
LIMIT 1;


-- 21.Count customers per city

SELECT c.city, COUNT(DISTINCT s.customer_id) AS total_customers
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
GROUP BY c.city;


-- 22.LEFT JOIN

SELECT s.name, c.city
FROM sales s
LEFT JOIN customers_info c
ON s.customer_id = c.customer_id;


-- 23.Find missing customers

SELECT s.name
FROM sales s
LEFT JOIN customers_info c
ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 24.Filter after JOIN

SELECT s.name, c.membership
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
WHERE c.membership = 'Gold';


-- 25.Multiple conditions

SELECT s.name, s.sales_amount, c.membership
FROM sales s
JOIN customers_info c
ON s.customer_id = c.customer_id
WHERE c.membership = 'Gold' AND s.sales_amount > 2000;


