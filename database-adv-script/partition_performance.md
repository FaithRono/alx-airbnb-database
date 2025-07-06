# Task 5: Partitioning Performance Report

## Objective
The goal of this task was to implement table partitioning to improve performance on large datasets, particularly for date-based queries in the `bookings` table.

## What Was Done

- Created a new partitioned version of the `bookings` table (`bookings_partitioned`) using `RANGE` partitioning based on the year extracted from the `check_in` date.
- Defined yearly partitions for 2023, 2024, and 2025.
- Tested query performance using `EXPLAIN` on a typical query filtering by date range.

## Performance Test

**Query Tested:**

```sql
EXPLAIN SELECT * FROM bookings_partitioned
WHERE check_in BETWEEN '2024-01-01' AND '2024-12-31';
