# Vehicle Rental System Database

This project implements a **Vehicle Rental System** database using **PostgreSQL**. It manages users, vehicles, and bookings with proper relational structure, constraints, and sample queries. All table definitions, sample data, and queries are included in the `queries.sql` file.

---

## Project Structure

- **queries.sql** – Contains:
  - Table creation statements for `users`, `vehicles`, and `bookings`.
  - Sample data insertion for users, vehicles, and bookings.
  - Example queries demonstrating key operations.

---

## Tables Overview

### 1. `users`

Stores all system users (Admins and Customers).
we have these column for users--
user_id, customer_namecustomer_name, customer_email, password, phone_number, role

---

### 2. `vehicles`

Stores details of vehicles available for rent.
column for vehicles--
vehicle_id, vehicle_name, vehicle_type, model, registration_number, rental_price, availability_status

---

### 3. `bookings`

Tracks which users booked which vehicles and rental details.
column for bookings--
booking_id, user_id, vehicle_id, rental_start_date, rental_end_date, booking_status, total_cost

---

## Queries

### 1.Retrieve booking information along with: -- Customer name, Vehicle name

SELECT b.booking_id, u.customer_name, v.vehicle_name, b.rental_start_date, b.rental_end_date, b.booking_status FROM bookings b INNER JOIN users u ON b.user_id = u.user_id INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id

### 2.Find all vehicles that have never been booked.

SELECT \* FROM vehicles WHERE availability_status <> 'booked'

### 3.Retrieve all available vehicles of a specific type (e.g. cars).

SELECT \* FROM vehicles
WHERE availability_status = 'available' AND vehicle_type = 'car'

### 4.Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

SELECT v.vehicle_name, COUNT(_) AS total_bookings FROM bookings b
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id GROUP BY v.vehicle_name HAVING COUNT(_) > 2
