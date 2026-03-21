-- =============================================================
-- Business analysis queries
-- Each query answers one business question.
-- =============================================================

-- Q1. Monthly revenue trend (excludes credit notes / returns)
SELECT
    substr(invoice_dt, 1, 7)       AS month,
    ROUND(SUM(quantity * unit_price), 2) AS revenue_gbp,
    COUNT(DISTINCT invoice)        AS n_orders
FROM   sales
WHERE  invoice NOT LIKE 'C%'
  AND  quantity > 0
GROUP  BY month
ORDER  BY month;


-- Q2. Top 10 products by revenue
SELECT
    stock_code,
    description,
    ROUND(SUM(quantity * unit_price), 2) AS revenue_gbp,
    SUM(quantity)                        AS units_sold
FROM   sales
WHERE  quantity > 0
GROUP  BY stock_code, description
ORDER  BY revenue_gbp DESC
LIMIT  10;


-- Q3. Revenue concentration by country (excluding UK home market)
SELECT
    country,
    ROUND(SUM(quantity * unit_price), 2) AS revenue_gbp,
    COUNT(DISTINCT customer_id)          AS n_customers
FROM   sales
WHERE  quantity > 0
  AND  country <> 'United Kingdom'
GROUP  BY country
ORDER  BY revenue_gbp DESC
LIMIT  15;


-- Q4. Return rate per product (returns vs. gross sales)
WITH gross AS (
    SELECT stock_code, SUM(quantity) AS units
    FROM   sales WHERE quantity > 0 GROUP BY stock_code
), returns AS (
    SELECT stock_code, SUM(-quantity) AS units_returned
    FROM   sales WHERE quantity < 0 GROUP BY stock_code
)
SELECT
    g.stock_code,
    g.units                        AS units_sold,
    COALESCE(r.units_returned, 0)  AS units_returned,
    ROUND(100.0 * COALESCE(r.units_returned, 0) / g.units, 2) AS return_rate_pct
FROM   gross g
LEFT   JOIN returns r USING (stock_code)
WHERE  g.units > 100
ORDER  BY return_rate_pct DESC
LIMIT  20;


-- Q5. Customer cohort: first-purchase month vs. retention
WITH first_purchase AS (
    SELECT customer_id,
           substr(MIN(invoice_dt), 1, 7) AS cohort_month
    FROM   sales
    WHERE  customer_id IS NOT NULL AND quantity > 0
    GROUP  BY customer_id
)
SELECT
    fp.cohort_month,
    COUNT(DISTINCT fp.customer_id)               AS cohort_size,
    COUNT(DISTINCT s.customer_id)                AS active_in_period,
    substr(s.invoice_dt, 1, 7)                   AS active_month
FROM   first_purchase fp
JOIN   sales s ON s.customer_id = fp.customer_id AND s.quantity > 0
GROUP  BY fp.cohort_month, active_month
ORDER  BY fp.cohort_month, active_month;
