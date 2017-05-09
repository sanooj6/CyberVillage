-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2016 at 08:08 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cyberpark`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `sl_no` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) NOT NULL,
  `vac_id` int(3) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`sl_no`, `user_id`, `vac_id`, `status`) VALUES
(1, 1, 2, 'Pending'),
(2, 1, 5, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE IF NOT EXISTS `building` (
  `buil_id` int(3) NOT NULL AUTO_INCREMENT,
  `buil_name` varchar(30) NOT NULL,
  `buil_type` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  `duration` int(3) NOT NULL,
  `status` varchar(15) NOT NULL,
  `work_status` varchar(15) NOT NULL,
  PRIMARY KEY (`buil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`buil_id`, `buil_name`, `buil_type`, `description`, `duration`, `status`, `work_status`) VALUES
(1, 'Galaxy', 'Rent', 'This Building is for Rent', 0, 'Active', 'Not_Working'),
(2, 'Burj Khaleefa', 'Lease', 'Good', 9, 'Active', 'Working'),
(3, 'Empulse', 'Lease', 'as good', 6, 'Active', 'Not_Working'),
(4, 'fgsdg', 'Lease', 'ersr', 0, 'active', 'Not_Working'),
(5, 'New', 'Lease', 'ssssssss', 0, 'active', 'Not_Working'),
(6, 'dsdfdsgssssssssssss', 'Lease', 'dddddddddddddd', 6, 'active', 'Not_Working'),
(7, 'dsdfdsg', 'Rent', '', 0, 'active', 'Not_Working'),
(8, 'North Block', 'Rent', 'new building', 0, 'active', 'Not_Working');

-- --------------------------------------------------------

--
-- Table structure for table `company_reg`
--

