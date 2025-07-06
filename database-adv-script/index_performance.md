-- Task 3: Indexing for Optimization
-- ---------------------------------

-- Create indexes on commonly filtered or joined columns
-- These improve lookup speed significantly
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_check_in ON bookings(check_in);
CREATE INDEX idx_property_review ON reviews(property_id);

-- Use EXPLAIN to analyze performance of a query
EXPLAIN SELECT * FROM bookings WHERE user_id = 2;
