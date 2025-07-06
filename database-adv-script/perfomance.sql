-- Task 4: Optimize Complex Queries
-- --------------------------------

-- Initial complex query: Combine data from multiple tables (users, properties, payments)
-- Refactored to use index-friendly filtering with AND condition for improved performance
SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.check_in > '2024-01-01' AND pay.amount IS NOT NULL;

-- Use EXPLAIN to evaluate query plan and find slow parts
EXPLAIN SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.check_in > '2024-01-01' AND pay.amount IS NOT NULL;

-- Optimization tips:
-- - Ensure all join keys are indexed
-- - Select only required columns
-- - Avoid unnecessary joins
