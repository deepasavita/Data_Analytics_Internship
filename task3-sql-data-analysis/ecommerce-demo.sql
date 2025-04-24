PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS items;

-- Create tables
CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    item_name TEXT,
    item_price REAL,
    item_quantity INTEGER
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    city TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    item_id INTEGER,
    order_date DATE,
    customer_id INTEGER,
    FOREIGN KEY(item_id) REFERENCES items(item_id),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(item_id) REFERENCES items(item_id)
);

-- Insert sample data
INSERT INTO customers VALUES
(1, 'Deepa', 'Mumbai'),
(2, 'Pournima', 'Pune'),
(3, 'Sneha', 'Mumbai');

INSERT INTO items VALUES
(1, 'Mouse', 100, 400),
(2, 'Monitor', 5000, 150);

INSERT INTO orders (item_id, order_date, customer_id) VALUES
(1, '2025-04-20', 1),
(2, '2025-04-21', 2);

INSERT INTO order_items (order_id, item_id, quantity) VALUES
(1, 1, 100),
(2, 2, 150);

-- Views
CREATE VIEW order_details AS
SELECT o.order_id, o.order_date, i.item_name, i.item_price
FROM orders o
JOIN items i ON o.item_id = i.item_id;

CREATE VIEW customer_order_summary AS
SELECT
    c.customer_name,
    o.order_id,
    SUM(oi.quantity) AS total_items
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name, o.order_id;

-- Queries for analysis
-- 1
SELECT * FROM customers WHERE city = 'Mumbai' ORDER BY customer_name;

-- 2
SELECT i.item_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN items i ON oi.item_id = i.item_id
GROUP BY i.item_name
ORDER BY total_quantity_sold DESC;

-- 3
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date;

-- 4
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 5
SELECT customer_name FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

-- 6 (already created above as view)

-- 7 (index example)
CREATE INDEX IF NOT EXISTS idx_item_id ON order_items(item_id);

-- 8
SELECT c.customer_name, SUM(i.item_price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- 9 (no RANK() in SQLite by default unless compiled with window functions)

-- 10 (use DATE for recent orders, adjust as needed)
SELECT o.order_id, c.customer_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= date('now', '-7 days')
ORDER BY o.order_date DESC;

-- 11 (customer tier)
SELECT 
    c.customer_name,
    SUM(i.item_price * oi.quantity) AS total_spent,
    CASE 
        WHEN SUM(i.item_price * oi.quantity) > 10000 THEN 'Gold'
        WHEN SUM(i.item_price * oi.quantity) > 5000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_tier
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id
GROUP BY c.customer_name;

-- 12 (CTE)
WITH order_counts AS (
    SELECT customer_id, COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name, oc.total_orders
FROM order_counts oc
JOIN customers c ON c.customer_id = oc.customer_id
WHERE oc.total_orders = (
    SELECT MAX(total_orders) FROM order_counts
);

-- 13 (enhanced dashboard view)
CREATE VIEW detailed_order_summary AS
SELECT 
    c.customer_name,
    i.item_name,
    oi.quantity,
    (i.item_price * oi.quantity) AS revenue,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id;

-- 14 (stored procedures not supported in SQLite, use a query instead)
-- Top N customers by spending
-- Just replace N with a number when running
SELECT c.customer_name, SUM(i.item_price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 2;
