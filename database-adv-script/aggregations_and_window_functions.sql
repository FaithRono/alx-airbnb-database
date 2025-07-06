-- Task 2: Aggregations and Window Functions
-- -----------------------------------------

-- Count bookings per user
-- Aggregates bookings to count how many each user made
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Rank properties based on number of bookings
-- Uses window function RANK() to assign ranking to each property
SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
