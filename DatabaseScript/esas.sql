-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2016 at 07:11 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;



-- --------------------------------------------------------

--
-- Table structure for table `block`
--


create database esas;
use esas;

CREATE TABLE IF NOT EXISTS `block` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `block_room_id` varchar(255) NOT NULL,
  `block_name` varchar(255) NOT NULL,
  `block_description` varchar(255) NOT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`block_id`, `block_room_id`, `block_name`, `block_description`) VALUES
(1, '1', 'Block A', 'Block A of Room 1'),
(2, '1', 'Block B', 'Block B of Room 1'),
(3, '1', 'Block C', 'Block C of Room 1');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chenai'),
(4, 'Banglore'),
(5, 'Varanasi'),
(6, 'Kolkatta');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_total_semestor` varchar(255) NOT NULL,
  `course_description` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_total_semestor`, `course_description`) VALUES
(1, 'DCST', '6', 'Diploma in Computer Science and Technology'),
(3, 'BCA', '6', 'Bachlore in Computer Application'),
(4, 'MCA', '6', 'Master in Computer Application'),
(5, 'PGDCA', '2', 'Post Graducate Diploma in Compter Application');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'IT Department'),
(2, 'Java Developement'),
(3, 'HR Department'),
(4, 'Web Developement');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_manager_id` varchar(255) NOT NULL,
  `employee_role` varchar(255) NOT NULL,
  `employee_sal` varchar(100) NOT NULL,
  `employee_first_name` varchar(100) NOT NULL,
  `employee_middle_name` varchar(100) NOT NULL,
  `employee_last_name` varchar(100) NOT NULL,
  `employee_gender` varchar(100) NOT NULL,
  `employee_address` varchar(100) NOT NULL,
  `employee_village` varchar(100) NOT NULL,
  `employee_state` varchar(100) NOT NULL,
  `employee_country` varchar(100) NOT NULL,
  `employee_landline` varchar(100) NOT NULL,
  `employee_mobile` varchar(100) NOT NULL,
  `employee_email` varchar(100) NOT NULL,
  `employee_status` varchar(255) NOT NULL,
  `employee_deparment` varchar(255) NOT NULL,
  `employee_dob` varchar(255) NOT NULL,
  `employee_nationalty` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1022 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_manager_id`, `employee_role`, `employee_sal`, `employee_first_name`, `employee_middle_name`, `employee_last_name`, `employee_gender`, `employee_address`, `employee_village`, `employee_state`, `employee_country`, `employee_landline`, `employee_mobile`, `employee_email`, `employee_status`, `employee_deparment`, `employee_dob`, `employee_nationalty`) VALUES
(1001, '0', '1', '1', 'Amit', 'Kumar', 'Singh', 'Male', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'kaushal@gmail.com', '2', '1', '12 January, 2014', 'Indian'),
(1002, '1001', '2', '2', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kaushal.rahuljaiswal@gmail.com', '1', '3', '7 July,1988', 'Indian'),
(1003, '1001', '3', '2', 'Rahul', 'Kumar', 'Shukla', 'Male', 'Allahabad', 'Allahabad', '1', '1', '01234567789', '987654321', 'kaushal@yahoo.com', '1', '2', '14 October,2015', 'Indian'),
(1020, '1001', '3', '2', 'Atul', 'Kumar', 'Verma', 'Female', 'Allahabad', 'Allahabad', '2', '1', '01234567789', '987654321', 'kaushal@rediffmail.com', '1', '1', '7 October,2015', 'Indian'),
(1021, '1002', '3', '2', 'Swati', 'Kumar', 'Sinha', 'Female', 'Allahabad', 'Allahabad', '2', '2', '01234567789', '987654321', 'swati@yahoo.com', '1', '2', '14 October,2015', 'Indian');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE IF NOT EXISTS `floor` (
  `floor_id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_name` varchar(255) NOT NULL,
  `floor_description` varchar(255) NOT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floor_id`, `floor_name`, `floor_description`) VALUES
(1, 'Floor 1', 'Floor 1st on bulding 1'),
(2, 'Floor 2', 'Floor 2 of Buliding 1'),
(3, 'Floor 3', 'Floor 2 of Building 1'),
(4, 'Ground Floor', 'Ground Floor of building 1');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 1001, 'admin', 'test', 1, 'kaushal.rahuljaiswal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(100) NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_title` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_title`) VALUES
(1, 'Adminstrator'),
(2, 'Faculty'),
(3, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_floor_id` varchar(255) NOT NULL,
  `room_user_id` varchar(255) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `room_description` varchar(255) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_floor_id`, `room_user_id`, `room_name`, `room_description`) VALUES
(1, '1', '1002', 'Room 101', 'Room 101 of First Floor'),
(2, '1', '1001', 'Room 102', 'Room 102 of First Floor'),
(3, '1', '1020', 'Room 103', 'Room 103 of First Floor'),
(4, '2', '1021', 'Room 201', 'Room 201'),
(5, '2', '1002', 'Room 202', 'Room 202');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE IF NOT EXISTS `salutions` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE IF NOT EXISTS `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_block_id` varchar(255) NOT NULL,
  `seat_number` varchar(255) NOT NULL,
  `seat_description` varchar(255) NOT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `seat_block_id`, `seat_number`, `seat_description`) VALUES
(1, '1', 'Seat 1', 'Seat 1 of Block A'),
(2, '1', 'Seat 2', 'Seat 2 of Block A'),
(3, '1', 'Seat 3', 'Seat 3 of Block A'),
(4, '1', 'Seat 4', 'Seat 4 of Block A'),
(5, '1', 'Seat 5', 'Seat 5 of Block A'),
(6, '1', 'Seat 6', 'Seat 6 of Block A'),
(7, '1', 'Seat 7', 'Seat 7 of Block A'),
(8, '1', 'Seat 8', 'Seat 8 of Block A');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_emp_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_grade` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Maharastra'),
(2, 'Gujrat'),
(3, 'Bihar'),
(4, 'Uttar Pradesh'),
(5, 'Delhi'),
(6, 'Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Manager'),
(2, 'Worker'),
(3, 'Intern'),
(4, 'Fresher');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_course_id` varchar(255) NOT NULL,
  `student_rollno` varchar(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_father_name` varchar(255) NOT NULL,
  `student_dob` varchar(255) NOT NULL,
  `student_mobile` varchar(255) NOT NULL,
  `student_details` varchar(500) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_course_id`, `student_rollno`, `student_name`, `student_father_name`, `student_dob`, `student_mobile`, `student_details`) VALUES
(1, '1', '100011', 'Amit Kumar', 'Sumit Kumar', '1 January, 1990', '987654343', 'Details'),
(3, '1', '100012', 'Sunil Singh', 'Anil Singh', '12 January, 1992', '9898786756', 'Sunil Singh'),
(4, '1', '100013', 'Priyanka Jaiswal', 'Dwarika Prashad', '1 March, 1990', '9876786756', 'Priyanka Jaiswal in DCST');

-- --------------------------------------------------------

--
-- Table structure for table `student_seat`
--

CREATE TABLE IF NOT EXISTS `student_seat` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_student_id` varchar(255) NOT NULL,
  `ss_seat_id` varchar(255) NOT NULL,
  `ss_description` varchar(255) NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_seat`
--

INSERT INTO `student_seat` (`ss_id`, `ss_student_id`, `ss_seat_id`, `ss_description`) VALUES
(1, '1', '2', 'Assing to seat'),
(2, '2', '2', 'Assing to seat'),
(3, '3', '8', 'Assign seat to Sunil Singh');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
