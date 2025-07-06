Task 0:
-- Task 0: Complex Queries with Joins
-- ----------------------------------

-- INNER JOIN: Retrieve bookings along with their respective users
-- This will only return rows where a booking has a matching user
SELECT b.id AS booking_id, u.name AS user_name, b.property_id, b.check_in, b.check_out
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and any associated reviews
-- Properties with no reviews will still be shown (NULL in rating/comment)
SELECT p.id AS property_id, p.name AS property_name, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;

-- FULL OUTER JOIN: Retrieve all users and all bookings
-- Includes users without bookings and bookings not linked to any user
-- This syntax works in PostgreSQL
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

-- MySQL FULL OUTER JOIN alternative using UNION
-- Combines LEFT JOIN and RIGHT JOIN results to simulate FULL OUTER JOIN
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;


EXPLANATIONS:
# Task 0: Complex Queries with Joins - Detailed Explanation

## INNER JOIN Query

```sql
SELECT b.id AS booking_id, u.name AS user_name, b.property_id, b.check_in, b.check_out
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
Explanation
Purpose: Retrieves only bookings that have matching user records

Mechanics:

Combines rows from bookings and users tables

Only returns records where bookings.user_id = users.id

Uses table aliases (b for bookings, u for users)

Output:

Booking details + corresponding user name

No NULL values in result set

Visualization:

text
Bookings Table       Users Table
[booking1: user1] → [user1] → INCLUDED
[booking2: user2] → [user2] → INCLUDED
[booking3: user99] → (No user99) → EXCLUDED
Use Case: "Show all bookings with the guest's name"

LEFT JOIN Query
sql
SELECT p.id AS property_id, p.name AS property_name, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;
Explanation
Purpose: Gets all properties regardless of review status

Key Features:

Preserves ALL properties (left table)

Attaches review data when available

Returns NULL for review columns if no reviews exist

Output Example:

text
| property_id | property_name | rating | comment |
|-------------|---------------|--------|---------|
| 101         | Beach Villa   | 4.5    | "Great" |
| 102         | Mountain View | NULL   | NULL    |
Use Case: "Show me all properties and their reviews (if any)"

FULL OUTER JOIN (PostgreSQL)
sql
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
Explanation
Purpose: Shows ALL users AND ALL bookings in one result

Behavior:

Includes users without bookings (booking columns = NULL)

Includes bookings without users (user columns = NULL)

Shows matched pairs where they exist

Use Case: "Find data gaps - users who never booked and bookings with missing user info"

FULL OUTER JOIN Alternative (MySQL)
sql
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
Explanation
Why Needed: MySQL lacks native FULL OUTER JOIN support

How It Works:

LEFT JOIN gets all users + their bookings

RIGHT JOIN gets all bookings + their users

UNION merges both results, removing duplicates

Equivalent To: PostgreSQL's FULL OUTER JOIN

Performance Note: More resource-intensive than native implementation

Join Type Comparison
Join Type	Returns	Best For
INNER JOIN	Only records with matches in both tables	Complete transaction records
LEFT JOIN	All left table records + matches (NULL right if no match)	Preserving primary entities
FULL OUTER JOIN	All records from both tables (NULLs where no matches)	Data completeness audits
Best Practices:

Always use explicit ON clauses

Use table aliases for readability

Specify column aliases (AS) for clear results

Add WHERE clauses to filtered joins when needed

text

This Markdown file:
1. Clearly separates each query type
2. Provides executable SQL examples
3. Includes visualizations and use cases
4. Compares join types in an easy-to-read table
5. Offers professional best practices








