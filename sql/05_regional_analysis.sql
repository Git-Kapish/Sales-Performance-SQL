-- Region-wise revenue and contribution
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(
        SUM(Sales) * 100 / SUM(SUM(Sales)) OVER (),
        2
    ) AS contribution_pct
FROM sales
GROUP BY Region
ORDER BY total_revenue DESC;
-- Category-wise revenue and contribution
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(
        SUM(Sales) * 100 / SUM(SUM(Sales)) OVER (),
        2
    ) AS contribution_pct
FROM sales
GROUP BY Category
ORDER BY total_revenue DESC;
-- Category performance by region
SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS revenue
FROM sales
GROUP BY Region, Category
ORDER BY Region, revenue DESC;
