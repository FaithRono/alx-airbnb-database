-- Task 0: Complex Queries with Joins
-- ----------------------------------

-- INNER JOIN: Retrieve bookings along with their respective users
-- This will only return rows where a booking has a matching user
SELECT b.id AS booking_id, u.name AS user_name, b.property_id, b.check_in, b.check_out
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and any associated reviews
-- Properties with no reviews will still be shown (NULL in rating/comment)
SELECT p.id AS property_id, p.name AS property_name, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;

-- FULL OUTER JOIN: Retrieve all users and all bookings
-- Includes users without bookings and bookings not linked to any user
-- This syntax works in PostgreSQL
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

-- MySQL FULL OUTER JOIN alternative using UNION
-- Combines LEFT JOIN and RIGHT JOIN results to simulate FULL OUTER JOIN
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
