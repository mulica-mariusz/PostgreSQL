drop table if exists goldusers_signup;
CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 
INSERT INTO goldusers_signup(userid,gold_signup_date) 
 	VALUES (1,'2017-09-22'),
	(3,'2017-04-21');

drop table if exists sales;
CREATE TABLE sales(userid integer,created_date date,product_id integer); 


INSERT INTO sales(userid,created_date,product_id) 
	VALUES (1,'2017-04-19',2),
(3,'2019-12-18',1),
(2,'2020-07-20',3),
(1,'2019-10-23',2),
(1,'2018-03-19',3),
(3,'2016-12-20',2),
(1,'2016-09-11',1),
(1,'2016-05-20',3),
(2,'2017-09-24',1),
(1,'2017-11-03',2),
(1,'2016-11-03',1),
(3,'2016-10-11',1),
(3,'2017-07-12',2),
(3,'2016-12-15',2),
(2,'2017-08-11',2),
(2,'2018-09-10',3);


drop table if exists product;
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);