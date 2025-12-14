-- Active: 1765701258327@@127.0.0.1@3306@sales_analysis
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date_clean, '%Y-%m') AS month,
        ROUND(SUM(Sales), 2) AS revenue
    FROM sales
    GROUP BY month
)
SELECT
    month,
    revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / LAG(revenue) OVER (ORDER BY month) * 100,
        2
    ) AS mom_growth_pct
FROM monthly_sales
ORDER BY month;
