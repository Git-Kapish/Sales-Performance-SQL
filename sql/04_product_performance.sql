-- Top 10 products by total revenue
SELECT
    `Product Name` AS product_name,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM sales
GROUP BY `Product Name`
ORDER BY total_revenue DESC
LIMIT 10;
-- Bottom 10 products by total revenue
SELECT
    `Product Name` AS product_name,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM sales
GROUP BY `Product Name`
ORDER BY total_revenue ASC
LIMIT 10;
-- Product contribution to total revenue
WITH product_sales AS (
    SELECT
        `Product Name` AS product_name,
        SUM(Sales) AS revenue
    FROM sales
    GROUP BY `Product Name`
)
SELECT
    product_name,
    ROUND(revenue, 2) AS revenue,
    ROUND(revenue * 100 / SUM(revenue) OVER (), 2) AS contribution_pct
FROM product_sales
ORDER BY revenue DESC
LIMIT 10;
-- Percentage of total revenue contributed by top 10 products
WITH product_sales AS (
    SELECT
        `Product Name` AS product_name,
        SUM(Sales) AS revenue
    FROM sales
    GROUP BY `Product Name`
),
ranked_products AS (
    SELECT
        product_name,
        revenue,
        RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
    FROM product_sales
)
SELECT
    ROUND(SUM(revenue), 2) AS top_10_revenue,
    ROUND(
        SUM(revenue) * 100 / (SELECT SUM(revenue) FROM product_sales),
        2
    ) AS top_10_revenue_pct
FROM ranked_products
WHERE revenue_rank <= 10;
