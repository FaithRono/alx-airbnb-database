# 🛠️ Unleashing Advanced Querying Power – ALX Airbnb Database Project

**Project Duration:** June 30 – July 7, 2025  
**Level:** Novice  
**Weight:** 1  
**Module:** ALX Airbnb Database  
**Manual Review Required:** ✅  

---

## 📘 About the Project

This project is part of the **ALX Airbnb Database Module**, where I applied **advanced SQL techniques** to analyze and optimize a simulated Airbnb database. I worked on tasks such as writing complex SQL queries, creating indexes, optimizing performance, and implementing partitioning—all essential for managing high-performance relational databases in real-world applications.

---

## 🧠 What I Learned

- Writing complex SQL queries using **INNER**, **LEFT**, and **FULL OUTER** joins  
- Using **correlated** and **non-correlated** subqueries to filter and analyze data  
- Performing **aggregations** and using **window functions** like `ROW_NUMBER()` and `RANK()`  
- Identifying query bottlenecks using `EXPLAIN`, `ANALYZE`, and `SHOW PROFILE`  
- Creating **indexes** to improve query performance  
- Refactoring inefficient SQL queries  
- Implementing **table partitioning** for large datasets  
- Monitoring query execution and refining schema design like a real **DBA**

---

## 🗂️ Project Structure



---

## 🧪 Task Breakdown & Solutions

### ✅ Task 0: Write Complex Queries with Joins

**What I Did:**  
Wrote three SQL queries to practice different types of joins between Airbnb tables.

**How I Solved It:**
- Used `INNER JOIN` to connect `Bookings` and `Users`, showing matched data.
- Used `LEFT JOIN` to list all `Properties` and their `Reviews`, including those with no reviews.
- Used `FULL OUTER JOIN` to show all `Users` and `Bookings`, even if unmatched.

📄 File: `joins_queries.sql`

---

### ✅ Task 1: Practice Subqueries

**What I Did:**  
Practiced both correlated and non-correlated subqueries for filtering and analysis.

**How I Solved It:**
- Non-correlated subquery: Selected `Properties` with average rating > 4.0.
- Correlated subquery: Found `Users` who made more than 3 bookings.

📄 File: `subqueries.sql`

---

### ✅ Task 2: Apply Aggregations and Window Functions

**What I Did:**  
Used aggregation and ranking functions to analyze Airbnb user and property data.

**How I Solved It:**
- Counted total bookings per user using `COUNT(*)` with `GROUP BY`.
- Ranked properties based on total bookings using `RANK()` window function.

📄 File: `aggregations_and_window_functions.sql`

---

### ✅ Task 3: Implement Indexes for Optimization

**What I Did:**  
Created indexes to speed up common queries.

**How I Solved It:**
- Identified frequently used columns (e.g., `user_id`, `property_id`, `start_date`).
- Wrote `CREATE INDEX` statements to index these columns.
- Used `EXPLAIN` before and after indexing to analyze performance gains.

📄 Files: `database_index.sql`, `index_performance.md`

---

### ✅ Task 4: Optimize Complex Queries

**What I Did:**  
Wrote and optimized a query involving multiple joins and conditions.

**How I Solved It:**
- Wrote a raw query joining `Bookings`, `Users`, `Properties`, and `Payments`.
- Analyzed it using `EXPLAIN`, then refactored it to remove unnecessary joins and optimize filters.
- Documented all changes and performance results.

📄 Files: `performance.sql`, `optimization_report.md`

---

### ✅ Task 5: Partitioning Large Tables

**What I Did:**  
Implemented partitioning on the `Booking` table to improve performance.

**How I Solved It:**
- Partitioned `Bookings` by `start_date` using `RANGE` partitioning.
- Tested a date-range query on both the original and partitioned tables.
- Measured and documented improved execution times.

📄 Files: `partitioning.sql`, `partition_performance.md`

---

### ✅ Task 6: Monitor and Refine Database Performance

**What I Did:**  
Monitored query performance and proposed schema improvements.

**How I Solved It:**
- Used `SHOW PROFILE` and `EXPLAIN ANALYZE` on several queries.
- Identified bottlenecks caused by missing indexes and inefficient joins.
- Suggested and implemented fixes, then reported the results.

📄 File: `performance_monitoring.md`

---

## 🖥️ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/alx-airbnb-database.git
   cd alx-airbnb-database/database-adv-script
