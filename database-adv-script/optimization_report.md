# Task 4: Optimization Report - Complex Query Refactor

## ✅ Initial Query Overview

The original query joined the following tables:
- `bookings` (main booking records)
- `users` (user details)
- `properties` (property details)
- `payments` (payment transactions)

```sql
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
