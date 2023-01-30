--  What is the total amount each consumer spent

select a.userid, sum(b.price) as "total spent" from sales a 
	inner join product b on a.product_id=b.product_id
	group by a.userid;
	
-- How many days has each customer visited restaurant

select userid, count(distinct created_date) as "days" from sales group by userid;

-- What was the first product purchased by each customer
select * from
(select *,rank() over(partition by userid order by created_date) rnk from sales) a where rnk = 1;

-- What is the most purchased item on the menu and how many times it was purchased

select userid, count(product_id) times from sales 
	where product_id = (select product_id from sales group by product_id order by count(product_id) desc limit 1)
	group by userid;

-- Which item was the most popular for each customer
select * from
(select *,rank() over(partition by userid order by cnt desc) rnk from
(select userid,product_id, count(product_id) cnt from sales group by userid,product_id) a ) b
where rnk = 1;
