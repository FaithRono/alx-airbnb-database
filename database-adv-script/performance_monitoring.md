-- Task 6: Monitor and Refine Database Performance
-- -----------------------------------------------

-- Use EXPLAIN to analyze execution plan
EXPLAIN SELECT * FROM bookings WHERE user_id = 1 AND check_in > '2024-01-01';

-- Enable MySQL profiling to inspect query execution
SET PROFILING = 1;
SELECT * FROM bookings WHERE user_id = 1;
SHOW PROFILE;

-- Recommendations:
-- - Use composite indexes (e.g., on user_id and check_in)
-- - Avoid functions in WHERE clauses (they block index use)
-- - Use partitioning to archive old data and speed up queries
