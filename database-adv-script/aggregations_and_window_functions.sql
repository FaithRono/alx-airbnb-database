-- Task 2: Aggregations and Window Functions
-- -----------------------------------------

-- Count bookings per user
-- Aggregates bookings to count how many each user made
-- Useful for determining active users
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Rank properties based on number of bookings
-- Uses window function RANK() to assign ranking to each property
-- Helps identify top-performing properties
SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;

-- Use ROW_NUMBER to assign unique row numbers per ranking order
-- Ensures deterministic row numbering even for same booking counts
SELECT property_id, COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num
FROM bookings
GROUP BY property_id;