CREATE TABLE IF NOT EXISTS `company_reg` (
  `comp_id` int(3) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(30) NOT NULL,
  `manager_name` varchar(15) NOT NULL,
  `headoffice_address` varchar(100) NOT NULL,
  `dept_id` int(3) NOT NULL,
  `acc_bal` int(10) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `website` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `company_reg`
--

INSERT INTO `company_reg` (`comp_id`, `comp_name`, `manager_name`, `headoffice_address`, `dept_id`, `acc_bal`, `bank_name`, `acc_no`, `email`, `phone`, `website`, `status`, `logo`) VALUES
(2, 'IBM', 'Arun', 'Hida Complex\r\nPayyoli', 2, 55000, 'Canara', 'e56gtt5', 'Arun@gmail.com', 121332, 'www.Arun.com', 'Active', 'default.jpg'),
(4, 'Qburst', 'SamAlex', 'Payyoli', 1, 10000, 'SBI', '12WE433', 'qb@gmail.com', 8089094744, 'www.keltron.com', 'Active', 'qb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE IF NOT EXISTS `complaints` (
  `cpl_id` int(3) NOT NULL AUTO_INCREMENT,
  `cpl` varchar(100) NOT NULL,
  `id` int(3) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`cpl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`cpl_id`, `cpl`, `id`, `status`) VALUES
(1, 'There is a prblm', 1, 'Solved'),
(2, 'bad', 1, 'NotSolved');

-- --------------------------------------------------------

--
-- Table structure for table `config_data`
--

CREATE TABLE IF NOT EXISTS `config_data` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `config_data`
--

INSERT INTO `config_data` (`id`, `name`, `value`) VALUES
(1, 'admin_name', 'Athira Vijayan'),
(2, 'admin_pro_pic', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` int(3) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`, `description`, `status`) VALUES
(1, 'Java', 'Java Department', 'Active'),
(2, '.Net', '.net Department', 'Active'),
(3, 'Android', 'AndroidDepartment', 'Active'),
(4, 'Digital Marketing', '', 'Active'),
(5, 'PHP', '', 'Active'),
(6, 'BDO', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `sl_no` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_no` bigint(10) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`sl_no`, `name`, `gender`, `email`, `contact_no`, `feedback`) VALUES
(1, 'Arun', 'Male', 'vfxcvxcv', 454656, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE IF NOT EXISTS `floor` (
  `floor_id` int(3) NOT NULL AUTO_INCREMENT,
  `buil_id` int(3) NOT NULL,
  `floor_name` varchar(15) NOT NULL,
  `description` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floor_id`, `buil_id`, `floor_name`, `description`, `status`) VALUES
(1, 1, '1 St', 'First Floor', 'Active'),
(2, 1, '2nd ', 'Second Floor', 'Active'),
(3, 1, '3rd', 'Third Floor', 'Active'),
(4, 1, '4th', 'Fourth', 'Active'),
(5, 2, '1 St', 'First', 'Active'),
(6, 2, '2nd ', 'Second', 'Active'),
(7, 2, '3rd', 'Third', 'Active'),
(8, 2, '4th', 'Fourth', 'Active'),
(9, 8, '1st Floor', '', 'active'),
(10, 3, '2nd', 'aaaaaaa', 'active'),
(11, 8, '3rd', 'ggg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `lease_company`
--

CREATE TABLE IF NOT EXISTS `lease_company` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `comp_id` int(3) NOT NULL,
  `buil_id` int(3) NOT NULL,
  `date` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lease_company`
--

INSERT INTO `lease_company` (`id`, `comp_id`, `buil_id`, `date`, `status`) VALUES
(1, 2, 2, '27-03-2015', 'Unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `sl_no` int(3) NOT NULL AUTO_INCREMENT,
  `id` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(3) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`sl_no`, `id`, `username`, `password`, `type`, `status`) VALUES
(1, 0, 'admin@gmail.com', 'admin', 1, 'Active'),
(3, 2, 'arun.skynet666@gmail.com', '123', 2, 'Active'),
(8, 4, 'qb@gmail.com', 'qb123', 2, 'Active'),
(9, 1, 'abc@gmail.com', 'abc', 3, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE IF NOT EXISTS `qualification` (
  `qlfn_id` int(2) NOT NULL AUTO_INCREMENT,
  `qlfn` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`qlfn_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `qualification`
--

INSERT INTO `qualification` (`qlfn_id`, `qlfn`, `description`, `status`) VALUES
(1, 'B Tec', 'Bachlor in technologies', 'Active'),
(2, 'Diploma', 'Proffessional Cource', 'Active'),
(3, 'M Tech', 'Master in Technologies', 'Active'),
(4, 'BSC', 'Bsc ComputerScience', 'Active'),
(6, 'BCA', 'Bachlor in Computer Application', 'Active'),
(7, 'MCA', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE IF NOT EXISTS `rent` (
  `squarefeet` int(3) NOT NULL,
  `rent` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`squarefeet`, `rent`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rent_calc`
--

CREATE TABLE IF NOT EXISTS `rent_calc` (
  `rent_calc_id` int(3) NOT NULL AUTO_INCREMENT,
  `comp_id` int(3) NOT NULL,
  `rent` int(10) NOT NULL,
  `date` varchar(30) NOT NULL,
  PRIMARY KEY (`rent_calc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rent_company`
--

CREATE TABLE IF NOT EXISTS `rent_company` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `comp_id` int(3) NOT NULL,
  `room_id` int(3) NOT NULL,
  `date` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rent_company`
--

INSERT INTO `rent_company` (`id`, `comp_id`, `room_id`, `date`, `status`) VALUES
(1, 1, 4, '03-08-2014', 'Unblocked'),
(2, 4, 3, '07-08-2014', 'Unblocked'),
(3, 5, 2, '07-08-2014', 'Unblocked');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(3) NOT NULL AUTO_INCREMENT,
  `floor_id` int(3) NOT NULL,
  `room_name` varchar(30) NOT NULL,
  `squarefeet` int(5) NOT NULL,
  `rent` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `work_status` varchar(15) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `floor_id`, `room_name`, `squarefeet`, `rent`, `status`, `work_status`) VALUES
(1, 0, '1 st', 50, 250, 'Active', 'Not_Working'),
(2, 1, '2nd', 50, 0, 'Active', 'Working'),
(3, 1, '3rd', 50, 0, 'Active', 'Working'),
(4, 2, '1 st', 50, 0, 'Active', 'Working'),
(5, 2, '2', 50, 0, 'Active', 'Not_Working'),
(6, 2, '3rd', 50, 250, 'Active', 'Not_Working'),
(7, 5, '1 st', 50, 250, 'Active', 'Not_Working'),
(8, 5, '2nd', 50, 250, 'Active', 'Not_Working'),
(9, 6, '1 st', 50, 250, 'Active', 'Not_Working'),
(10, 6, '2nd', 50, 250, 'Active', 'Not_Working');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `qlfn` varchar(30) NOT NULL,
  `percentage` int(2) NOT NULL,
  `yop` varchar(10) NOT NULL,
  `board_univrs` varchar(30) NOT NULL,
  `resume` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dist` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `gender`, `dob`, `address`, `phone`, `email`, `qlfn`, `percentage`, `yop`, `board_univrs`, `resume`, `state`, `dist`, `status`) VALUES
(1, 'Antony Mosses', 'Male', '2011-07-03', 'Antony Plaza\r\nPuthoor\r\nVadakara', 1234567890, 'abc@gmail.com', 'Btech', 80, '2014', 'Kerala', 'Mbinnaram malayalam sweat melodyb.mp4', 'Kerala', 'Ernakulam', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vaccancy`
--

CREATE TABLE IF NOT EXISTS `vaccancy` (
  `vac_id` int(2) NOT NULL AUTO_INCREMENT,
  `comp_id` int(2) NOT NULL,
  `post` varchar(20) NOT NULL,
  `qlfn_id` int(3) NOT NULL,
  `percentage` int(2) NOT NULL,
  `dept_id` int(3) NOT NULL,
  `salary` bigint(6) NOT NULL,
  `tot_vacancy` int(5) NOT NULL,
  `doi` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`vac_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vaccancy`
--

INSERT INTO `vaccancy` (`vac_id`, `comp_id`, `post`, `qlfn_id`, `percentage`, `dept_id`, `salary`, `tot_vacancy`, `doi`, `status`) VALUES
(1, 1, 'Java Devoleper', 1, 80, 1, 10000, 7, '2014-06-02', 'Active'),
(2, 1, 'Administrator', 3, 30, 2, 12000, 9, '2014-06-02', 'Active'),
(3, 2, 'Administrator', 1, 90, 3, 20000, 5, '2014-06-16', 'Active'),
(4, 5, 'Java Devoleper', 3, 80, 1, 20000, 6, '2014-07-17', 'Active'),
(5, 1, 'Programer', 2, 67, 3, 20000, 7, '2014-07-26', 'Active'),
(6, 4, 'Developer', 1, 0, 1, 25000, 5, '10/10/2010', 'Active');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
