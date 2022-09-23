-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 11:57 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

$conn = mysqli_connect("localhost", "root", "", "bot") or die("chatbot");
$getMesg = mysqli_real_escape_string($conn, $_POST['text']);

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `Student_id` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FciProgramme` int(11) NOT NULL,
  `ApplicationStatus_id` int(11) NOT NULL,
  `Person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applicationstatus`
--

CREATE TABLE `applicationstatus` (
  `ApplicationStatus_id` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `enquire`
--

CREATE TABLE `enquire` (
  `Enquire_id` int(11) NOT NULL,
  `FciProgramme` int(11) NOT NULL,
  `Visitor_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fciprogramme`
--

CREATE TABLE `fciprogramme` (
  `FciProgramme_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Subjects` varchar(255) NOT NULL,
  `Cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedBack_id` int(11) NOT NULL,
  `Enquire_id` int(11) NOT NULL,
  `Admin_id` int(11) NOT NULL,
  `FeedbackStatus` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedbackstatus`
--

CREATE TABLE `feedbackstatus` (
  `FeedbackStatus_id` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `Person_id` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `Visitor_id` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Person_id` (`Person_id`),
  ADD KEY `ApplicationStatus_id` (`ApplicationStatus_id`),
  ADD KEY `FciProgramme` (`FciProgramme`);

--
-- Indexes for table `applicationstatus`
--
ALTER TABLE `applicationstatus`
  ADD PRIMARY KEY (`ApplicationStatus_id`);

--
-- Indexes for table `enquire`
--
ALTER TABLE `enquire`
  ADD PRIMARY KEY (`Enquire_id`),
  ADD KEY `Visitor_id` (`Visitor_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `FciProgramme` (`FciProgramme`);

--
-- Indexes for table `fciprogramme`
--
ALTER TABLE `fciprogramme`
  ADD PRIMARY KEY (`FciProgramme_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedBack_id`),
  ADD KEY `FeedbackStatus` (`FeedbackStatus`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Enquire_id` (`Enquire_id`);

--
-- Indexes for table `feedbackstatus`
--
ALTER TABLE `feedbackstatus`
  ADD PRIMARY KEY (`FeedbackStatus_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Person_id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`Visitor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
