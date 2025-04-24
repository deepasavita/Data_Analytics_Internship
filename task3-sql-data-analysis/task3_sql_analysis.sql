-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- Create tables
CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    item_name TEXT,
    item_price DECIMAL,
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
INSERT INTO customers (customer_id, customer_name, city) VALUES
    (1, 'Deepa', 'Mumbai'),
    (2, 'Pournima', 'Pune'),
    (3, 'Sneha', 'Mumbai');

INSERT INTO items (item_id, item_name, item_price, item_quantity) VALUES
    (1, 'Mouse', 100, 400),
    (2, 'Monitor', 5000, 150);

INSERT INTO orders (item_id, order_date, customer_id) VALUES
    (1, '2025-04-20', 1), -- Order for Mouse by Deepa
    (2, '2025-04-21', 2); -- Order for Monitor by Pournima

INSERT INTO order_items (order_id, item_id, quantity) VALUES
    (1, 1, 100), -- 100 Mouse items ordered
    (2, 2, 150); -- 150 Monitor items ordered

-- Create views
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

-- Queries to test
SELECT * FROM order_details;
SELECT * FROM customer_order_summary;

-- Other queries like SUM, AVG, etc.
SELECT SUM(item_quantity) AS total_items_in_stock FROM items;
SELECT SUM(item_price * item_quantity) AS total_stock_value FROM items;
SELECT * FROM items ORDER BY item_price DESC LIMIT 1;

-- Example of ranking products by quantity sold
SELECT
    i.item_name,
    SUM(oi.quantity) AS total_sold
FROM items i
JOIN order_items oi ON i.item_id = oi.item_id
GROUP BY i.item_name
ORDER BY total_sold DESC;
