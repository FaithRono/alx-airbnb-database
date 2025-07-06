-- Task 3: Indexing for Optimization
-- ---------------------------------

-- Create indexes on commonly filtered or joined columns
-- These improve lookup speed significantly
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_check_in ON bookings(check_in);
CREATE INDEX idx_property_review ON reviews(property_id);

-- Measure performance before and after indexing using EXPLAIN
-- This provides insights into whether the indexes are being used
-- and how query performance changes
-- BEFORE indexing
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;

-- AFTER indexing (repeat same query to compare)
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;