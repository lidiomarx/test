# Lidio Meireles

use sakila;

#1a
select first_name, last_name from actor;

#1b
select upper(concat(first_name,' ',last_name)) as 'Actor Name' from actor;

#2a
select actor_id, first_name, last_name from actor where first_name = 'Joe';

#2b
select * from actor where
upper(last_name) like '%G%' and
upper(last_name) like '%E%' and
upper(last_name) like '%N%';

#2c
select * from actor where
upper(last_name) like '%L%' and
upper(last_name) like '%I%'
order by last_name, first_name;

#2d
select country_id, country from country where upper(country) in ('AFGHANISTAN','BANGLADESH','CHINA');

#3a
alter table actor add column description blob;

#3b
alter table actor drop column description;

#4a
select last_name, count(last_name) from actor group by last_name;

#4b
select last_name, count(last_name) from actor group by last_name having count(last_name) >= 2;

#4c
update actor set first_name = 'HARPO' where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

#4d
update actor set first_name = 'GROUCHO' where first_name = 'HARPO';

#5a
show create table address;

#6a
select first_name, last_name, address.* from staff join address using (address_id);

#6b
select first_name, last_name, sum(amount) as 'August_2005_total_amount' from staff join payment using (staff_id)
where payment_date >= '2005-08-01' and payment_date <= '2005-08-31'
group by staff_id;

#6c
select title, count(actor_id) from film join film_actor using (film_id) group by film_id;

#6d
select title, count(inventory_id) from film join inventory using (film_id) where title = 'Hunchback Impossible';

#6e
select first_name, last_name, sum(amount) as 'Total Amount Paid' from customer join payment using (customer_id)
group by customer_id order by last_name;

#7a
select title from film where title like 'K%' or title like 'Q%' and
language_id = (select language_id from language where name = 'English');

#7b
select first_name, last_name from actor where actor_id in
(select actor_id from film_actor where film_id in
(select film_id from film where title = 'Alone Trip'));

#7c
select first_name, last_name, email from customer join address using (address_id)
join city using (city_id)
join country using (country_id)
where country = 'Canada';

#7d
select title from film join film_category using (film_id) join category using (category_id) where category.name = 'Family';

#7e
select title, count(*) from film join inventory using (film_id)
join rental using (inventory_id) group by film_id order by count(*) desc;

#7f
select store_id, sum(amount) from payment join staff using (staff_id)
group by store_id order by sum(amount) desc;

#7g
select store_id, city, country from store
join address using (address_id)
join city using (city_id)
join country using (country_id);

#7h
select category.name, sum(amount) from film
join film_category using (film_id)
join category using (category_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id)
group by category_id order by sum(amount) desc limit 5;

#8a
create view Top5Genres as
select category.name, sum(amount) from film
join film_category using (film_id)
join category using (category_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id)
group by category_id order by sum(amount) desc limit 5; 

#8b
select * from Top5Genres;

#8c
drop view Top5Genres;




