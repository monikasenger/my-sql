use new_monika;

create table orders(order_id varchar(10), customer_id varchar(10) primary key, employee_id varchar(20), order_date date);
insert into orders values('101','c101','e101','2000-12-3');
insert into orders values('102','c105','e103','2010-10-23');
insert into orders values('103','c106','e102','2015-11-30');
insert into orders values('104','c107','e106','2010-12-13');
insert into orders values('105','c103','e105','2020-1-3');
select * from orders;

create table customers(customer_id varchar(10), cust_name varchar(40),contact_number varchar(40), address varchar(50));
insert into customers values('c101', 'monika','7982321982','faridabad');
insert into customers values('c105', 'pia','8663577543','faridabad');
insert into customers values('c106', 'tanvi','9876567854','delhi');
insert into customers values('c112', 'sakshi','9876534566','delhi');
select * from customers;

CREATE TABLE  products (productID varchar(20)PRIMARY KEY ,productCode  CHAR(3) , name   VARCHAR(30), quantity varchar(30),price  DECIMAL(7,2));

INSERT INTO products VALUES ('101', 'PEN', 'Pen Red', 5000, 1.23);
INSERT INTO products VALUES ('105', 'PEN', 'glitter pen', 9000, 1.23);
 INSERT INTO products VALUES ('102', 'PEN', 'Pen Blue',  8000, 1.25),('103', 'PEN', 'Pen Black', 2000, 1.25);
select * from products;
SELECT * FROM customers right JOIN orders ON customers.customer_id=orders.customer_id ;
SELECT * FROM customers inner JOIN orders ON customers.customer_id=orders.customer_id ;
SELECT * FROM customers left JOIN orders ON customers.customer_id=orders.customer_id ;

SELECT * FROM customers right JOIN orders ON customers.customer_id=orders.customer_id where address='faridabad' ;
SELECT * FROM customers inner JOIN orders   ON customers.customer_id=orders.customer_id and year(order_date)='2010';
SELECT * FROM customers left JOIN orders ON customers.customer_id=orders.customer_id where cust_name='monika';

SELECT * FROM customers CROSS JOIN orders;
SELECT * FROM customers LEFT JOIN(orders CROSS JOIN products ) ON products.productID=orders.order_id where customers.customer_id=orders.customer_id group by order_id;
