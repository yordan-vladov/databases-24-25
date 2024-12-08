DROP DATABASE IF EXISTS unnormalized_store;
CREATE DATABASE unnormalized_store;
USE unnormalized_store;

CREATE TABLE order_details (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone_number VARCHAR(20),
    customer_address VARCHAR(255),
    product_name VARCHAR(255), -- Allows multiple products in a single field (violates 1NF)
    product_category VARCHAR(255),
    quantity VARCHAR(255), -- Allows multiple quantities in a single field (violates 1NF)
    price_per_unit VARCHAR(255), -- Allows multiple prices in a single field (violates 1NF)
    order_date DATE
);

INSERT INTO order_details (order_id, customer_name, customer_phone_number, customer_address, product_name, product_category, quantity, price_per_unit, order_date) VALUES
(1, 'John Smith', '123 Elm St', '(555) 123-4567', 'Laptop', 'Electronics', '1', '1200.00', '2024-11-20'),
(2, 'Jane Doe', '456 Oak St', '(555) 987-6543', 'Smartphone', 'Electronics', '2', '800.00', '2024-11-21'),
(3, 'John Smith', '123 Elm St', '(555) 123-456', 'Keyboard, Mouse', 'Accessories', '1, 2', '100.00, 50.00', '2024-11-22'),
(4, 'Jane Doe', '456 Oak St', '(555) 987-6543', 'Monitor', 'Electronics', '1', '300.00', '2024-11-23');
