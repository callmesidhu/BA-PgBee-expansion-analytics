-- =====================================
-- PgBee Revenue Analytics
-- =====================================

-- Total Revenue Earned

SELECT
SUM(commission_amount) AS total_revenue
FROM bookings
WHERE booking_status = 'Completed';


-- Total Bookings

SELECT
COUNT(*) AS total_bookings
FROM bookings
WHERE booking_status = 'Completed';


-- Revenue Per Booking

SELECT
AVG(commission_amount) AS revenue_per_booking
FROM bookings
WHERE booking_status = 'Completed';


-- Revenue Per Hostel

SELECT
SUM(commission_amount) / COUNT(DISTINCT hostel_id)
AS revenue_per_hostel
FROM bookings
WHERE booking_status = 'Completed';


-- Top Performing Hostels

SELECT
h.hostel_name,
COUNT(*) AS bookings,
SUM(b.commission_amount) AS revenue
FROM bookings b
JOIN hostels h
ON b.hostel_id = h.hostel_id
GROUP BY h.hostel_name
ORDER BY revenue DESC;


-- Revenue By District

SELECT
h.district,
COUNT(*) AS bookings,
SUM(b.commission_amount) AS revenue
FROM bookings b
JOIN hostels h
ON b.hostel_id = h.hostel_id
GROUP BY h.district
ORDER BY revenue DESC;