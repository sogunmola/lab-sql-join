USE sakila;

-- 1) List number of films per category
SELECT category.name, COUNT(film.film_id) AS Num_of_films FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- 2) Display the first and last names, as well as the address, of each staff member.
SELECT staff.staff_id, staff.first_name, staff.last_name, address.address FROM staff
INNER JOIN address ON address.address_id = staff.address_id
GROUP BY staff.staff_id; 

-- 3) Display the total amount rung up by each staff member in August of 2005.
SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS Ttl_Amount
FROM payment
INNER JOIN staff ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN 20050801 AND 20050831
GROUP BY staff.staff_id
ORDER BY Ttl_Amount desc;

-- 4) List each film and the number of actors who are listed for that film.
SELECT film.title, COUNT(film_actor.actor_id) AS Num_of_Actors FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY Num_of_Actors desc;

-- 5) Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS Ttl_Amount FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name
ORDER BY customer.last_name asc;