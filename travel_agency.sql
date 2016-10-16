-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 16, 2016 at 11:32 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airseat`
--

CREATE TABLE `airseat` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `class` enum('бизнес','эконом','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `airticket`
--

CREATE TABLE `airticket` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `callout_id` int(11) NOT NULL,
  `departure_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `payment` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout`
--

CREATE TABLE `callout` (
  `id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `cancellation_at` int(11) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_order`
--

CREATE TABLE `callout_order` (
  `id` int(11) NOT NULL,
  `callout_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `payment` int(7) NOT NULL,
  `payment_at` int(11) DEFAULT NULL,
  `is_discount` int(1) NOT NULL DEFAULT '0',
  `canceling_at` int(11) DEFAULT NULL,
  `status` enum('оплачено','отменено','в ожидание','просрочено') NOT NULL DEFAULT 'в ожидание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `callout_room`
--

CREATE TABLE `callout_room` (
  `id` int(11) NOT NULL,
  `callout_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `position` enum('менеджер','директор','пиар-менеджер','рекрутер') NOT NULL,
  `created_at` int(11) NOT NULL,
  `salary` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `excursion`
--

CREATE TABLE `excursion` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `duration` int(6) NOT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `excursion_order`
--

CREATE TABLE `excursion_order` (
  `id` int(11) NOT NULL,
  `excursion_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `callout_id` int(11) NOT NULL,
  `payment` int(6) NOT NULL,
  `starting_address` varchar(150) NOT NULL,
  `starting_at` int(11) NOT NULL,
  `is_baby` int(1) NOT NULL DEFAULT '0',
  `is_privilege` int(1) NOT NULL DEFAULT '0',
  `is_custom` int(1) NOT NULL DEFAULT '0',
  `bus_place_number` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `from_airport_id` int(11) NOT NULL,
  `to_airport_id` int(11) NOT NULL,
  `flight_at` int(11) NOT NULL,
  `duration` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `type` varchar(4) NOT NULL,
  `description` text NOT NULL,
  `how_many_in_day` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `stars_number` int(1) NOT NULL,
  `distance_to_beach` int(6) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_service`
--

CREATE TABLE `hotel_service` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `duration` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_service_order`
--

CREATE TABLE `hotel_service_order` (
  `id` int(11) NOT NULL,
  `hotel_service_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `payment` int(6) NOT NULL,
  `provision_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `birthday_at` int(11) NOT NULL,
  `passport_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_airticket`
--

CREATE TABLE `person_airticket` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `airticket_id` int(11) NOT NULL,
  `is_baggage` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_transfer`
--

CREATE TABLE `person_transfer` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `is_baggage` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(5) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `daily_payment` int(7) NOT NULL,
  `class` varchar(2) NOT NULL,
  `seats_number` int(3) NOT NULL,
  `room_size` int(3) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `type` enum('автобус','такси','','') NOT NULL,
  `from_airport_id` int(11) DEFAULT NULL,
  `to_airport_id` int(11) DEFAULT NULL,
  `starting_address` varchar(150) DEFAULT NULL,
  `starting_time` time NOT NULL,
  `final_address` varchar(150) NOT NULL,
  `duration` int(5) NOT NULL,
  `total_seats` int(2) NOT NULL,
  `distance` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `callout_id` int(11) NOT NULL,
  `starting_date` date NOT NULL,
  `created_at` int(11) NOT NULL,
  `payment` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`city_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `airseat`
--
ALTER TABLE `airseat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flight_id_2` (`flight_id`,`class`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `airticket`
--
ALTER TABLE `airticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `callout_id` (`callout_id`);

--
-- Indexes for table `callout`
--
ALTER TABLE `callout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callout_order`
--
ALTER TABLE `callout_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `callout_id` (`callout_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `callout_room`
--
ALTER TABLE `callout_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `callout_id_2` (`callout_id`,`room_id`),
  ADD KEY `callout_id` (`callout_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id_2` (`person_id`,`position`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `excursion`
--
ALTER TABLE `excursion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `excursion_order`
--
ALTER TABLE `excursion_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `excursion_id` (`excursion_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `callout_id` (`callout_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline_id` (`airline_id`),
  ADD KEY `from_airport_id` (`from_airport_id`),
  ADD KEY `to_airport_id` (`to_airport_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tour_id_2` (`tour_id`,`name`),
  ADD KEY `tour_id` (`tour_id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `hotel_service`
--
ALTER TABLE `hotel_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotel_service_order`
--
ALTER TABLE `hotel_service_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_service_id` (`hotel_service_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_airticket`
--
ALTER TABLE `person_airticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id_2` (`person_id`,`airticket_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `airticket_id` (`airticket_id`);

--
-- Indexes for table `person_transfer`
--
ALTER TABLE `person_transfer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id_2` (`person_id`,`transfer_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `transfer_id` (`transfer_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`,`hotel_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_airport_id` (`from_airport_id`),
  ADD KEY `to_airport_id` (`to_airport_id`);

--
-- Indexes for table `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`country_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `callout_id` (`callout_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `airseat`
--
ALTER TABLE `airseat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `airticket`
--
ALTER TABLE `airticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `callout`
--
ALTER TABLE `callout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `callout_order`
--
ALTER TABLE `callout_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `callout_room`
--
ALTER TABLE `callout_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `excursion`
--
ALTER TABLE `excursion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `excursion_order`
--
ALTER TABLE `excursion_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel_service`
--
ALTER TABLE `hotel_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel_service_order`
--
ALTER TABLE `hotel_service_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_airticket`
--
ALTER TABLE `person_airticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_transfer`
--
ALTER TABLE `person_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `airseat`
--
ALTER TABLE `airseat`
  ADD CONSTRAINT `airseat_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `airticket`
--
ALTER TABLE `airticket`
  ADD CONSTRAINT `airticket_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `airticket_ibfk_2` FOREIGN KEY (`callout_id`) REFERENCES `callout` (`id`);

--
-- Constraints for table `callout_order`
--
ALTER TABLE `callout_order`
  ADD CONSTRAINT `callout_order_ibfk_1` FOREIGN KEY (`callout_id`) REFERENCES `callout` (`id`),
  ADD CONSTRAINT `callout_order_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `callout_order_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `callout_room`
--
ALTER TABLE `callout_room`
  ADD CONSTRAINT `callout_room_ibfk_1` FOREIGN KEY (`callout_id`) REFERENCES `callout` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `callout_room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Constraints for table `excursion`
--
ALTER TABLE `excursion`
  ADD CONSTRAINT `excursion_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `excursion_order`
--
ALTER TABLE `excursion_order`
  ADD CONSTRAINT `excursion_order_ibfk_1` FOREIGN KEY (`excursion_id`) REFERENCES `excursion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `excursion_order_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `excursion_order_ibfk_3` FOREIGN KEY (`callout_id`) REFERENCES `callout` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`from_airport_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `flight_ibfk_5` FOREIGN KEY (`to_airport_id`) REFERENCES `airport` (`id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `hotel_service`
--
ALTER TABLE `hotel_service`
  ADD CONSTRAINT `hotel_service_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hotel_service_order`
--
ALTER TABLE `hotel_service_order`
  ADD CONSTRAINT `hotel_service_order_ibfk_1` FOREIGN KEY (`hotel_service_id`) REFERENCES `hotel_service` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_service_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hotel_service_order_ibfk_3` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `person_airticket`
--
ALTER TABLE `person_airticket`
  ADD CONSTRAINT `person_airticket_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_airticket_ibfk_2` FOREIGN KEY (`airticket_id`) REFERENCES `airticket` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `person_transfer`
--
ALTER TABLE `person_transfer`
  ADD CONSTRAINT `person_transfer_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_transfer_ibfk_2` FOREIGN KEY (`transfer_id`) REFERENCES `transfer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`from_airport_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`to_airport_id`) REFERENCES `airport` (`id`);

--
-- Constraints for table `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`callout_id`) REFERENCES `callout` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
