-- ============================================================
-- Kasi Mart Data Engineering Project
-- DE_PROJECT1.DBO — Analytical Queries
-- ============================================================

-- ------------------------------------------------------------
-- Query 1: Every order joined to customer name, product name,
-- category, and a calculated line_revenue (quantity * unit_price)
-- ------------------------------------------------------------
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.unit_price,
    o.quantity * p.unit_price AS line_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON o.product_id  = p.product_id
ORDER BY o.order_id;


-- ------------------------------------------------------------
-- Query 2: Total revenue per customer
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON o.product_id  = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;


-- ------------------------------------------------------------
-- Query 3: Total revenue per product category
-- ------------------------------------------------------------
SELECT
    p.category,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- ------------------------------------------------------------
-- Query 4: Top 5 customers by total spend
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_spend
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON o.product_id  = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC
LIMIT 5;
