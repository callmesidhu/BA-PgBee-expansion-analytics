-- =====================================
-- PgBee Forecasting Dataset
-- =====================================

-- Current Beta Metrics

-- Students : 74
-- Hostels : 38
-- Bookings : 74
-- Revenue : ₹36,926


-- Monthly Booking Trend

SELECT
DATE_FORMAT(booking_date,'%Y-%m')
AS month,

COUNT(*) AS bookings

FROM bookings

GROUP BY month
ORDER BY month;


-- Monthly Revenue Trend

SELECT
DATE_FORMAT(booking_date,'%Y-%m')
AS month,

SUM(commission_amount)
AS revenue

FROM bookings

GROUP BY month
ORDER BY month;


-- Forecast Base Dataset

SELECT
COUNT(*) AS bookings,
SUM(commission_amount) AS revenue,
AVG(commission_amount) AS avg_commission
FROM bookings;


-- District Forecast Dataset

SELECT
h.district,
COUNT(*) AS bookings,
SUM(b.commission_amount) AS revenue
FROM bookings b
JOIN hostels h
ON b.hostel_id = h.hostel_id
GROUP BY h.district;