-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 05:14 AM
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
-- Database: `oryza_research_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `fertilizers`
--

CREATE TABLE `fertilizers` (
  `fertilizer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `application_rate` decimal(10,2) DEFAULT NULL,
  `field_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `field_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `field_size_ha` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genetic_data`
--

CREATE TABLE `genetic_data` (
  `genetic_id` int(11) NOT NULL,
  `variety_id` int(11) DEFAULT NULL,
  `gene` varchar(100) DEFAULT NULL,
  `trait` varchar(100) DEFAULT NULL,
  `research_instute` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `growth_measurements`
--

CREATE TABLE `growth_measurements` (
  `Measurement_id` int(11) NOT NULL,
  `planting_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `Height` decimal(4,2) DEFAULT NULL,
  `leaf_color` varchar(50) DEFAULT NULL,
  `Tillers` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harvesting`
--

CREATE TABLE `harvesting` (
  `harvesting_id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `variety_id` int(11) DEFAULT NULL,
  `harvest_date` date NOT NULL,
  `Yield` decimal(10,2) DEFAULT NULL,
  `quality_grade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `irrigation`
--

CREATE TABLE `irrigation` (
  `irrigation_id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `method` varchar(50) DEFAULT NULL,
  `water_usage` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesticides`
--

CREATE TABLE `pesticides` (
  `pesticide_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `application_rate` decimal(10,2) DEFAULT NULL,
  `field_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planting`
--

CREATE TABLE `planting` (
  `p_id` int(11) NOT NULL,
  `p_date` date NOT NULL,
  `seed_rate` decimal(5,2) NOT NULL,
  `variety_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soil_samples`
--

CREATE TABLE `soil_samples` (
  `sample_id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `sample_date` date NOT NULL,
  `pH` decimal(4,2) DEFAULT NULL,
  `organic_matter` decimal(4,2) DEFAULT NULL,
  `nitrogen` decimal(10,2) DEFAULT NULL,
  `Phosphorus` decimal(10,2) DEFAULT NULL,
  `Potassium` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `varieties`
--

CREATE TABLE `varieties` (
  `variety_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `origin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `weather_id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `temperature` decimal(4,2) DEFAULT NULL,
  `humidity` decimal(4,2) DEFAULT NULL,
  `rainfall` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yield`
--

CREATE TABLE `yield` (
  `yield_id` int(11) NOT NULL,
  `harvesting_id` int(11) DEFAULT NULL,
  `variety_id` int(11) DEFAULT NULL,
  `Ffield_id` int(11) DEFAULT NULL,
  `yield` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD PRIMARY KEY (`fertilizer_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `genetic_data`
--
ALTER TABLE `genetic_data`
  ADD PRIMARY KEY (`genetic_id`),
  ADD KEY `variety_id` (`variety_id`);

--
-- Indexes for table `growth_measurements`
--
ALTER TABLE `growth_measurements`
  ADD PRIMARY KEY (`Measurement_id`),
  ADD KEY `planting_id` (`planting_id`);

--
-- Indexes for table `harvesting`
--
ALTER TABLE `harvesting`
  ADD PRIMARY KEY (`harvesting_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `variety_id` (`variety_id`);

--
-- Indexes for table `irrigation`
--
ALTER TABLE `irrigation`
  ADD PRIMARY KEY (`irrigation_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `pesticides`
--
ALTER TABLE `pesticides`
  ADD PRIMARY KEY (`pesticide_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `planting`
--
ALTER TABLE `planting`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `variety_id` (`variety_id`);

--
-- Indexes for table `soil_samples`
--
ALTER TABLE `soil_samples`
  ADD PRIMARY KEY (`sample_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `varieties`
--
ALTER TABLE `varieties`
  ADD PRIMARY KEY (`variety_id`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`weather_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `yield`
--
ALTER TABLE `yield`
  ADD PRIMARY KEY (`yield_id`),
  ADD KEY `harvesting_id` (`harvesting_id`),
  ADD KEY `variety_id` (`variety_id`),
  ADD KEY `Ffield_id` (`Ffield_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fertilizers`
--
ALTER TABLE `fertilizers`
  MODIFY `fertilizer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genetic_data`
--
ALTER TABLE `genetic_data`
  MODIFY `genetic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `growth_measurements`
--
ALTER TABLE `growth_measurements`
  MODIFY `Measurement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `harvesting`
--
ALTER TABLE `harvesting`
  MODIFY `harvesting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `irrigation`
--
ALTER TABLE `irrigation`
  MODIFY `irrigation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesticides`
--
ALTER TABLE `pesticides`
  MODIFY `pesticide_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planting`
--
ALTER TABLE `planting`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soil_samples`
--
ALTER TABLE `soil_samples`
  MODIFY `sample_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `varieties`
--
ALTER TABLE `varieties`
  MODIFY `variety_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weather`
--
ALTER TABLE `weather`
  MODIFY `weather_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yield`
--
ALTER TABLE `yield`
  MODIFY `yield_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD CONSTRAINT `fertilizers_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`);

--
-- Constraints for table `genetic_data`
--
ALTER TABLE `genetic_data`
  ADD CONSTRAINT `genetic_data_ibfk_1` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`variety_id`);

--
-- Constraints for table `growth_measurements`
--
ALTER TABLE `growth_measurements`
  ADD CONSTRAINT `growth_measurements_ibfk_1` FOREIGN KEY (`planting_id`) REFERENCES `planting` (`p_id`);

--
-- Constraints for table `harvesting`
--
ALTER TABLE `harvesting`
  ADD CONSTRAINT `harvesting_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`),
  ADD CONSTRAINT `harvesting_ibfk_2` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`variety_id`);

--
-- Constraints for table `irrigation`
--
ALTER TABLE `irrigation`
  ADD CONSTRAINT `irrigation_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`);

--
-- Constraints for table `pesticides`
--
ALTER TABLE `pesticides`
  ADD CONSTRAINT `pesticides_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`);

--
-- Constraints for table `planting`
--
ALTER TABLE `planting`
  ADD CONSTRAINT `planting_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`),
  ADD CONSTRAINT `planting_ibfk_2` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`variety_id`);

--
-- Constraints for table `soil_samples`
--
ALTER TABLE `soil_samples`
  ADD CONSTRAINT `soil_samples_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`);

--
-- Constraints for table `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`);

--
-- Constraints for table `yield`
--
ALTER TABLE `yield`
  ADD CONSTRAINT `yield_ibfk_1` FOREIGN KEY (`harvesting_id`) REFERENCES `harvesting` (`harvesting_id`),
  ADD CONSTRAINT `yield_ibfk_2` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`variety_id`),
  ADD CONSTRAINT `yield_ibfk_3` FOREIGN KEY (`Ffield_id`) REFERENCES `fields` (`field_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
