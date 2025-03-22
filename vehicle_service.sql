-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 06:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mechanic_id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `service_date` date NOT NULL,
  `service_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `mechanic_id`, `vehicle_id`, `service_date`, `service_time`) VALUES
(2, 10, 4, 3, '2025-03-27', '23:22:00'),
(3, 13, 5, 10, '2025-04-30', '23:31:00'),
(4, 13, 1, 6, '2024-03-30', '21:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`id`, `name`, `specialization`) VALUES
(1, 'John Doe', 'Engine Repair'),
(2, 'Jane Smith', 'Brake Specialist'),
(3, 'Mike Johnson', 'Transmission Repair'),
(4, 'Sarah Lee', 'Suspension & Alignment'),
(5, 'Chris Brown', 'AC & Heating Systems'),
(6, 'Emma Wilson', 'Tire & Wheel Services'),
(7, 'David Miller', 'Battery & Electrical'),
(8, 'Sophia Martinez', 'Oil & Filter Change'),
(9, 'James Anderson', 'Bodywork & Painting'),
(10, 'Olivia Taylor', 'Exhaust System Repair');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(10, 'Upasana', 'pulie', 'julieupasanadwivedi@gmail.com', '2025-03-21 15:51:54'),
(11, 'Upasana', '$2y$10$9cqb0OPmmswPrb6UPdAR2.RdPSwAy6gwwRFGmz9Iz1q9K8npHRg5y', 'julieupasanadwivedi@gmail.com', '2025-03-21 15:57:25'),
(12, 'Upasana', '$2y$10$InVKoEWFrC0.pIh5xRr.YeHJlXmoL7BBmGUk3EmaDfNrksHmGUBca', 'julieupasanadwivedi@gmail.com', '2025-03-21 15:59:29'),
(13, 'uppu', '$2y$10$dYCfGCkwP6ww9DwYR9ekee6Vtd4SW3bzMMgUqxXt9en6k6IuME4Iy', 'julieupasanadwivedi@gmail.com', '2025-03-21 16:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `model`) VALUES
(6, 'Audi A4'),
(5, 'BMW 3 Series'),
(4, 'Chevrolet Malibu'),
(3, 'Ford Mustang'),
(1, 'Honda Civic'),
(9, 'Hyundai Sonata'),
(10, 'Kia Optima'),
(7, 'Mercedes-Benz C-Class'),
(8, 'Nissan Altima'),
(2, 'Toyota Corolla');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mechanic_id` (`mechanic_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `model` (`model`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mechanics`
--
ALTER TABLE `mechanics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
