import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Step 1: Connect to the database
conn = sqlite3.connect("sales_data.db")
cursor = conn.cursor()

# Create the products table
cursor.execute("""
CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT,
    category TEXT,
    price REAL
)
""")

# Create the customers table
cursor.execute("""
CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT,
    email TEXT
)
""")

# Create the sales transactions table
cursor.execute("""
CREATE TABLE IF NOT EXISTS sales_transactions (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    sale_date TEXT,
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
)
""")

# Step 2: Insert data into products table
products_data = [
    ('Laptop', 'Electronics', 1000),
    ('Phone', 'Electronics', 500),
    ('Tablet', 'Electronics', 700)
]
cursor.executemany("INSERT INTO products (product_name, category, price) VALUES (?, ?, ?)", products_data)

# Insert data into customers table
customers_data = [
    ('Deepa Savita', 'deepa@example.com'),
    ('Pournima More', 'morepournima@example.com')
]
cursor.executemany("INSERT INTO customers (customer_name, email) VALUES (?, ?)", customers_data)

# Insert data into sales_transactions table
sales_data = [
    (1, 1, 2, '2025-05-01'),  # Deepa bought 2 Laptops
    (2, 2, 1, '2025-05-02'),  # Pournima bought 1 Phone
    (1, 3, 3, '2025-05-03')   # Deepa bought 3 Tablets
]
cursor.executemany("INSERT INTO sales_transactions (customer_id, product_id, quantity, sale_date) VALUES (?, ?, ?, ?)", sales_data)

conn.commit()

# Step 3: Run an SQL query to get total revenue by product
query = """
SELECT 
    p.product_name,
    SUM(st.quantity * p.price) AS revenue
FROM sales_transactions st
JOIN products p ON st.product_id = p.product_id
GROUP BY p.product_name
"""

# Load data into a DataFrame
df = pd.read_sql_query(query, conn)
conn.close()

# Step 4: Print results
print("=== Sales Summary ===")
print(df)

# Step 5: Create a bar chart of revenue by product
df.plot(kind='bar', x='product_name', y='revenue', legend=False, color='skyblue')
plt.title("Revenue by Product")
plt.xlabel("Product")
plt.ylabel("Revenue ($)")
plt.tight_layout()
plt.savefig("sales_chart.png")  # Saves the chart as an image
plt.show()  # Shows chart if GUI supported
