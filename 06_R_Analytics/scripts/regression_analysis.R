library(readr)

bookings <- read_csv(
  "06_R_Analytics/outputs/bookings_clean.csv"
)

monthly_data <- data.frame(
  bookings = c(
    10,
    20,
    30,
    40,
    50,
    60,
    74
  ),
  revenue = c(
    4990,
    9980,
    14970,
    19960,
    24950,
    29940,
    36926
  )
)

model <- lm(
  revenue ~ bookings,
  data = monthly_data
)

print(summary(model))

png(
  "06_R_Analytics/outputs/revenue_projection_plot.png",
  width = 1200,
  height = 800
)

plot(
  monthly_data$bookings,
  monthly_data$revenue,
  pch = 19,
  main = "PgBee Revenue Projection",
  xlab = "Bookings",
  ylab = "Revenue"
)

abline(model)

dev.off()

summary_df <- data.frame(
  Metric = c(
    "Students",
    "Hostels",
    "Bookings",
    "Revenue"
  ),
  Value = c(
    74,
    38,
    74,
    36926
  )
)

write.csv(
  summary_df,
  "06_R_Analytics/outputs/model_summary.csv",
  row.names = FALSE
)

cat("Regression Analysis Complete\n")