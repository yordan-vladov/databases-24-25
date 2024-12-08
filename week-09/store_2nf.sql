DROP DATABASE IF EXISTS store_2nf;
CREATE DATABASE store_2nf;
USE store_2nf;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    customer_phone_number VARCHAR(20),
    order_date DATE
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255),
    price_per_unit DOUBLE
);

CREATE TABLE order_details(
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO orders(order_id, customer_name, customer_phone_number, customer_address, order_date) VALUES
(1, 'John Smith', '(555) 123-4567', '123 Elm St', '2024-11-20'),
(2, 'Jane Doe', '(555) 987-6543', '456 Oak St', '2024-11-21'),
(3, 'John Smith', '(555) 123-4567', '123 Elm St','2024-11-22'),
(4, 'Jane Doe', '(555) 987-6543', '456 Oak St', '2024-11-23');

INSERT INTO products(product_id,  product_name, product_category, price_per_unit) VALUES
(1,'Laptop', 'Electronics', 1200.00),
(2,'Smartphone', 'Electronics', 800.00),
(3,'Keyboard', 'Accessories',100.00),
(4,'Monitor', 'Electronics', 300.00),
(5,'Mouse', 'Accessories', 50.00);


INSERT INTO order_details (order_detail_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 3, 5, 1),
(5, 4, 4, 1);
