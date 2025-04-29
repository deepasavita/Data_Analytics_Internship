SELECT
    strftime('%Y', order_date) AS order_year,
    strftime('%m', order_date) AS order_month,
    strftime('%m', order_date) || ' - ' || strftime('%Y', order_date) AS month_label,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount) * 1.0 / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
