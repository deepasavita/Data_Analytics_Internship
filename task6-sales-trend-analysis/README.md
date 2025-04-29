# 🧮 Task 6: Sales Trend Analysis Using Aggregations

## 🎯 Objective
Analyze **monthly revenue** and **order volume** from the `orders` table using SQL aggregate functions to identify sales trends.

## 🛠 Tools Used
- GitHub Codespaces
- SQLite3 (installed in Codespace terminal)
- SQL

## 📂 Dataset
A sample `orders` table was created with the following columns:
- `order_id` (INTEGER)
- `order_date` (TEXT in 'YYYY-MM-DD' format)
- `amount` (REAL)
- `product_id` (INTEGER)

## 📊 SQL Concepts Used
- `strftime('%Y', order_date)` and `strftime('%m', order_date)` for year and month extraction in SQLite.
- `SUM(amount)` to calculate monthly revenue.
- `COUNT(DISTINCT order_id)` to calculate order volume.
- `GROUP BY` to group by year and month.
- `ORDER BY` to sort the results by time.

## 📌 SQL Query

```sql
SELECT 
    strftime('%Y', order_date) AS order_year,
    strftime('%m', order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    orders
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;
