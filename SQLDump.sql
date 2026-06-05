-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2026 at 04:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
DROP DATABASE IF EXISTS `WinterOlympics`;
CREATE DATABASE `WinterOlympics`;
USE `WinterOlympics`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WinterOlympics`
--

-- --------------------------------------------------------

--
-- Table structure for table `Accommodation`
--

CREATE TABLE `Accommodation` (
  `AccommodationID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `DistanceToVenue` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Accommodation`
--

INSERT INTO `Accommodation` (`AccommodationID`, `Name`, `Location`, `Capacity`, `DistanceToVenue`) VALUES
(1, 'Alpine Village', 'Milan', 300, 2.50),
(2, 'Snow Peak Lodge', 'Cortina', 250, 4.20),
(3, 'Ice Crest Residence', 'Verona', 280, 3.10),
(4, 'Nordic Base Camp', 'Turin', 320, 5.00),
(5, 'Glacier Suites', 'Bolzano', 260, 1.80),
(6, 'Summit Residence', 'Trento', 290, 2.90),
(7, 'Frost Haven', 'Bormio', 240, 3.70);

-- --------------------------------------------------------

--
-- Table structure for table `Assigned_To`
--

CREATE TABLE `Assigned_To` (
  `OfficialID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Assigned_To`
--

INSERT INTO `Assigned_To` (`OfficialID`, `EventID`) VALUES
(1, 1),
(1, 4),
(1, 8),
(2, 2),
(2, 5),
(2, 7),
(3, 1),
(3, 3),
(3, 7),
(4, 3),
(4, 6),
(4, 10),
(5, 4),
(5, 9),
(6, 5),
(6, 6),
(6, 9),
(7, 2),
(7, 8),
(7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Athlete`
--

