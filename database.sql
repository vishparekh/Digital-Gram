-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2016 at 05:02 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cfg`
--

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`id`, `dept_name`) VALUES
(1, 'Operator'),
(2, 'Talati'),
(3, 'Mamlatdar');

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `id` int(11) NOT NULL,
  `fid` int(10) NOT NULL,
  `did` int(10) NOT NULL,
  `try` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE IF NOT EXISTS `field` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `formfield`
--

CREATE TABLE IF NOT EXISTS `formfield` (
  `id` int(11) NOT NULL,
  `fid` int(10) NOT NULL,
  `fiid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `formlifecycle`
--

CREATE TABLE IF NOT EXISTS `formlifecycle` (
  `id` int(10) NOT NULL,
  `eid` int(10) NOT NULL,
  `did` int(10) NOT NULL,
  `ui` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE IF NOT EXISTS `tmp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gen` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `fn` varchar(255) NOT NULL,
  `mn` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `Religion` varchar(255) NOT NULL,
  `dname` varchar(255) NOT NULL,
  `dphone` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `addre` varchar(255) DEFAULT NULL,
  `status` int(10) NOT NULL,
  `reje` int(11) DEFAULT NULL,
  `rea` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `doctype` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp`
--

INSERT INTO `tmp` (`id`, `name`, `gen`, `dob`, `place`, `fn`, `mn`, `nationality`, `Religion`, `dname`, `dphone`, `phone`, `addre`, `status`, `reje`, `rea`, `created_at`, `extension`, `doctype`, `updated_at`) VALUES
(4, 'Nilesh', 'Male', 'vygubhj', 'cfgvbhjkml', 'cfghbjkml', 'gfcvbhj', 'kmgc fbhj', 'kmtfcvygbh', 'kmfvygbh', 'kmfvygbh', 'ftcv', 'gbhjnmk,', 5, 4, NULL, '2015-10-28 06:36:26', 'pdf', 'Licenswe', '2015-10-28 07:00:52'),
(5, 'Vishal', 'Male', '30/6/1996', 'Ghatlodia', 'Father', 'Mother', 'Nation', 'Reg', 'Doc', 'Doc', '7567360', 'fghjkjhgfrvgbhjn', 5, NULL, NULL, '2016-02-09 08:50:55', 'txt', 'Frame', '2016-02-09 08:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `unique_id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `did` int(5) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `username`, `password`, `did`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 12, 'nilesh', '$2y$10$iZ1jSjMFvk.kHhDW3U.y0edqEQD.rdnqdklv.pcGM2OMJpI16Dm.y', 3, 'H7l2DjuClkoMijwvAuNsNA3TFzYpigGSEieGGOJYY56DayeBbdwDmWA5FH1c', '', '2016-02-09 08:53:15'),
(2, 123, 'vish', '$2y$10$iZ1jSjMFvk.kHhDW3U.y0edqEQD.rdnqdklv.pcGM2OMJpI16Dm.y', 2, 'ph0pVP3cEpmRZQMHNp8DOo0ap6SEF2xJ6fxlOeQAaGJloQLuPeDhnC9VuYQK', '', '2016-02-09 08:51:41'),
(4, 234, 'kandarp', '$2y$10$iZ1jSjMFvk.kHhDW3U.y0edqEQD.rdnqdklv.pcGM2OMJpI16Dm.y', 3, 'EijLujIQH0tSJfKLjGBAignSi65mKVMDZoeFnTsXDgNp8BszBnfVJluD30Wa', '', '2015-10-28 07:11:17'),
(5, 556, 'arnav', '$2y$10$iZ1jSjMFvk.kHhDW3U.y0edqEQD.rdnqdklv.pcGM2OMJpI16Dm.y', 1, 'XlBM50QFQCWMia1r2OCm2c8D8CHdZoSknVFkKdo1d6qZIAaNgkIqsiqmWvW9', '', '2016-02-09 08:52:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formfield`
--
ALTER TABLE `formfield`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formlifecycle`
--
ALTER TABLE `formlifecycle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `entry`
--
ALTER TABLE `entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `formfield`
--
ALTER TABLE `formfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `formlifecycle`
--
ALTER TABLE `formlifecycle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
