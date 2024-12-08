DROP DATABASE IF EXISTS store_1nf;
CREATE DATABASE store_1nf;
USE store_1nf;

CREATE TABLE order_details (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone_number VARCHAR(20),
    customer_address VARCHAR(255),
    product_name VARCHAR(255),
    product_category VARCHAR(255),
    quantity INT,
    price_per_unit DOUBLE,
    order_date DATE
);

INSERT INTO order_details (order_id, customer_name, customer_phone_number, customer_address, product_name, product_category, quantity, price_per_unit, order_date) VALUES
(1, 'John Smith','(555) 123-4567','123 Elm St', 'Laptop', 'Electronics', 1, 1200.00, '2024-11-20'),
(2, 'Jane Doe','(555) 987-6543', '456 Oak St', 'Smartphone', 'Electronics', 2, 800.00, '2024-11-21'),
(3, 'John Smith', '(555) 123-4567', '123 Elm St', 'Keyboard', 'Accessories', 1, 100.00, '2024-11-22'),
(4, 'Jane Doe','(555) 987-6543', '456 Oak St', 'Monitor', 'Electronics', 1, 300.00, '2024-11-23');