CREATE TABLE `Athlete` (
  `AthleteID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Height` decimal(5,2) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `DateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Athlete`
--

INSERT INTO `Athlete` (`AthleteID`, `Name`, `Gender`, `Height`, `Weight`, `DateOfBirth`) VALUES
(1, 'Luca Bianchi', 'Male', 180.50, 75.00, '2000-05-12'),
(2, 'Emma Rossi', 'Female', 168.20, 58.00, '2001-08-19'),
(3, 'Noah Martin', 'Male', 185.40, 80.00, '1999-11-03'),
(4, 'Sofia Andersson', 'Female', 170.00, 60.50, '2002-01-25'),
(5, 'Elias Novak', 'Male', 178.30, 72.40, '2000-07-17'),
(6, 'Mia Schmidt', 'Female', 165.70, 55.20, '2001-03-29'),
(7, 'Leo Dubois', 'Male', 182.10, 77.80, '1998-09-14'),
(8, 'Hanna Olsen', 'Female', 169.40, 59.10, '2002-06-08'),
(9, 'Daniel Petrov', 'Male', 187.00, 82.00, '1999-12-21'),
(10, 'Olivia Jensen', 'Female', 167.90, 57.60, '2001-10-11'),
(11, 'Matteo Ricci', 'Male', 181.20, 76.30, '2000-02-18'),
(12, 'Ava Karlsson', 'Female', 171.50, 61.40, '2001-12-04'),
(13, 'Jonas Berg', 'Male', 184.60, 79.20, '1998-04-27'),
(14, 'Chloe Moreau', 'Female', 166.30, 56.70, '2002-09-09'),
(15, 'Erik Lund', 'Male', 179.80, 74.50, '1999-06-30'),
(16, 'Nora Eriksen', 'Female', 168.80, 58.90, '2000-11-16'),
(17, 'Samuel Costa', 'Male', 183.00, 78.10, '1997-07-22'),
(18, 'Isla Novak', 'Female', 164.90, 54.80, '2003-01-14'),
(19, 'Tobias Muller', 'Male', 186.20, 81.50, '1998-08-03'),
(20, 'Elena Fischer', 'Female', 170.90, 60.10, '2001-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `Belongs_To`
--

CREATE TABLE `Belongs_To` (
  `AthleteID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Belongs_To`
--

INSERT INTO `Belongs_To` (`AthleteID`, `TeamID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 8),
(3, 3),
(3, 4),
(4, 4),
(4, 9),
(5, 5),
(5, 10),
(6, 3),
(6, 8),
(7, 6),
(7, 10),
(8, 5),
(8, 9),
(9, 7),
(9, 10),
(10, 6),
(10, 10),
(11, 1),
(11, 8),
(12, 2),
(12, 7),
(13, 3),
(13, 9),
(14, 4),
(14, 6),
(15, 5),
(15, 7),
(16, 6),
(16, 7),
(17, 1),
(17, 9),
(18, 2),
(18, 5),
(19, 3),
(19, 8),
(20, 2),
(20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Coach`
--

CREATE TABLE `Coach` (
  `CoachID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Speciality` varchar(100) NOT NULL,
  `Certification` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Coach`
--

INSERT INTO `Coach` (`CoachID`, `Name`, `Speciality`, `Certification`) VALUES
(1, 'Marco Conti', 'Ski Jumping', 'Level A'),
(2, 'Anna Muller', 'Ice Hockey', 'Level B'),
(3, 'Peter Hansen', 'Curling', 'Level A'),
(4, 'Elena Petrova', 'Figure Skating', 'Level A'),
(5, 'Jonas Eriksen', 'Biathlon', 'Level C'),
(6, 'Laura Romano', 'Ski Jumping', 'Level B'),
(7, 'David Larsson', 'Ice Hockey', 'Level A');

-- --------------------------------------------------------

--
-- Table structure for table `Covers`
--

CREATE TABLE `Covers` (
  `OutletID` int(11) NOT NULL,
  `SportID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Covers`
--

INSERT INTO `Covers` (`OutletID`, `SportID`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 4),
(2, 6),
(3, 2),
(3, 3),
(4, 2),
(4, 5),
(5, 1),
(5, 4),
(6, 3),
(6, 6),
(7, 1),
(7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Delegation`
--

CREATE TABLE `Delegation` (
  `DelegationID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `CountryCode` char(3) NOT NULL,
  `TotalAthletes` int(11) NOT NULL,
  `AccommodationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Delegation`
--

INSERT INTO `Delegation` (`DelegationID`, `Name`, `CountryCode`, `TotalAthletes`, `AccommodationID`) VALUES
(1, 'Italy Delegation', 'ITA', 12, 1),
(2, 'Germany Delegation', 'GER', 10, 2),
(3, 'Sweden Delegation', 'SWE', 8, 3),
(4, 'France Delegation', 'FRA', 10, 4),
(5, 'Norway Delegation', 'NOR', 12, 5),
(6, 'Austria Delegation', 'AUT', 8, 1),
(7, 'Canada Delegation', 'CAN', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Media_Outlet`
--

CREATE TABLE `Media_Outlet` (
  `OutletID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Reach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Media_Outlet`
--

INSERT INTO `Media_Outlet` (`OutletID`, `Name`, `Country`, `Type`, `Reach`) VALUES
(1, 'Eurosport', 'France', 'TV', 5000000),
(2, 'BBC Sport', 'United Kingdom', 'TV', 4500000),
(3, 'Sky Italia', 'Italy', 'TV', 3200000),
(4, 'NBC Sports', 'USA', 'TV', 6000000),
(5, 'Olympic Daily', 'Switzerland', 'Online', 2100000),
(6, 'SportNet', 'Canada', 'Online', 1800000),
(7, 'Nordic News', 'Norway', 'TV', 2600000);

-- --------------------------------------------------------

--
-- Table structure for table `Official`
--

CREATE TABLE `Official` (
  `OfficialID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `CertificationLevel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Official`
--

INSERT INTO `Official` (`OfficialID`, `Name`, `Role`, `CertificationLevel`) VALUES
(1, 'Giuseppe Romano', 'Referee', 'Gold'),
(2, 'Laura Nilsen', 'Judge', 'Silver'),
(3, 'Thomas Weber', 'Technical Official', 'Gold'),
(4, 'Sara Kovac', 'Timekeeper', 'Bronze'),
(5, 'Ivan Dimitrov', 'Match Commissioner', 'Silver'),
(6, 'Marta Svensson', 'Referee', 'Gold'),
(7, 'Alex Moretti', 'Judge', 'Bronze');

-- --------------------------------------------------------

--
-- Table structure for table `OlympicEvent`
--

CREATE TABLE `OlympicEvent` (
  `EventID` int(11) NOT NULL,
  `TimeOfEvent` time NOT NULL,
  `DateOfEvent` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `SportID` int(11) NOT NULL,
  `VenueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OlympicEvent`
--

INSERT INTO `OlympicEvent` (`EventID`, `TimeOfEvent`, `DateOfEvent`, `Status`, `Gender`, `SportID`, `VenueID`) VALUES
(1, '10:00:00', '2026-02-06', 'Scheduled', 'Male', 1, 2),
(2, '14:00:00', '2026-02-07', 'Scheduled', 'Female', 4, 4),
(3, '16:30:00', '2026-02-08', 'Completed', 'Mixed', 3, 3),
(4, '19:00:00', '2026-02-09', 'Scheduled', 'Male', 2, 1),
(5, '11:15:00', '2026-02-10', 'Completed', 'Female', 5, 5),
(6, '13:45:00', '2026-02-11', 'Scheduled', 'Male', 1, 2),
(7, '15:00:00', '2026-02-12', 'Completed', 'Female', 6, 6),
(8, '17:20:00', '2026-02-13', 'Cancelled', 'Mixed', 2, 1),
(9, '09:30:00', '2026-02-14', 'Completed', 'Male', 5, 7),
(10, '12:10:00', '2026-02-15', 'Scheduled', 'Female', 3, 3);



--
-- Table structure for table `Participates_In`
--

CREATE TABLE `Participates_In` (
  `TeamID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Participates_In`
--

INSERT INTO `Participates_In` (`TeamID`, `EventID`) VALUES
(1, 1),
(1, 3),
(1, 6),
(1, 9),
(2, 1),
(2, 2),
(2, 6),
(2, 7),
(3, 3),
(3, 4),
(3, 8),
(3, 9),
(4, 4),
(4, 7),
(4, 8),
(5, 3),
(5, 9),
(5, 10),
(6, 2),
(6, 3),
(6, 7),
(6, 10),
(7, 5),
(7, 9),
(8, 2),
(8, 5),
(8, 7),
(8, 10),
(9, 1),
(9, 5),
(9, 6),
(10, 4),
(10, 5),
(10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Result`
--

CREATE TABLE `Result` (
  `ResultID` int(11) NOT NULL,
  `Scores` decimal(8,2) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Medal` varchar(20) NOT NULL,
  `EventID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Result`
--

INSERT INTO `Result` (`ResultID`, `Scores`, `Rank`, `Medal`, `EventID`, `TeamID`) VALUES
(1, 95.50, 1, 'Gold', 3, 1),
(2, 91.20, 2, 'Silver', 3, 3),
(3, 88.70, 3, 'Bronze', 3, 5),
(4, 84.10, 4, 'None', 3, 6),
(5, 97.10, 1, 'Gold', 5, 7),
(6, 93.60, 2, 'Silver', 5, 8),
(7, 89.40, 3, 'Bronze', 5, 9),
(8, 85.00, 4, 'None', 5, 10),
(9, 98.20, 1, 'Gold', 7, 2),
(10, 94.30, 2, 'Silver', 7, 4),
(11, 90.80, 3, 'Bronze', 7, 6),
(12, 86.90, 4, 'None', 7, 8),
(13, 99.10, 1, 'Gold', 9, 7),
(14, 95.40, 2, 'Silver', 9, 5),
(15, 91.60, 3, 'Bronze', 9, 3),
(16, 87.20, 4, 'None', 9, 1),
(17278, 98.00, 1, 'Gold', 3, 17034);


--
-- Table structure for table `Sponsor`
--

CREATE TABLE `Sponsor` (
  `SponsorID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Tier` varchar(50) NOT NULL,
  `Contribution` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sponsor`
--

INSERT INTO `Sponsor` (`SponsorID`, `Name`, `Tier`, `Contribution`) VALUES
(1, 'Adidas', 'Gold', 500000.00),
(2, 'Coca-Cola', 'Gold', 650000.00),
(3, 'Samsung', 'Silver', 400000.00),
(4, 'Toyota', 'Silver', 350000.00),
(5, 'Visa', 'Bronze', 250000.00),
(6, 'Puma', 'Bronze', 200000.00),
(7, 'Rolex', 'Gold', 700000.00);



--
-- Table structure for table `Sponsored_By`
--

CREATE TABLE `Sponsored_By` (
  `SponsorID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sponsored_By`
--

INSERT INTO `Sponsored_By` (`SponsorID`, `EventID`) VALUES
(1, 1),
(1, 6),
(1, 9),
(2, 2),
(2, 4),
(2, 8),
(3, 3),
(3, 6),
(3, 10),
(4, 4),
(4, 7),
(4, 10),
(5, 2),
(5, 5),
(5, 8),
(6, 3),
(6, 7),
(7, 1),
(7, 5),
(7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Sport`
--

CREATE TABLE `Sport` (
  `SportID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `GoverningBody` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sport`
--

INSERT INTO `Sport` (`SportID`, `Name`, `GoverningBody`) VALUES
(1, 'Ski Jumping', 'FIS'),
(2, 'Ice Hockey', 'IIHF'),
(3, 'Curling', 'WCF'),
(4, 'Figure Skating', 'ISU'),
(5, 'Biathlon', 'IBU'),
(6, 'Speed Skating', 'ISU');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `TeamID` int(11) NOT NULL,
  `NumberOfAthletes` int(11) NOT NULL,
  `DelegationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`TeamID`, `NumberOfAthletes`, `DelegationID`) VALUES
(1, 4, 1),
(2, 4, 1),
(3, 4, 2),
(4, 4, 2),
(5, 4, 3),
(6, 4, 4),
(7, 4, 5),
(8, 4, 5),
(9, 4, 6),
(10, 4, 7),
(17034, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Trained_By`
--

CREATE TABLE `Trained_By` (
  `CoachID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Trained_By`
--

INSERT INTO `Trained_By` (`CoachID`, `TeamID`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 10),
(4, 2),
(4, 6),
(5, 7),
(5, 8),
(6, 1),
(6, 9),
(7, 3),
(7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Venue`
--

CREATE TABLE `Venue` (
  `VenueID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Venue`
--

INSERT INTO `Venue` (`VenueID`, `Name`, `Location`, `Capacity`) VALUES
(1, 'Milan Ice Arena', 'Milan', 15000),
(2, 'Cortina Snow Stadium', 'Cortina', 12000),
(3, 'Verona Curling Hall', 'Verona', 8000),
(4, 'Turin Skate Center', 'Turin', 10000),
(5, 'Bolzano Nordic Park', 'Bolzano', 11000),
(6, 'Trento Ice Dome', 'Trento', 9000),
(7, 'Bormio Alpine Track', 'Bormio', 13000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Accommodation`
--
ALTER TABLE `Accommodation`
  ADD PRIMARY KEY (`AccommodationID`);

--
-- Indexes for table `Assigned_To`
--
ALTER TABLE `Assigned_To`
  ADD PRIMARY KEY (`OfficialID`,`EventID`),
  ADD KEY `EventID` (`EventID`);

--
-- Indexes for table `Athlete`
--
ALTER TABLE `Athlete`
  ADD PRIMARY KEY (`AthleteID`);

--
-- Indexes for table `Belongs_To`
--
ALTER TABLE `Belongs_To`
  ADD PRIMARY KEY (`AthleteID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `Coach`
--
ALTER TABLE `Coach`
  ADD PRIMARY KEY (`CoachID`);

--
-- Indexes for table `Covers`
--
ALTER TABLE `Covers`
  ADD PRIMARY KEY (`OutletID`,`SportID`),
  ADD KEY `SportID` (`SportID`);

--
-- Indexes for table `Delegation`
--
ALTER TABLE `Delegation`
  ADD PRIMARY KEY (`DelegationID`),
  ADD KEY `AccommodationID` (`AccommodationID`);

--
-- Indexes for table `Media_Outlet`
--
ALTER TABLE `Media_Outlet`
  ADD PRIMARY KEY (`OutletID`);

--
-- Indexes for table `Official`
--
ALTER TABLE `Official`
  ADD PRIMARY KEY (`OfficialID`);

--
-- Indexes for table `OlympicEvent`
--
ALTER TABLE `OlympicEvent`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `SportID` (`SportID`),
  ADD KEY `VenueID` (`VenueID`);

--
-- Indexes for table `Participates_In`
--
ALTER TABLE `Participates_In`
  ADD PRIMARY KEY (`TeamID`,`EventID`),
  ADD KEY `EventID` (`EventID`);

--
-- Indexes for table `Result`
--
ALTER TABLE `Result`
  ADD PRIMARY KEY (`ResultID`),
  ADD UNIQUE KEY `EventID` (`EventID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `Sponsor`
--
ALTER TABLE `Sponsor`
  ADD PRIMARY KEY (`SponsorID`);

--
-- Indexes for table `Sponsored_By`
--
ALTER TABLE `Sponsored_By`
  ADD PRIMARY KEY (`SponsorID`,`EventID`),
  ADD KEY `EventID` (`EventID`);

--
-- Indexes for table `Sport`
--
ALTER TABLE `Sport`
  ADD PRIMARY KEY (`SportID`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`TeamID`),
  ADD KEY `DelegationID` (`DelegationID`);

--
-- Indexes for table `Trained_By`
--
ALTER TABLE `Trained_By`
  ADD PRIMARY KEY (`CoachID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `Venue`
--
ALTER TABLE `Venue`
  ADD PRIMARY KEY (`VenueID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assigned_To`
--
ALTER TABLE `Assigned_To`
  ADD CONSTRAINT `assigned_to_ibfk_1` FOREIGN KEY (`OfficialID`) REFERENCES `Official` (`OfficialID`),
  ADD CONSTRAINT `assigned_to_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `OlympicEvent` (`EventID`);

--
-- Constraints for table `Belongs_To`
--
ALTER TABLE `Belongs_To`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `Athlete` (`AthleteID`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

--
-- Constraints for table `Covers`
--
ALTER TABLE `Covers`
  ADD CONSTRAINT `covers_ibfk_1` FOREIGN KEY (`OutletID`) REFERENCES `Media_Outlet` (`OutletID`),
  ADD CONSTRAINT `covers_ibfk_2` FOREIGN KEY (`SportID`) REFERENCES `Sport` (`SportID`);

--
-- Constraints for table `Delegation`
--
ALTER TABLE `Delegation`
  ADD CONSTRAINT `delegation_ibfk_1` FOREIGN KEY (`AccommodationID`) REFERENCES `Accommodation` (`AccommodationID`);

--
-- Constraints for table `OlympicEvent`
--
ALTER TABLE `OlympicEvent`
  ADD CONSTRAINT `olympicevent_ibfk_1` FOREIGN KEY (`SportID`) REFERENCES `Sport` (`SportID`),
  ADD CONSTRAINT `olympicevent_ibfk_2` FOREIGN KEY (`VenueID`) REFERENCES `Venue` (`VenueID`);

--
-- Constraints for table `Participates_In`
--
ALTER TABLE `Participates_In`
  ADD CONSTRAINT `participates_in_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`),
  ADD CONSTRAINT `participates_in_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `OlympicEvent` (`EventID`);

--
-- Constraints for table `Result`
--
ALTER TABLE `Result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `OlympicEvent` (`EventID`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);

--
-- Constraints for table `Sponsored_By`
--
ALTER TABLE `Sponsored_By`
  ADD CONSTRAINT `sponsored_by_ibfk_1` FOREIGN KEY (`SponsorID`) REFERENCES `Sponsor` (`SponsorID`),
  ADD CONSTRAINT `sponsored_by_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `OlympicEvent` (`EventID`);

--
-- Constraints for table `Team`
--
ALTER TABLE `Team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`DelegationID`) REFERENCES `Delegation` (`DelegationID`);

--
-- Constraints for table `Trained_By`
--
ALTER TABLE `Trained_By`
  ADD CONSTRAINT `trained_by_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `Coach` (`CoachID`),
  ADD CONSTRAINT `trained_by_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `Team` (`TeamID`);
  
-- -----------------------------------------------------
-- Phase 4 Trigger 1: Validate Sponsor Contribution
-- Responsible Member: Abdallah Al Homsi
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `validate_sponsor_contribution`;

DELIMITER $$

CREATE TRIGGER `validate_sponsor_contribution`
BEFORE INSERT ON `Sponsor`
FOR EACH ROW
BEGIN
    IF NEW.Contribution < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sponsor contribution cannot be negative.';
    ELSEIF NEW.Contribution < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sponsor contribution must be at least 10,000.';
    END IF;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Phase 4 Trigger 2: Prevent Invalid Venue Scheduling
-- Responsible Member: Rand MO Khaled
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `prevent_invalid_venue_scheduling`;

DELIMITER $$

CREATE TRIGGER `prevent_invalid_venue_scheduling`
BEFORE INSERT ON `OlympicEvent`
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Cancelled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cancelled events cannot be newly scheduled in a venue.';

    ELSEIF EXISTS (
        SELECT 1
        FROM `OlympicEvent`
        WHERE VenueID = NEW.VenueID
          AND DateOfEvent = NEW.DateOfEvent
          AND TimeOfEvent = NEW.TimeOfEvent
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This venue is already booked at the selected date and time.';
    END IF;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Phase 4 Trigger 3: Validate Medal Assignment
-- Responsible Member: Syeda Manaal Amir
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `validate_medal_assignment`;

DELIMITER $$

CREATE TRIGGER `validate_medal_assignment`
BEFORE INSERT ON `Result`
FOR EACH ROW
BEGIN
    IF NEW.`Rank` = 1 AND NEW.Medal <> 'Gold' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rank 1 must receive Gold medal.';

    ELSEIF NEW.`Rank` = 2 AND NEW.Medal <> 'Silver' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rank 2 must receive Silver medal.';

    ELSEIF NEW.`Rank` = 3 AND NEW.Medal <> 'Bronze' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rank 3 must receive Bronze medal.';

    ELSEIF NEW.`Rank` > 3 AND NEW.Medal IN ('Gold', 'Silver', 'Bronze') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ranks greater than 3 cannot receive Olympic medals.';
    END IF;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Phase 4 Stored Procedure 1: Filter Sponsors by Contribution Range and Tier
-- Responsible Member: Abdallah Al Homsi
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `GetSponsorsAboveContribution`;

DELIMITER $$

CREATE PROCEDURE `GetSponsorsAboveContribution`(
    IN minContribution DECIMAL(12,2),
    IN maxContribution DECIMAL(12,2),
    IN inputTier VARCHAR(50)
)
BEGIN
    SELECT SponsorID, Name, Tier, Contribution
    FROM `Sponsor`
    WHERE Contribution >= minContribution
      AND Contribution <= maxContribution
      AND Tier = inputTier
    ORDER BY Contribution DESC;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Phase 4 Stored Procedure 2: Get Venue Schedule by Date Range
-- Responsible Member: Rand MO Khaled
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `GetVenueSchedule`;

DELIMITER $$

CREATE PROCEDURE `GetVenueSchedule`(
    IN inputVenueID INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT 
        E.EventID,
        E.DateOfEvent,
        E.TimeOfEvent,
        E.Status,
        E.Gender,
        S.Name AS SportName,
        V.Name AS VenueName,
        V.Location
    FROM `OlympicEvent` E
    INNER JOIN `Sport` S 
        ON E.SportID = S.SportID
    INNER JOIN `Venue` V 
        ON E.VenueID = V.VenueID
    WHERE E.VenueID = inputVenueID
      AND E.DateOfEvent BETWEEN startDate AND endDate
    ORDER BY E.DateOfEvent ASC, E.TimeOfEvent ASC;
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Phase 4 Stored Procedure 3: Delegation Performance Summary by Date Range
-- Responsible Member: Syeda Manaal Amir
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS `GetDelegationPerformanceSummary`;

DELIMITER $$

CREATE PROCEDURE `GetDelegationPerformanceSummary`(
    IN inputDelegationID INT,
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT 
        D.Name AS DelegationName,
        D.CountryCode AS CountryCode,
        COUNT(DISTINCT T.TeamID) AS TotalTeams,

        COALESCE(SUM(CASE WHEN R.Medal = 'Gold' THEN 1 ELSE 0 END), 0) AS GoldMedals,
        COALESCE(SUM(CASE WHEN R.Medal = 'Silver' THEN 1 ELSE 0 END), 0) AS SilverMedals,
        COALESCE(SUM(CASE WHEN R.Medal = 'Bronze' THEN 1 ELSE 0 END), 0) AS BronzeMedals,
        COALESCE(SUM(CASE WHEN R.Medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE 0 END), 0) AS TotalMedals,

        COALESCE(ROUND(AVG(R.Scores), 2), 0) AS AverageScore,
        COALESCE(MIN(R.`Rank`), 0) AS BestRank

    FROM `Delegation` D
    LEFT JOIN `Team` T 
        ON D.DelegationID = T.DelegationID
    LEFT JOIN `Result` R 
        ON T.TeamID = R.TeamID
    LEFT JOIN `OlympicEvent` E
        ON R.EventID = E.EventID

    WHERE D.DelegationID = inputDelegationID
      AND E.DateOfEvent BETWEEN startDate AND endDate

    GROUP BY D.DelegationID, D.Name, D.CountryCode;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
