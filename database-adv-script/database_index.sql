-- Task 3: Indexing for Optimization
-- ---------------------------------

-- Create indexes on commonly filtered or joined columns
-- These indexes reduce full table scans and improve lookup speeds on frequent queries
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_check_in ON bookings(check_in);
CREATE INDEX idx_property_review ON reviews(property_id);

-- Measure performance before and after indexing using EXPLAIN and EXPLAIN ANALYZE
-- These commands provide the execution plan and actual timing (if supported by your DB)

-- BEFORE indexing
-- Note: Run this before the CREATE INDEX commands to compare results
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 2;

-- AFTER indexing
-- After indexes are applied, rerun the same query to see performance gains
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 2;
