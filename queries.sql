-- create database
CREATE DATABASE vehicle_rental_system

-- customer table 
CREATE TABLE users( 
  user_id SERIAL PRIMARY KEY, 
  customer_name VARCHAR(200) NOT NULL, 
  customer_email VARCHAR(200) UNIQUE NOT NULL, 
  password TEXT, 
  phone_number VARCHAR(20) NOT NULL, 
  role VARCHAR(50) NOT NULL CHECK(role in('admin', 'customer')) 
  )
  
-- vehicle table 
CREATE TABLE vehicles( 
  vehicle_id SERIAL PRIMARY KEY, 
  vehicle_name VARCHAR(200) NOT NULL, 
  vehicle_type VARCHAR(50) NOT NULL CHECK(vehicle_type in('car','bike','truck')), 
  model VARCHAR(20) NOT NULL, 
  registration_number VARCHAR(50) UNIQUE NOT NULL, 
  rental_price INT NOT NULL CHECK (rental_price > 0),
  availability_status VARCHAR(20) NOT NULL DEFAULT 'available' CHECK (availability_status IN ('available','rented','maintenance'))
  )
  
  -- Bookings Table 
CREATE TABLE bookings(
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  vehicle_id INT NOT NULL REFERENCES vehicles(vehicle_id) ON DELETE CASCADE,
  rental_start_date DATE NOT NULL,
  rental_end_date DATE NOT NULL,
  booking_status VARCHAR(20) NOT NULL CHECK (booking_status IN ('pending','confirmed','completed','cancelled')),
  total_cost INT NOT NULL CHECK (total_cost >= 0),
  CHECK (rental_end_date > rental_start_date)
);

-- Insert data
--users
INSERT INTO users (customer_name, customer_email, password, phone_number, role) VALUES
('Shishir Ahmed', 'shishir@gmail.com', 'hashed_pass_1', '01710000001', 'admin'),
('Rahim Uddin', 'rahim@gmail.com', 'hashed_pass_2', '01710000002', 'customer'),
('Karim Ali', 'karim@gmail.com', 'hashed_pass_3', '01710000003', 'customer'),
('Nusrat Jahan', 'nusrat@gmail.com', 'hashed_pass_4', '01710000004', 'customer'),
('Ayesha Khan', 'ayesha@gmail.com', 'hashed_pass_5', '01710000005', 'customer'),
('Tanvir Hasan', 'tanvir@gmail.com', 'hashed_pass_6', '01710000006', 'customer'),
('Sabbir Hossain', 'sabbir@gmail.com', 'hashed_pass_7', '01710000007', 'customer'),
('Mehedi Hasan', 'mehedi@gmail.com', 'hashed_pass_8', '01710000008', 'customer'),
('Farzana Akter', 'farzana@gmail.com', 'hashed_pass_9', '01710000009', 'customer'),
('Imran Mahmud', 'imran@gmail.com', 'hashed_pass_10', '01710000010', 'customer'),
('Rashed Chowdhury', 'rashed@gmail.com', 'hashed_pass_11', '01710000011', 'customer'),
('Sadia Rahman', 'sadia@gmail.com', 'hashed_pass_12', '01710000012', 'customer'),
('Naim Sheikh', 'naim@gmail.com', 'hashed_pass_13', '01710000013', 'customer'),
('Jannatul Ferdous', 'jannatul@gmail.com', 'hashed_pass_14', '01710000014', 'customer'),
('Admin Support', 'support@admin.com', 'hashed_pass_15', '01710000015', 'admin');

-- vehicles
INSERT INTO vehicles (
  vehicle_name,
  vehicle_type,
  model,
  registration_number,
  rental_price,
  availability_status
) VALUES
('Toyota Corolla', 'car', '2020', 'DHK-CA-1001', 3500, 'available'),
('Honda Civic', 'car', '2021', 'DHK-CA-1002', 4200, 'rented'),
('Nissan Sunny', 'car', '2019', 'DHK-CA-1003', 3000, 'maintenance'),

('Yamaha R15', 'bike', '2022', 'DHK-BI-2001', 1500, 'available'),
('Suzuki Gixxer', 'bike', '2021', 'DHK-BI-2002', 1400, 'rented'),
('Bajaj Pulsar', 'bike', '2020', 'DHK-BI-2003', 1200, 'available'),

('Isuzu D-Max', 'truck', '2018', 'DHK-TR-3001', 6000, 'available'),
('Tata Ace', 'truck', '2019', 'DHK-TR-3002', 5500, 'maintenance'),
('Mahindra Bolero Pickup', 'truck', '2020', 'DHK-TR-3003', 5800, 'rented'),

