-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2016 at 10:05 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbnb`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Consumer` varchar(40) NOT NULL,
  `Property` varchar(40) NOT NULL,
  `Booking Period` date NOT NULL,
  `Status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Consumer`, `Property`, `Booking Period`, `Status`) VALUES
('Tina Blecher', '123 Ham Crescent', '2016-02-17', 'Rejected'),
('Bob Blecher', '345 Hambridge Blvd', '2016-02-16', 'Confirmed'),
('Linda Blecher', '345 Hambridge Blvd', '2016-02-19', 'Requested'),
('Louise Blecher', '666 Cereal Street', '2016-04-27', 'Confirmed'),
('Gene Blecher', 'Sandor Palace', '2016-02-22', 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `city districts`
--

CREATE TABLE `city districts` (
  `District Name` varchar(40) NOT NULL,
  `POI` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city districts`
--

INSERT INTO `city districts` (`District Name`, `POI`) VALUES
('Arrozona', 'Wine & Cheese Restraunts'),
('eggtobikoe', 'Yolk Square'),
('Hambridge', 'Fries On The Side Slide '),
('hungry', 'Thirsty River'),
('Kitchener ', 'A Fridge'),
('Minnipork', 'pigglet farm'),
('North Yolk', 'South Yolk'),
('South Yolk', 'NorthYolk'),
('Tunasee', 'Tunadoo statue'),
('Watermaloon', 'Watermelon WaterFall');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Member` varchar(40) NOT NULL,
  `Property` varchar(40) NOT NULL,
  `Rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`Member`, `Property`, `Rating`) VALUES
('Ate breakfast with the help', 'Sandor Palace ', 2),
('I prefer North Yolk', '736 Scarmbled Dr', 3),
('Slept like a pig in a blanket ', '123 Crescent ', 4),
('Tony the Tiger was Grrreeeaaatt', '666 Cereal Street', 5),
('Vegetarian special was terrible ', '345 Hambridge Blvd', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rental properties`
--

CREATE TABLE `rental properties` (
  `Supplier` varchar(40) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `District` varchar(40) NOT NULL,
  `Type` varchar(40) NOT NULL,
  `Features` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental properties`
--

INSERT INTO `rental properties` (`Supplier`, `Address`, `District`, `Type`, `Features`, `Price`) VALUES
('Hamburgler', '345 Hambridge Blvd.', 'Hambridge', '3 Bedroom', 'Near Mcdonalds', 120),
('István Dobi', 'Sandor Palace ', 'Hungry', '3 bedrooms, 12 bathrooms, 2 half baths', 'Unlimited wifi', 150000000),
('Jenna Baloney', '123 Ham Crescent', 'Minipork', '2 bedroom', 'beside piglet farm', 87),
('Tony Tiger', '666 Cereal Street', 'Kitchener ', '1 bedroom', 'Near A fridge', 200),
('York Pudding', '736 Scrambled Dr', 'South Yolk', '1 bed room apartment', 'all you can eat egg buffet', 900);

-- --------------------------------------------------------

--
-- Table structure for table `service members`
--

CREATE TABLE `service members` (
  `Email` varchar(40) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Faculty` varchar(10) NOT NULL,
  `Degree Type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service members`
--

INSERT INTO `service members` (`Email`, `Phone_Number`, `Year`, `Faculty`, `Degree Type`) VALUES
('powerpotato2000@email.com', 2059874521, 10, 'Commerce', 'BComm'),
('pudding_underpants@email.com', 1234567891, 15, 'Compsci', 'BCMP'),
('shadowbagel69@email.com', 1056966969, 14, 'Engineer', 'BEng'),
('taco_del_rey@email.com', 1524782369, 12, 'Psych', 'PhD'),
('water_mah_loon@email.com', 2146581234, 4, 'Culinary', 'BSc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Property`,`Booking Period`);

--
-- Indexes for table `city districts`
--
ALTER TABLE `city districts`
  ADD PRIMARY KEY (`District Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Member`,`Property`);

--
-- Indexes for table `rental properties`
--
ALTER TABLE `rental properties`
  ADD PRIMARY KEY (`Supplier`);

--
-- Indexes for table `service members`
--
ALTER TABLE `service members`
  ADD PRIMARY KEY (`Email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
