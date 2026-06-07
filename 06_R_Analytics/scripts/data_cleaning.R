# =====================================
# PgBee Data Cleaning
# =====================================

library(DBI)
library(RMySQL)
library(dplyr)
library(readr)

# =====================================
# Connect MySQL
# =====================================

con <- dbConnect(
  MySQL(),
  user = "root",
  password = "00000000",
  dbname = "pgbee_analytics",
  host = "localhost"
)

cat("Connected Successfully\n")

# =====================================
# Load Tables
# =====================================

students <- dbReadTable(con, "students")
hostels <- dbReadTable(con, "hostels")
bookings <- dbReadTable(con, "bookings")

# =====================================
# Students Cleaning
# =====================================

students_clean <- students %>%
  distinct() %>%
  filter(!is.na(full_name))

# =====================================
# Hostels Cleaning
# =====================================

hostels_clean <- hostels %>%
  distinct() %>%
  filter(capacity > 0)

# =====================================
# Bookings Cleaning
# =====================================

bookings_clean <- bookings %>%
  distinct() %>%
  filter(commission_amount >= 0)

# =====================================
# Summary
# =====================================

cat("Students:", nrow(students_clean), "\n")
cat("Hostels:", nrow(hostels_clean), "\n")
cat("Bookings:", nrow(bookings_clean), "\n")

# =====================================
# Save Clean Files
# =====================================

write_csv(
  students_clean,
  "06_R_Analytics/outputs/students_clean.csv"
)

write_csv(
  hostels_clean,
  "06_R_Analytics/outputs/hostels_clean.csv"
)

write_csv(
  bookings_clean,
  "06_R_Analytics/outputs/bookings_clean.csv"
)

# =====================================
# Close Connection
# =====================================

dbDisconnect(con)

cat("Data Cleaning Complete\n")