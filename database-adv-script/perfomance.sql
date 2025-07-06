-- ========================================
-- Task 4: Optimize Complex Queries
-- ========================================

-- Initial unoptimized query
-- Joins bookings, users, properties, and payments
-- Returns details for each booking with related user, property, and payment data
SELECT 
  b.id AS booking_id,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount AS payment_amount,
  b.check_in,
  b.check_out
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Performance Analysis
-- Use EXPLAIN to view query plan and identify inefficiencies
EXPLAIN
SELECT 
  b.id, u.name, p.name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Optimized version
-- Only selects necessary columns
-- Assumes indexes already exist on join columns for faster access
-- Avoids SELECT * for reduced load
SELECT 
  b.id AS booking_id,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Optional: Further refine by filtering recent bookings
-- Example: Only fetch bookings from 2024 onwards
SELECT 
  b.id AS booking_id,
  u.name AS user_name,
  p.name AS property_name,
  pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.check_in >= '2024-01-01';
