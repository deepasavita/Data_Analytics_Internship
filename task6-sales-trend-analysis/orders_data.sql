-- Create the orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    amount REAL,
    product_id INTEGER
);

-- Insert sample data into the orders table
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-10', 250.00, 101),
(2, '2024-01-15', 150.00, 102),
(3, '2024-02-05', 300.00, 103),
(4, '2024-02-20', 400.00, 104),
(5, '2024-03-12', 500.00, 105),
(6, '2024-03-25', 600.00, 106),
(7, '2024-04-05', 700.00, 107),
(8, '2024-04-15', 800.00, 108),
(9, '2024-05-10', 900.00, 109),
(10, '2024-05-20', 1000.00, 110),
(11, '2023-11-11', 1200.00, 111),
(12, '2023-11-25', 1300.00, 112),
(13, '2023-12-05', 1100.00, 113),
(14, '2023-12-18', 1400.00, 114),
(15, '2023-10-10', 1600.00, 115);
-- Create orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    amount REAL,
    product_id INTEGER
);

-- Insert sample data
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-10', 250.00, 101),
(2, '2024-01-15', 150.00, 102),
(3, '2024-02-05', 300.00, 103),
(4, '2024-02-20', 400.00, 104),
(5, '2024-03-12', 500.00, 105),
(6, '2024-03-25', 600.00, 106),
(7, '2024-04-05', 700.00, 107),
(8, '2024-04-15', 800.00, 108),
(9, '2024-05-10', 900.00, 109),
(10, '2024-05-20', 1000.00, 110),
(11, '2023-11-11', 1200.00, 111),
(12, '2023-11-25', 1300.00, 112),
(13, '2023-12-05', 1100.00, 113),
(14, '2023-12-18', 1400.00, 114),
(15, '2023-10-10', 1600.00, 115);
