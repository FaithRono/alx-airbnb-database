-- ============================================
-- Task 5: Partitioning Large Tables - SQL File
-- Partition the 'bookings' table by check-in year
-- ============================================

-- Step 1: Create a new partitioned table for bookings
-- This table is partitioned by RANGE based on the year of check_in date
CREATE TABLE bookings_partitioned (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL
) PARTITION BY RANGE (YEAR(check_in));

-- Step 2: Create yearly partitions
-- Each partition handles bookings within a year range
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
  FOR VALUES FROM (2023) TO (2024);

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
  FOR VALUES FROM (2024) TO (2025);

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
  FOR VALUES FROM (2025) TO (2026);

-- Step 3: Query the partitioned table for performance testing
-- Use EXPLAIN to see how the partitioning improves query performance
EXPLAIN SELECT * FROM bookings_partitioned
WHERE check_in BETWEEN '2024-01-01' AND '2024-12-31';