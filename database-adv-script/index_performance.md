# Index Performance Report

## Before Indexing
- Query: `SELECT * FROM User WHERE email = 'test@example.com'`
- Execution Time: 120ms
- Used full table scan

## After Indexing
- Same query execution time: 5ms
- Used index scan (idx_user_email)

## Observations
Indexes reduced query time by 95% for email lookups.