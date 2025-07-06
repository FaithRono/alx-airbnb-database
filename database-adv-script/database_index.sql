-- ===============================
-- Task 3: Implement Indexes for Optimization
-- ===============================

-- Create indexes on frequently queried columns to improve performance

-- Index for user_id in bookings (used in JOINs and WHERE clauses)
CREATE INDEX idx_user_id ON bookings(user_id);

-- Index for property_id in bookings (used in JOINs and aggregations)
CREATE INDEX idx_property_id ON bookings(property_id);

-- Index for check_in date (used in WHERE range queries and partitioning)
CREATE INDEX idx_check_in ON bookings(check_in);

-- Index for property_id in reviews (used to join properties and reviews)
CREATE INDEX idx_property_review ON reviews(property_id);

-- Analyze performance using EXPLAIN before and after indexing

-- BEFORE indexing (will likely do a full table scan)
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;

-- AFTER indexing (should use idx_user_id)
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;
