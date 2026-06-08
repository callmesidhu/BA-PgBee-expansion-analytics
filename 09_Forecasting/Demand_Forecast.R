# =====================================
# PgBee Demand Forecast
# =====================================

library(ggplot2)

# Current Beta Metrics
current_bookings <- 74
commission_per_booking <- 499

# Forecast Assumption
growth_rate <- 0.15

months <- c(
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep"
)

bookings <- numeric(length(months))
bookings[1] <- current_bookings

for(i in 2:length(months))
{
  bookings[i] <- round(
    bookings[i - 1] * (1 + growth_rate)
  )
}

revenue <- bookings * commission_per_booking

forecast_data <- data.frame(
  Month = months,
  Forecast_Bookings = bookings,
  Forecast_Revenue = revenue
)

print(forecast_data)

# Create Outputs Folder
if(!dir.exists("outputs"))
{
  dir.create("outputs")
}

# Save Forecast CSV
write.csv(
  forecast_data,
  "outputs/forecast_summary.csv",
  row.names = FALSE
)

# Booking Forecast Plot
png(
  "outputs/demand_forecast_plot.png",
  width = 1000,
  height = 600
)

ggplot(
  forecast_data,
  aes(
    x = Month,
    y = Forecast_Bookings,
    group = 1
  )
) +
  geom_line(linewidth = 1.5) +
  geom_point(size = 4) +
  labs(
    title = "PgBee Booking Forecast",
    x = "Month",
    y = "Bookings"
  ) +
  theme_minimal()

dev.off()

# Revenue Forecast Plot
png(
  "outputs/revenue_forecast_plot.png",
  width = 1000,
  height = 600
)

ggplot(
  forecast_data,
  aes(
    x = Month,
    y = Forecast_Revenue,
    group = 1
  )
) +
  geom_line(linewidth = 1.5) +
  geom_point(size = 4) +
  labs(
    title = "PgBee Revenue Forecast",
    x = "Month",
    y = "Revenue (₹)"
  ) +
  theme_minimal()

dev.off()

cat("\nForecast Complete\n")