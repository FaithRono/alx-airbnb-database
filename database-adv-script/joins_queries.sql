-- Task 0: Complex Joins
-- ---------------------

-- 1. INNER JOIN: Retrieves all bookings with their respective user details.
SELECT b.id AS booking_id, u.name AS user_name, b.property_id, b.check_in, b.check_out
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2. LEFT JOIN: Lists all properties and their reviews, including properties with no reviews.
SELECT p.id AS property_id, p.name AS property_name, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN (PostgreSQL):
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

-- Emulating FULL OUTER JOIN in MySQL:
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
