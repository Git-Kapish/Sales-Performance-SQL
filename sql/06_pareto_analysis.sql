-- Pareto analysis: cumulative revenue contribution by product
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
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM product_sales
)
SELECT
    product_name,
    ROUND(revenue, 2) AS revenue,
    ROUND(cumulative_revenue * 100 / total_revenue, 2) AS cumulative_revenue_pct
FROM ranked_products
ORDER BY revenue DESC;
-- Number of products contributing to first 80% of revenue
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
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM product_sales
)
SELECT
    COUNT(*) AS products_for_80_pct_revenue
FROM ranked_products
WHERE cumulative_revenue <= 0.8 * total_revenue;
