-- =====================================
-- PgBee Funnel Analysis
-- =====================================

-- Goal:
-- Understand student journey

-- Registration
-- Booking
-- Conversion


-- Total Students

SELECT
COUNT(*) AS total_students
FROM students;


-- Total Bookings

SELECT
COUNT(*) AS total_bookings
FROM bookings
WHERE booking_status='Completed';


-- Student To Booking Conversion

SELECT
(
COUNT(*) * 100.0
/
(SELECT COUNT(*) FROM students)
)
AS booking_conversion_rate
FROM bookings
WHERE booking_status='Completed';


-- Average Bookings Per Hostel

SELECT
COUNT(*) / 38.0
AS bookings_per_hostel
FROM bookings;


-- Top 10 Hostels

SELECT
h.hostel_name,
COUNT(*) AS bookings
FROM bookings b
JOIN hostels h
ON b.hostel_id = h.hostel_id
GROUP BY h.hostel_name
ORDER BY bookings DESC
LIMIT 10;


-- District Performance

SELECT
h.district,
COUNT(*) AS bookings
FROM bookings b
JOIN hostels h
ON b.hostel_id = h.hostel_id
GROUP BY h.district;