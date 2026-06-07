-- =====================================
-- PgBee Profitability Analysis
-- =====================================

-- Beta Phase Assumptions

-- Revenue = ₹36,926
-- Hosting = ₹1,000
-- Marketing = ₹5,000
-- Operations/Admin = 4,000

-- Total Cost = ₹10,000


-- Revenue vs Cost vs Profit

SELECT
36926 AS revenue,
10000 AS total_cost,
36926 - 10000 AS net_profit;


-- Profit Margin %

SELECT
(
(36926 - 10000)
/
36926
) * 100
AS profit_margin_percentage;


-- Revenue Per Hostel

SELECT
36926 / 38
AS revenue_per_hostel;


-- Revenue Per Booking

SELECT
36926 / 74
AS revenue_per_booking;


-- Cost Per Booking

SELECT
10000 / 74
AS cost_per_booking;


-- Profit Per Booking

SELECT
(36926 - 10000) / 74
AS profit_per_booking;