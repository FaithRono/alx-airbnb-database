-- Task 1: Subqueries
-- ------------------

-- Non-correlated subquery: Find properties with an average rating > 4.0
-- This filters properties based on aggregated review ratings
SELECT *
FROM properties
WHERE id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

-- Correlated subquery: Find users who have made more than 3 bookings
-- Subquery depends on each row in the outer query
SELECT *
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.id
) > 3;
