create database library_db;
use library_db;
CREATE TABLE books(id INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(100),author VARCHAR(100),publication_year INT,quantity INT,price DECIMAL(10,2));
show tables;
select * from books;