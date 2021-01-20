use sakila;

-- Get release years
select release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title
select count(title)
from sakila.film
where title regexp 'Armageddon';

-- Get all films which title ends with APOLLO
select title
from sakila.film
where title regexp 'APOLLO$';

-- Get 10 the longest films
select *
from sakila.film
order by length desc limit 10;

-- How many films include Behind the Scenes content?
select count(title)
from sakila.film
where special_features regexp 'Behind the Scenes';

-- Drop column picture from staff
alter table sakila.staff
drop column picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly
insert into staff values
(3,'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',0,'2020-01-20 18:58:00');

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. Hint: 
-- Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query:

select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

insert into rental values
(16050, '2020-01-20-19:03:00', 1, 130, NULL, 1, '2020-01-20-19:03:00');

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
-- Follow these steps:
-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer

create table customer_deleted (
customer_id int unique not null,
store_id int unique not null,
first_name varchar(45),
last_name varchar(45),
email varchar(50),
adress_id int unique not null,
active tinyint,
create_date datetime,
last_update timestamp,
constraint primary key (customer_id)
);

drop table customer_deleted;

create table customer_deleted like customer;

select * from sakila.customer where active = 0;

insert into customer_deleted values
('16', '2', 'SANDRA', 'MARTIN', 'SANDRA.MARTIN@sakilacustomer.org', '20', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('64', '2', 'JUDITH', 'COX', 'JUDITH.COX@sakilacustomer.org', '68', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('124', '1', 'SHEILA', 'WELLS', 'SHEILA.WELLS@sakilacustomer.org', '128', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('169', '2', 'ERICA', 'MATTHEWS', 'ERICA.MATTHEWS@sakilacustomer.org', '173', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('241', '2', 'HEIDI', 'LARSON', 'HEIDI.LARSON@sakilacustomer.org', '245', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('271', '1', 'PENNY', 'NEAL', 'PENNY.NEAL@sakilacustomer.org', '276', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('315', '2', 'KENNETH', 'GOODEN', 'KENNETH.GOODEN@sakilacustomer.org', '320', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('368', '1', 'HARRY', 'ARCE', 'HARRY.ARCE@sakilacustomer.org', '373', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('406', '1', 'NATHAN', 'RUNYON', 'NATHAN.RUNYON@sakilacustomer.org', '411', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('446', '2', 'THEODORE', 'CULP', 'THEODORE.CULP@sakilacustomer.org', '451', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('482', '1', 'MAURICE', 'CRAWLEY', 'MAURICE.CRAWLEY@sakilacustomer.org', '487', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('510', '2', 'BEN', 'EASTER', 'BEN.EASTER@sakilacustomer.org', '515', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('534', '1', 'CHRISTIAN', 'JUNG', 'CHRISTIAN.JUNG@sakilacustomer.org', '540', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('558', '1', 'JIMMIE', 'EGGLESTON', 'JIMMIE.EGGLESTON@sakilacustomer.org', '564', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('592', '1', 'TERRANCE', 'ROUSH', 'TERRANCE.ROUSH@sakilacustomer.org', '598', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20');


delete from sakila.customer where customer_id in ('16', '64', '124', '169', '241', '271', '315', '368', '406', '446', '482', '510', '534', '558', '592');

