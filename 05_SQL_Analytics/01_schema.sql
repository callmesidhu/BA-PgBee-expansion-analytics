-- =====================================
-- PgBee SQL Analytics
-- Database Schema
-- =====================================

-- Students registered on PgBee

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    college_name VARCHAR(150),
    district VARCHAR(50),
    registration_date DATE
);

-- Hostel owners

CREATE TABLE hostel_owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(100),
    phone VARCHAR(20)
);

-- Hostels listed on PgBee

CREATE TABLE hostels (
    hostel_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    hostel_name VARCHAR(150),
    district VARCHAR(50),
    capacity INT,
    monthly_rent DECIMAL(10,2),

    FOREIGN KEY (owner_id)
    REFERENCES hostel_owners(owner_id)
);

-- Hostel bookings

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,

    student_id INT,
    hostel_id INT,

    booking_date DATE,

    booking_amount DECIMAL(10,2),

    -- PgBee earns ₹499 per booking
    commission_amount DECIMAL(10,2),

    booking_status VARCHAR(20),

    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (hostel_id)
    REFERENCES hostels(hostel_id)
);