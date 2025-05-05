create database ecommerce;
use ecommerce;
create table users(name varchar(100),email varchar(100) not null primary key,mobilenumber bigint,password varchar(100),address varchar(100),city varchar(100),state varchar(100),country varchar(100));
select * from users;
create table product(id int primary key,name varchar(100),category varchar(100),price int);
select * from product;
alter table product modify id int not null auto_increment ;
describe product;
CREATE TABLE orders(id INT AUTO_INCREMENT PRIMARY KEY,customer VARCHAR(100) NOT NULL,product VARCHAR(100) NOT NULL,status ENUM('Pending', 'Cancelled', 'Delivered') NOT NULL);
select * from orders;
CREATE TABLE messages(id INT AUTO_INCREMENT PRIMARY KEY,sender_name VARCHAR(100) NOT NULL,email VARCHAR(100) NOT NULL,subject VARCHAR(255),message TEXT NOT NULL,received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
select * from messages;

INSERT INTO orders (customer, product, status) VALUES
('Alice', 'Laptop', 'Pending'),
('Bob', 'Smartphone', 'Delivered'),
('Charlie', 'Headphones', 'Cancelled'),
('David', 'Monitor', 'Delivered'),
('Eve', 'Keyboard', 'Cancelled');


INSERT INTO messages (sender_name, email, subject, message) VALUES
('John Doe', 'john@example.com', 'Order Issue', 'I have a problem with my order.'),
('Jane Smith', 'jane@example.com', 'Feedback', 'Great service!'),
('Mike Johnson', 'mike@example.com', 'Inquiry', 'Do you have this product in stock?');

create table user_messages(id INT AUTO_INCREMENT not null PRIMARY KEY,name varchar(100),email varchar(100),message varchar(500));
select * from user_messages;

create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(100),city varchar(100),state varchar(100),country varchar(100),mobileNumber int);
select * from cart;