-- Task 0: Complex Queries with Joins
-- ----------------------------------

-- INNER JOIN: Bookings with the respective users
SELECT b.id AS booking_id, u.name AS user_name, b.property_id, b.check_in, b.check_out
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Properties and their reviews (including properties with no reviews)
SELECT p.id AS property_id, p.name AS property_name, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;
ORDER BY p.id;

-- FULL OUTER JOIN: All users and all bookings (PostgreSQL syntax)
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

-- MySQL FULL OUTER JOIN alternative
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