('Hyundai Elantra', 'car', '2022', 'DHK-CA-1004', 4500, 'available'),
('Toyota Axio', 'car', '2018', 'DHK-CA-1005', 2800, 'available'),

('Honda CB Hornet', 'bike', '2022', 'DHK-BI-2004', 1600, 'available'),
('Hero Splendor', 'bike', '2019', 'DHK-BI-2005', 1000, 'maintenance'),

('Ashok Leyland Dost', 'truck', '2021', 'DHK-TR-3004', 6200, 'available'),
('Eicher Pro 2049', 'truck', '2022', 'DHK-TR-3005', 7000, 'rented');

-- bookings
INSERT INTO bookings (
  user_id,
  vehicle_id,
  rental_start_date,
  rental_end_date,
  booking_status,
  total_cost
) VALUES
(1, 1, '2024-01-01', '2024-01-05', 'completed', 14000),
(2, 2, '2024-01-03', '2024-01-06', 'completed', 12600),
(3, 3, '2024-01-05', '2024-01-07', 'completed', 6000),
(4, 4, '2024-01-06', '2024-01-08', 'completed', 3000),
(5, 5, '2024-01-07', '2024-01-10', 'completed', 4200),
(6, 6, '2024-01-08', '2024-01-12', 'confirmed', 4800),
(7, 7, '2024-01-10', '2024-01-15', 'confirmed', 30000),
(8, 8, '2024-01-11', '2024-01-13', 'completed', 11000),
(9, 9, '2024-01-12', '2024-01-16', 'confirmed', 23200),
(10, 10, '2024-01-14', '2024-01-18', 'completed', 18000),
(11, 11, '2024-01-15', '2024-01-17', 'completed', 5600),
(12, 12, '2024-01-16', '2024-01-20', 'confirmed', 6400),
(13, 13, '2024-01-18', '2024-01-21', 'completed', 3000),
(14, 14, '2024-01-19', '2024-01-25', 'confirmed', 37200),
(15, 15, '2024-01-20', '2024-01-23', 'completed', 21000),
(2, 1, '2024-02-01', '2024-02-04', 'completed', 10500),
(3, 2, '2024-02-03', '2024-02-06', 'cancelled', 0),
(4, 3, '2024-02-05', '2024-02-09', 'completed', 12000),
(5, 4, '2024-02-06', '2024-02-08', 'completed', 3000),
(6, 5, '2024-02-07', '2024-02-10', 'confirmed', 4200),
(7, 6, '2024-02-08', '2024-02-12', 'completed', 4800),
(8, 7, '2024-02-10', '2024-02-14', 'confirmed', 24000),
(9, 8, '2024-02-12', '2024-02-15', 'completed', 16500),
(10, 9, '2024-02-13', '2024-02-17', 'confirmed', 23200),
(11, 10, '2024-02-15', '2024-02-19', 'completed', 18000),
(12, 11, '2024-02-16', '2024-02-18', 'completed', 5600),
(13, 12, '2024-02-17', '2024-02-21', 'confirmed', 6400),
(14, 13, '2024-02-18', '2024-02-20', 'cancelled', 0),
(15, 14, '2024-02-19', '2024-02-24', 'confirmed', 31000);

INSERT INTO bookings (
  user_id,
  vehicle_id,
  rental_start_date,
  rental_end_date,
  booking_status,
  total_cost
) VALUES (1, 12, '2024-02-19', '2024-02-23', 'confirmed', 32000),
(4, 13, '2024-02-20', '2024-02-24', 'confirmed', 12000),
(5, 14, '2024-02-22', '2024-02-25', 'confirmed', 26000);

-- 1.Retrieve booking information along with:
-- Customer name, Vehicle name
SELECT b.booking_id, u.customer_name, v.vehicle_name, b.rental_start_date, b.rental_end_date, b.booking_status FROM bookings b INNER JOIN users u ON b.user_id = u.user_id INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id

-- 2.Find all vehicles that have never been booked.
SELECT * FROM vehicles WHERE availability_status <> 'booked'

-- 3.Retrieve all available vehicles of a specific type (e.g. cars).
SELECT * FROM vehicles 
  WHERE availability_status = 'available' AND vehicle_type = 'car'

-- 4.Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT v.vehicle_name, COUNT(*) AS total_bookings FROM bookings b 
  INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id GROUP BY v.vehicle_name HAVING COUNT(*) > 2






