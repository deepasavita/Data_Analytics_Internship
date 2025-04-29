# 📊 Task 6: Sales Trend Analysis

## 📌 Objective
Analyze monthly sales trends by calculating revenue, order volume, and average order value (AOV) using SQL queries on an e-commerce orders dataset.

---

## 🛠 Tools Used
- **SQLite** (Querying and analysis)
- **DB Browser for SQLite** (for viewing `.db` files)
- **VS Code / SQL CLI** (for writing and testing queries)
- **Git & GitHub** (Version control)
- **Screenshots** (For results & report documentation)

---

## 📂 Dataset Description
The SQLite database contains an `orders` table with the following structure:

- `order_id` (INTEGER) – Unique order ID  
- `order_date` (TEXT in YYYY-MM-DD) – Date of the order  
- `amount` (REAL) – Order amount in currency  
- `product_id` (INTEGER) – Foreign key for product

Two database files:
- `online_sales.db` – Raw data insertion demo
- `sales_trend_analysis.db` – Used for actual trend analysis

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `orders_data.sql` | SQL script to create and populate the `orders` table |
| `sales_trend_analysis.sql` | Queries to analyze monthly revenue, order count, and AOV |
| `online_sales.db` | Initial database with sample orders |
| `sales_trend_analysis.db` | Final version with all queries tested |
| `screenshots/` | Contains output images for use in documentation/report |
| `README.md` | This task summary |

---

## 📈 Analysis Output

### 🗓 Monthly Sales Trends

- Grouped by: Year & Month  
- Metrics Calculated:
  - `SUM(amount)` → Monthly Revenue
  - `COUNT(order_id)` → Monthly Order Volume
  - `AVG(amount)` → AOV (Average Order Value)

Example output:
| Year | Month     | Revenue | Orders | AOV     |
|------|-----------|---------|--------|---------|
| 2024 | January   | 400.00  | 2      | 200.00  |
| 2024 | February  | 700.00  | 2      | 350.00  |
| ...  | ...       | ...     | ...    | ...     |

📸 Screenshots saved in `screenshots/` folder.

---

## 💡 SQL Features Practiced

- `GROUP BY`, `ORDER BY`
- Date functions like `strftime('%Y', order_date)`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `ROUND()`
- Alias usage for readability
- Creating reusable queries for trend summaries

---

## 🧠 Key Learnings

- How to group and aggregate time-series sales data
- Understanding seasonal trends in sales
- Writing clean SQL scripts in SQLite
- Converting date text to proper month/year formats
- Exporting and documenting SQL outputs for reports

---

## ✅ Task Status
✅ **Task 6 Completed Successfully**  
SQLite-based analysis has been committed with scripts, databases, and screenshots.

---


