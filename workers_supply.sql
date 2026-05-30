-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 05:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workers_supply`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add district', 7, 'add_district'),
(26, 'Can change district', 7, 'change_district'),
(27, 'Can delete district', 7, 'delete_district'),
(28, 'Can view district', 7, 'view_district'),
(29, 'Can add login', 8, 'add_login'),
(30, 'Can change login', 8, 'change_login'),
(31, 'Can delete login', 8, 'delete_login'),
(32, 'Can view login', 8, 'view_login'),
(33, 'Can add services', 9, 'add_services'),
(34, 'Can change services', 9, 'change_services'),
(35, 'Can delete services', 9, 'delete_services'),
(36, 'Can view services', 9, 'view_services'),
(37, 'Can add state', 10, 'add_state'),
(38, 'Can change state', 10, 'change_state'),
(39, 'Can delete state', 10, 'delete_state'),
(40, 'Can view state', 10, 'view_state'),
(41, 'Can add worker_register', 11, 'add_worker_register'),
(42, 'Can change worker_register', 11, 'change_worker_register'),
(43, 'Can delete worker_register', 11, 'delete_worker_register'),
(44, 'Can view worker_register', 11, 'view_worker_register'),
(45, 'Can add user_register', 12, 'add_user_register'),
(46, 'Can change user_register', 12, 'change_user_register'),
(47, 'Can delete user_register', 12, 'delete_user_register'),
(48, 'Can view user_register', 12, 'view_user_register'),
(49, 'Can add feedback', 13, 'add_feedback'),
(50, 'Can change feedback', 13, 'change_feedback'),
(51, 'Can delete feedback', 13, 'delete_feedback'),
(52, 'Can view feedback', 13, 'view_feedback'),
(53, 'Can add service_request', 14, 'add_service_request'),
(54, 'Can change service_request', 14, 'change_service_request'),
(55, 'Can delete service_request', 14, 'delete_service_request'),
(56, 'Can view service_request', 14, 'view_service_request'),
(57, 'Can add work_assigns', 15, 'add_work_assigns'),
(58, 'Can change work_assigns', 15, 'change_work_assigns'),
(59, 'Can delete work_assigns', 15, 'delete_work_assigns'),
(60, 'Can view work_assigns', 15, 'view_work_assigns'),
(61, 'Can add membership_fee', 16, 'add_membership_fee'),
(62, 'Can change membership_fee', 16, 'change_membership_fee'),
(63, 'Can delete membership_fee', 16, 'delete_membership_fee'),
(64, 'Can view membership_fee', 16, 'view_membership_fee'),
(65, 'Can add membership', 17, 'add_membership'),
(66, 'Can change membership', 17, 'change_membership'),
(67, 'Can delete membership', 17, 'delete_membership'),
(68, 'Can view membership', 17, 'view_membership');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'workerApp', 'district'),
(13, 'workerApp', 'feedback'),
(8, 'workerApp', 'login'),
(17, 'workerApp', 'membership'),
(16, 'workerApp', 'membership_fee'),
(9, 'workerApp', 'services'),
(14, 'workerApp', 'service_request'),
(10, 'workerApp', 'state'),
(12, 'workerApp', 'user_register'),
(11, 'workerApp', 'worker_register'),
(15, 'workerApp', 'work_assigns');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-15 09:46:19.510885'),
(2, 'auth', '0001_initial', '2024-03-15 09:46:19.713996'),
(3, 'admin', '0001_initial', '2024-03-15 09:46:19.760867'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-15 09:46:19.776512'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-15 09:46:19.776512'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-15 09:46:19.807740'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-15 09:46:19.838998'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-15 09:46:19.854610'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-15 09:46:19.870235'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-15 09:46:19.885858'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-15 09:46:19.885858'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-15 09:46:19.901482'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-15 09:46:19.901482'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-15 09:46:19.917114'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-15 09:46:19.932729'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-15 09:46:19.932729'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-15 09:46:19.948364'),
(18, 'sessions', '0001_initial', '2024-03-15 09:46:19.963988'),
(19, 'workerApp', '0001_initial', '2024-03-15 09:46:20.167087'),
(20, 'workerApp', '0002_worker_register_service_alter_services_table', '2024-03-15 09:46:20.198336'),
(21, 'workerApp', '0003_service_request_work_assigns', '2024-03-15 09:46:20.323336'),
(22, 'workerApp', '0004_worker_register_image', '2024-03-15 09:46:20.323336'),
(23, 'workerApp', '0005_membership_fee_worker_register_student_and_more', '2024-03-15 09:46:20.385821'),
(24, 'workerApp', '0006_feedback_service_request', '2024-03-15 09:46:20.417068');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_district`
--

CREATE TABLE `tb_district` (
  `district_id` int(11) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_district`
--

INSERT INTO `tb_district` (`district_id`, `district`, `state_id`) VALUES
(1, 'Adilabad', 1),
(2, 'Anantapur', 1),
(3, 'Chittoor', 1),
(4, 'East Godavari', 1),
(5, 'Guntur', 1),
(6, 'Hyderabad', 1),
(7, 'Kadapa', 1),
(8, 'Karimnagar', 1),
(9, 'Khammam', 1),
(10, 'Krishna', 1),
(11, 'Kurnool', 1),
(12, 'Mahbubnagar', 1),
(13, 'Medak', 1),
(14, 'Nalgonda', 1),
(15, 'Nellore', 1),
(16, 'Nizamabad', 1),
(17, 'Prakasam', 1),
(18, 'Rangareddi', 1),
(19, 'Srikakulam', 1),
(20, 'Vishakhapatnam', 1),
(21, 'Vizianagaram', 1),
(22, 'Warangal', 1),
(23, 'West Godavari', 1),
(24, 'Anjaw', 3),
(25, 'Changlang', 3),
(26, 'East Kameng', 3),
(27, 'Lohit', 3),
(28, 'Lower Subansiri', 3),
(29, 'Papum Pare', 3),
(30, 'Tirap', 3),
(31, 'Dibang Valley', 3),
(32, 'Upper Subansiri', 3),
(33, 'West Kameng', 3),
(34, 'Barpeta', 2),
(35, 'Bongaigaon', 2),
(36, 'Cachar', 2),
(37, 'Darrang', 2),
(38, 'Dhemaji', 2),
(39, 'Dhubri', 2),
(40, 'Dibrugarh', 2),
(41, 'Goalpara', 2),
(42, 'Golaghat', 2),
(43, 'Hailakandi', 2),
(44, 'Jorhat', 2),
(45, 'Karbi Anglong', 2),
(46, 'Karimganj', 2),
(47, 'Kokrajhar', 2),
(48, 'Lakhimpur', 2),
(49, 'Marigaon', 2),
(50, 'Nagaon', 2),
(51, 'Nalbari', 2),
(52, 'North Cachar Hills', 2),
(53, 'Sibsagar', 2),
(54, 'Sonitpur', 2),
(55, 'Tinsukia', 2),
(56, 'Araria', 4),
(57, 'Aurangabad', 4),
(58, 'Banka', 4),
(59, 'Begusarai', 4),
(60, 'Bhagalpur', 4),
(61, 'Bhojpur', 4),
(62, 'Buxar', 4),
(63, 'Darbhanga', 4),
(64, 'Purba Champaran', 4),
(65, 'Gaya', 4),
(66, 'Gopalganj', 4),
(67, 'Jamui', 4),
(68, 'Jehanabad', 4),
(69, 'Khagaria', 4),
(70, 'Kishanganj', 4),
(71, 'Kaimur', 4),
(72, 'Katihar', 4),
(73, 'Lakhisarai', 4),
(74, 'Madhubani', 4),
(75, 'Munger', 4),
(76, 'Madhepura', 4),
(77, 'Muzaffarpur', 4),
(78, 'Nalanda', 4),
(79, 'Nawada', 4),
(80, 'Patna', 4),
(81, 'Purnia', 4),
(82, 'Rohtas', 4),
(83, 'Saharsa', 4),
(84, 'Samastipur', 4),
(85, 'Sheohar', 4),
(86, 'Sheikhpura', 4),
(87, 'Saran', 4),
(88, 'Sitamarhi', 4),
(89, 'Supaul', 4),
(90, 'Siwan', 4),
(91, 'Vaishali', 4),
(92, 'Pashchim Champaran', 4),
(93, 'Central Delhi', 25),
(94, 'East Delhi', 25),
(95, 'New Delhi', 25),
(96, 'North Delhi', 25),
(97, 'North East Delhi', 25),
(98, 'North West Delhi', 25),
(99, 'South Delhi', 25),
(100, 'South West Delhi', 25),
(101, 'West Delhi', 25),
(102, 'North Goa', 26),
(103, 'South Goa', 26),
(104, 'Ahmedabad', 5),
(105, 'Amreli District', 5),
(106, 'Anand', 5),
(107, 'Banaskantha', 5),
(108, 'Bharuch', 5),
(109, 'Bhavnagar', 5),
(110, 'Dahod', 5),
(111, 'The Dangs', 5),
(112, 'Gandhinagar', 5),
(113, 'Jamnagar', 5),
(114, 'Junagadh', 5),
(115, 'Kutch', 5),
(116, 'Kheda', 5),
(117, 'Mehsana', 5),
(118, 'Narmada', 5),
(119, 'Navsari', 5),
(120, 'Patan', 5),
(121, 'Panchmahal', 5),
(122, 'Porbandar', 5),
(123, 'Rajkot', 5),
(124, 'Sabarkantha', 5),
(125, 'Surendranagar', 5),
(126, 'Surat', 5),
(127, 'Vadodara', 5),
(128, 'Valsad', 5),
(129, 'Ambala', 6),
(130, 'Bhiwani', 6),
(131, 'Faridabad', 6),
(132, 'Fatehabad', 6),
(133, 'Gurgaon', 6),
(134, 'Hissar', 6),
(135, 'Jhajjar', 6),
(136, 'Jind', 6),
(137, 'Karnal', 6),
(138, 'Kaithal', 6),
(139, 'Kurukshetra', 6),
(140, 'Mahendragarh', 6),
(141, 'Mewat', 6),
(142, 'Panchkula', 6),
(143, 'Panipat', 6),
(144, 'Rewari', 6),
(145, 'Rohtak', 6),
(146, 'Sirsa', 6),
(147, 'Sonepat', 6),
(148, 'Yamuna Nagar', 6),
(149, 'Palwal', 6),
(150, 'Bilaspur', 7),
(151, 'Chamba', 7),
(152, 'Hamirpur', 7),
(153, 'Kangra', 7),
(154, 'Kinnaur', 7),
(155, 'Kulu', 7),
(156, 'Lahaul and Spiti', 7),
(157, 'Mandi', 7),
(158, 'Shimla', 7),
(159, 'Sirmaur', 7),
(160, 'Solan', 7),
(161, 'Una', 7),
(162, 'Anantnag', 8),
(163, 'Badgam', 8),
(164, 'Bandipore', 8),
(165, 'Baramula', 8),
(166, 'Doda', 8),
(167, 'Jammu', 8),
(168, 'Kargil', 8),
(169, 'Kathua', 8),
(170, 'Kupwara', 8),
(171, 'Leh', 8),
(172, 'Poonch', 8),
(173, 'Pulwama', 8),
(174, 'Rajauri', 8),
(175, 'Srinagar', 8),
(176, 'Samba', 8),
(177, 'Udhampur', 8),
(178, 'Bokaro', 34),
(179, 'Chatra', 34),
(180, 'Deoghar', 34),
(181, 'Dhanbad', 34),
(182, 'Dumka', 34),
(183, 'Purba Singhbhum', 34),
(184, 'Garhwa', 34),
(185, 'Giridih', 34),
(186, 'Godda', 34),
(187, 'Gumla', 34),
(188, 'Hazaribagh', 34),
(189, 'Koderma', 34),
(190, 'Lohardaga', 34),
(191, 'Pakur', 34),
(192, 'Palamu', 34),
(193, 'Ranchi', 34),
(194, 'Sahibganj', 34),
(195, 'Seraikela and Kharsawan', 34),
(196, 'Pashchim Singhbhum', 34),
(197, 'Ramgarh', 34),
(198, 'Bidar', 9),
(199, 'Belgaum', 9),
(200, 'Bijapur', 9),
(201, 'Bagalkot', 9),
(202, 'Bellary', 9),
(203, 'Bangalore Rural District', 9),
(204, 'Bangalore Urban District', 9),
(205, 'Chamarajnagar', 9),
(206, 'Chikmagalur', 9),
(207, 'Chitradurga', 9),
(208, 'Davanagere', 9),
(209, 'Dharwad', 9),
(210, 'Dakshina Kannada', 9),
(211, 'Gadag', 9),
(212, 'Gulbarga', 9),
(213, 'Hassan', 9),
(214, 'Haveri District', 9),
(215, 'Kodagu', 9),
(216, 'Kolar', 9),
(217, 'Koppal', 9),
(218, 'Mandya', 9),
(219, 'Mysore', 9),
(220, 'Raichur', 9),
(221, 'Shimoga', 9),
(222, 'Tumkur', 9),
(223, 'Udupi', 9),
(224, 'Uttara Kannada', 9),
(225, 'Ramanagara', 9),
(226, 'Chikballapur', 9),
(227, 'Yadagiri', 9),
(228, 'Alappuzha', 10),
(229, 'Ernakulam', 10),
(230, 'Idukki', 10),
(231, 'Kollam', 10),
(232, 'Kannur', 10),
(233, 'Kasaragod', 10),
(234, 'Kottayam', 10),
(235, 'Kozhikode', 10),
(236, 'Malappuram', 10),
(237, 'Palakkad', 10),
(238, 'Pathanamthitta', 10),
(239, 'Thrissur', 10),
(240, 'Thiruvananthapuram', 10),
(241, 'Wayanad', 10),
(242, 'Alirajpur', 11),
(243, 'Anuppur', 11),
(244, 'Ashok Nagar', 11),
(245, 'Balaghat', 11),
(246, 'Barwani', 11),
(247, 'Betul', 11),
(248, 'Bhind', 11),
(249, 'Bhopal', 11),
(250, 'Burhanpur', 11),
(251, 'Chhatarpur', 11),
(252, 'Chhindwara', 11),
(253, 'Damoh', 11),
(254, 'Datia', 11),
(255, 'Dewas', 11),
(256, 'Dhar', 11),
(257, 'Dindori', 11),
(258, 'Guna', 11),
(259, 'Gwalior', 11),
(260, 'Harda', 11),
(261, 'Hoshangabad', 11),
(262, 'Indore', 11),
(263, 'Jabalpur', 11),
(264, 'Jhabua', 11),
(265, 'Katni', 11),
(266, 'Khandwa', 11),
(267, 'Khargone', 11),
(268, 'Mandla', 11),
(269, 'Mandsaur', 11),
(270, 'Morena', 11),
(271, 'Narsinghpur', 11),
(272, 'Neemuch', 11),
(273, 'Panna', 11),
(274, 'Rewa', 11),
(275, 'Rajgarh', 11),
(276, 'Ratlam', 11),
(277, 'Raisen', 11),
(278, 'Sagar', 11),
(279, 'Satna', 11),
(280, 'Sehore', 11),
(281, 'Seoni', 11),
(282, 'Shahdol', 11),
(283, 'Shajapur', 11),
(284, 'Sheopur', 11),
(285, 'Shivpuri', 11),
(286, 'Sidhi', 11),
(287, 'Singrauli', 11),
(288, 'Tikamgarh', 11),
(289, 'Ujjain', 11),
(290, 'Umaria', 11),
(291, 'Vidisha', 11),
(292, 'Ahmednagar', 12),
(293, 'Akola', 12),
(294, 'Amrawati', 12),
(295, 'Aurangabad', 12),
(296, 'Bhandara', 12),
(297, 'Beed', 12),
(298, 'Buldhana', 12),
(299, 'Chandrapur', 12),
(300, 'Dhule', 12),
(301, 'Gadchiroli', 12),
(302, 'Gondiya', 12),
(303, 'Hingoli', 12),
(304, 'Jalgaon', 12),
(305, 'Jalna', 12),
(306, 'Kolhapur', 12),
(307, 'Latur', 12),
(308, 'Mumbai City', 12),
(309, 'Mumbai suburban', 12),
(310, 'Nandurbar', 12),
(311, 'Nanded', 12),
(312, 'Nagpur', 12),
(313, 'Nashik', 12),
(314, 'Osmanabad', 12),
(315, 'Parbhani', 12),
(316, 'Pune', 12),
(317, 'Raigad', 12),
(318, 'Ratnagiri', 12),
(319, 'Sindhudurg', 12),
(320, 'Sangli', 12),
(321, 'Solapur', 12),
(322, 'Satara', 12),
(323, 'Thane', 12),
(324, 'Wardha', 12),
(325, 'Washim', 12),
(326, 'Yavatmal', 12),
(327, 'Bishnupur', 13),
(328, 'Churachandpur', 13),
(329, 'Chandel', 13),
(330, 'Imphal East', 13),
(331, 'Senapati', 13),
(332, 'Tamenglong', 13),
(333, 'Thoubal', 13),
(334, 'Ukhrul', 13),
(335, 'Imphal West', 13),
(336, 'East Garo Hills', 14),
(337, 'East Khasi Hills', 14),
(338, 'Jaintia Hills', 14),
(339, 'Ri-Bhoi', 14),
(340, 'South Garo Hills', 14),
(341, 'West Garo Hills', 14),
(342, 'West Khasi Hills', 14),
(343, 'Aizawl', 15),
(344, 'Champhai', 15),
(345, 'Kolasib', 15),
(346, 'Lawngtlai', 15),
(347, 'Lunglei', 15),
(348, 'Mamit', 15),
(349, 'Saiha', 15),
(350, 'Serchhip', 15),
(351, 'Dimapur', 16),
(352, 'Kohima', 16),
(353, 'Mokokchung', 16),
(354, 'Mon', 16),
(355, 'Phek', 16),
(356, 'Tuensang', 16),
(357, 'Wokha', 16),
(358, 'Zunheboto', 16),
(359, 'Angul', 17),
(360, 'Boudh', 17),
(361, 'Bhadrak', 17),
(362, 'Bolangir', 17),
(363, 'Bargarh', 17),
(364, 'Baleswar', 17),
(365, 'Cuttack', 17),
(366, 'Debagarh', 17),
(367, 'Dhenkanal', 17),
(368, 'Ganjam', 17),
(369, 'Gajapati', 17),
(370, 'Jharsuguda', 17),
(371, 'Jajapur', 17),
(372, 'Jagatsinghpur', 17),
(373, 'Khordha', 17),
(374, 'Kendujhar', 17),
(375, 'Kalahandi', 17),
(376, 'Kandhamal', 17),
(377, 'Koraput', 17),
(378, 'Kendrapara', 17),
(379, 'Malkangiri', 17),
(380, 'Mayurbhanj', 17),
(381, 'Nabarangpur', 17),
(382, 'Nuapada', 17),
(383, 'Nayagarh', 17),
(384, 'Puri', 17),
(385, 'Rayagada', 17),
(386, 'Sambalpur', 17),
(387, 'Subarnapur', 17),
(388, 'Sundargarh', 17),
(389, 'Amritsar', 18),
(390, 'Bathinda', 18),
(391, 'Firozpur', 18),
(392, 'Faridkot', 18),
(393, 'Fatehgarh Sahib', 18),
(394, 'Gurdaspur', 18),
(395, 'Hoshiarpur', 18),
(396, 'Jalandhar', 18),
(397, 'Kapurthala', 18),
(398, 'Ludhiana', 18),
(399, 'Mansa', 18),
(400, 'Moga', 18),
(401, 'Mukatsar', 18),
(402, 'Nawan Shehar', 18),
(403, 'Patiala', 18),
(404, 'Rupnagar', 18),
(405, 'Sangrur', 18),
(406, 'Ajmer', 19),
(407, 'Alwar', 19),
(408, 'Bikaner', 19),
(409, 'Barmer', 19),
(410, 'Banswara', 19),
(411, 'Bharatpur', 19),
(412, 'Baran', 19),
(413, 'Bundi', 19),
(414, 'Bhilwara', 19),
(415, 'Churu', 19),
(416, 'Chittorgarh', 19),
(417, 'Dausa', 19),
(418, 'Dholpur', 19),
(419, 'Dungapur', 19),
(420, 'Ganganagar', 19),
(421, 'Hanumangarh', 19),
(422, 'Juhnjhunun', 19),
(423, 'Jalore', 19),
(424, 'Jodhpur', 19),
(425, 'Jaipur', 19),
(426, 'Jaisalmer', 19),
(427, 'Jhalawar', 19),
(428, 'Karauli', 19),
(429, 'Kota', 19),
(430, 'Nagaur', 19),
(431, 'Pali', 19),
(432, 'Pratapgarh', 19),
(433, 'Rajsamand', 19),
(434, 'Sikar', 19),
(435, 'Sawai Madhopur', 19),
(436, 'Sirohi', 19),
(437, 'Tonk', 19),
(438, 'Udaipur', 19),
(439, 'East Sikkim', 20),
(440, 'North Sikkim', 20),
(441, 'South Sikkim', 20),
(442, 'West Sikkim', 20),
(443, 'Ariyalur', 21),
(444, 'Chennai', 21),
(445, 'Coimbatore', 21),
(446, 'Cuddalore', 21),
(447, 'Dharmapuri', 21),
(448, 'Dindigul', 21),
(449, 'Erode', 21),
(450, 'Kanchipuram', 21),
(451, 'Kanyakumari', 21),
(452, 'Karur', 21),
(453, 'Madurai', 21),
(454, 'Nagapattinam', 21),
(455, 'The Nilgiris', 21),
(456, 'Namakkal', 21),
(457, 'Perambalur', 21),
(458, 'Pudukkottai', 21),
(459, 'Ramanathapuram', 21),
(460, 'Salem', 21),
(461, 'Sivagangai', 21),
(462, 'Tiruppur', 21),
(463, 'Tiruchirappalli', 21),
(464, 'Theni', 21),
(465, 'Tirunelveli', 21),
(466, 'Thanjavur', 21),
(467, 'Thoothukudi', 21),
(468, 'Thiruvallur', 21),
(469, 'Thiruvarur', 21),
(470, 'Tiruvannamalai', 21),
(471, 'Vellore', 21),
(472, 'Villupuram', 21),
(473, 'Dhalai', 22),
(474, 'North Tripura', 22),
(475, 'South Tripura', 22),
(476, 'West Tripura', 22),
(477, 'Agra', 23),
(478, 'Allahabad', 23),
(479, 'Aligarh', 23),
(480, 'Ambedkar Nagar', 23),
(481, 'Auraiya', 23),
(482, 'Azamgarh', 23),
(483, 'Barabanki', 23),
(484, 'Badaun', 23),
(485, 'Bagpat', 23),
(486, 'Bahraich', 23),
(487, 'Bijnor', 23),
(488, 'Ballia', 23),
(489, 'Banda', 23),
(490, 'Balrampur', 23),
(491, 'Bareilly', 23),
(492, 'Basti', 23),
(493, 'Bulandshahr', 23),
(494, 'Chandauli', 23),
(495, 'Chitrakoot', 23),
(496, 'Deoria', 23),
(497, 'Etah', 23),
(498, 'Kanshiram Nagar', 23),
(499, 'Etawah', 23),
(500, 'Firozabad', 23),
(501, 'Farrukhabad', 23),
(502, 'Fatehpur', 23),
(503, 'Faizabad', 23),
(504, 'Gautam Buddha Nagar', 23),
(505, 'Gonda', 23),
(506, 'Ghazipur', 23),
(507, 'Gorkakhpur', 23),
(508, 'Ghaziabad', 23),
(509, 'Hamirpur', 23),
(510, 'Hardoi', 23),
(511, 'Mahamaya Nagar', 23),
(512, 'Jhansi', 23),
(513, 'Jalaun', 23),
(514, 'Jyotiba Phule Nagar', 23),
(515, 'Jaunpur District', 23),
(516, 'Kanpur Dehat', 23),
(517, 'Kannauj', 23),
(518, 'Kanpur Nagar', 23),
(519, 'Kaushambi', 23),
(520, 'Kushinagar', 23),
(521, 'Lalitpur', 23),
(522, 'Lakhimpur Kheri', 23),
(523, 'Lucknow', 23),
(524, 'Mau', 23),
(525, 'Meerut', 23),
(526, 'Maharajganj', 23),
(527, 'Mahoba', 23),
(528, 'Mirzapur', 23),
(529, 'Moradabad', 23),
(530, 'Mainpuri', 23),
(531, 'Mathura', 23),
(532, 'Muzaffarnagar', 23),
(533, 'Pilibhit', 23),
(534, 'Pratapgarh', 23),
(535, 'Rampur', 23),
(536, 'Rae Bareli', 23),
(537, 'Saharanpur', 23),
(538, 'Sitapur', 23),
(539, 'Shahjahanpur', 23),
(540, 'Sant Kabir Nagar', 23),
(541, 'Siddharthnagar', 23),
(542, 'Sonbhadra', 23),
(543, 'Sant Ravidas Nagar', 23),
(544, 'Sultanpur', 23),
(545, 'Shravasti', 23),
(546, 'Unnao', 23),
(547, 'Varanasi', 23),
(548, 'Birbhum', 24),
(549, 'Bankura', 24),
(550, 'Bardhaman', 24),
(551, 'Darjeeling', 24),
(552, 'Dakshin Dinajpur', 24),
(553, 'Hooghly', 24),
(554, 'Howrah', 24),
(555, 'Jalpaiguri', 24),
(556, 'Cooch Behar', 24),
(557, 'Kolkata', 24),
(558, 'Malda', 24),
(559, 'Midnapore', 24),
(560, 'Murshidabad', 24),
(561, 'Nadia', 24),
(562, 'North 24 Parganas', 24),
(563, 'South 24 Parganas', 24),
(564, 'Purulia', 24),
(565, 'Uttar Dinajpur', 24);

-- --------------------------------------------------------

--
-- Table structure for table `tb_feedback`
--

CREATE TABLE `tb_feedback` (
  `f_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL,
  `feedback` longtext NOT NULL,
  `reply` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `service_request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_feedback`
--

INSERT INTO `tb_feedback` (`f_id`, `feedback_date`, `feedback`, `reply`, `user_id`, `service_request_id`) VALUES
(1, '2024-03-16', 'Worker completed the work on time. he is a good worker', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `log_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` longtext NOT NULL,
  `role` varchar(15) NOT NULL,
  `approval_status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`log_id`, `username`, `password`, `role`, `approval_status`) VALUES
(1, 'admin', 'admin', 'admin', NULL),
(2, 'raj12', 'raj12', 'worker', 'Approved'),
(3, 'ram12', 'ram12', 'worker', 'Approved'),
(4, 'arun12', 'arun12', 'worker', 'Approved'),
(5, 'sam12', 'sam12', 'worker', 'Approved'),
(6, 'manu12', 'manu12', 'user', NULL),
(7, 'anu12', 'anu12', 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_membership`
--

CREATE TABLE `tb_membership` (
  `m_id` int(11) NOT NULL,
  `membership_date` date NOT NULL,
  `membership_validity` date NOT NULL,
  `amount` double NOT NULL,
  `worker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_membership`
--

INSERT INTO `tb_membership` (`m_id`, `membership_date`, `membership_validity`, `amount`, `worker_id`) VALUES
(1, '2024-03-16', '2024-04-15', 200, 1),
(2, '2024-03-16', '2024-04-15', 200, 2),
(3, '2024-03-16', '2024-04-15', 200, 3),
(4, '2024-03-16', '2024-04-15', 200, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_membership_fee`
--

CREATE TABLE `tb_membership_fee` (
  `mf_id` int(11) NOT NULL,
  `membership_fee` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_membership_fee`
--

INSERT INTO `tb_membership_fee` (`mf_id`, `membership_fee`) VALUES
(1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `tb_services`
--

CREATE TABLE `tb_services` (
  `s_id` int(11) NOT NULL,
  `service_name` varchar(60) NOT NULL,
  `image` longtext NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_services`
--

INSERT INTO `tb_services` (`s_id`, `service_name`, `image`, `description`) VALUES
(1, 'Plumbing', '/media/plumber.jpg', 'We have technically qualified professionals, who are experts in handling simple to complex plumbing projects.Our team has rich experience in handling complicated projects.'),
(2, 'Electrical', '/media/ele.jpg', 'We provide you with all kinds of electrical works such as Domestic / Commercial / Low tension (LT) / High tension (HT) / Special Electrical fitting / Panel Board.'),
(3, 'Carpenter', '/media/carp.jpg', 'We carry out a wide range of Minor Carpentry Repairs, Furniture Repair, hinge adjustment in addition to online furniture assembly, bolting and latching .');

-- --------------------------------------------------------

--
-- Table structure for table `tb_service_request`
--

CREATE TABLE `tb_service_request` (
  `sr_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `place` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `requested_date` date NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_service_request`
--

INSERT INTO `tb_service_request` (`sr_id`, `title`, `place`, `description`, `requested_date`, `status`, `district_id`, `service_id`, `user_id`) VALUES
(1, 'Plumbing work ', 'Ranni', 'New house plumbing work', '2024-03-16', 'Completed', 238, 1, 1),
(2, 'Shop elecrical work', 'Adoor', 'We want to finish the work very soon', '2024-03-16', NULL, 238, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_state`
--

CREATE TABLE `tb_state` (
  `state_id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_state`
--

INSERT INTO `tb_state` (`state_id`, `state`) VALUES
(1, 'ANDHRA PRADESH'),
(2, 'ASSAM'),
(3, 'ARUNACHAL PRADESH'),
(4, 'BIHAR'),
(5, 'GUJRAT'),
(6, 'HARYANA'),
(7, 'HIMACHAL PRADESH'),
(8, 'JAMMU & KASHMIR'),
(9, 'KARNATAKA'),
(10, 'KERALA'),
(11, 'MADHYA PRADESH'),
(12, 'MAHARASHTRA'),
(13, 'MANIPUR'),
(14, 'MEGHALAYA'),
(15, 'MIZORAM'),
(16, 'NAGALAND'),
(17, 'ORISSA'),
(18, 'PUNJAB'),
(19, 'RAJASTHAN'),
(20, 'SIKKIM'),
(21, 'TAMIL NADU'),
(22, 'TRIPURA'),
(23, 'UTTAR PRADESH'),
(24, 'WEST BENGAL'),
(25, 'DELHI'),
(26, 'GOA'),
(27, 'PONDICHERY'),
(28, 'LAKSHDWEEP'),
(29, 'DAMAN & DIU'),
(30, 'DADRA & NAGAR'),
(31, 'CHANDIGARH'),
(32, 'ANDAMAN & NICOBAR'),
(33, 'UTTARANCHAL'),
(34, 'JHARKHAND'),
(35, 'CHATTISGARH');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_register`
--

CREATE TABLE `tb_user_register` (
  `u_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `log_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user_register`
--

INSERT INTO `tb_user_register` (`u_id`, `name`, `email`, `contact_number`, `address`, `log_id`) VALUES
(1, 'Manu', 'manu@gmail.com', 9098765768, 'Manu bhavan\r\nPathanamthitta', 6),
(2, 'Anu', 'anu@gmail.co', 9098795768, 'Anu bhavan\r\nThiruvalla', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_worker_register`
--

CREATE TABLE `tb_worker_register` (
  `w_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `place` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `proof` longtext NOT NULL,
  `work_experience` varchar(20) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `log_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `image` longtext NOT NULL,
  `student` varchar(20) DEFAULT NULL,
  `work_time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_worker_register`
--

INSERT INTO `tb_worker_register` (`w_id`, `name`, `email`, `contact_number`, `place`, `address`, `proof`, `work_experience`, `district_id`, `log_id`, `service_id`, `image`, `student`, `work_time`) VALUES
(1, 'Raj', 'raj@gmail.com', 9098765768, 'Ranni', 'Raj bhavan\r\nPathanamthitta', '/media/modal-img3.jpg', '0-1', 238, 2, 1, '/media/comments-5.jpg', 'No', NULL),
(2, 'Ram', 'ram@gmail.com', 9098795768, 'Adoor', 'ram bhavan\r\nadoor \r\npathanamthitta', '/media/modal-img3_SvxMWaP.jpg', '1-2', 238, 3, 2, '/media/comments-6.jpg', 'No', NULL),
(3, 'Arun', 'arun@gmail.com', 9098790768, 'Pattam', 'Arun villa\r\npattam', '/media/modal-img3_meVTZo6.jpg', '0-1', 240, 4, 2, '/media/comments-2.jpg', 'Yes', '8pm - 3am'),
(4, 'Sam', 'sam@gmail.com', 9098795762, 'Pandalam', 'Sam villa\r\npathanamthitta', '/media/modal-img3_mEMGdw3.jpg', '2-4', 238, 5, 3, '/media/photo8.jpg', 'No', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_work_assigns`
--

CREATE TABLE `tb_work_assigns` (
  `wa_id` int(11) NOT NULL,
  `completed_date` date DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `service_request_id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_work_assigns`
--

INSERT INTO `tb_work_assigns` (`wa_id`, `completed_date`, `status`, `service_request_id`, `worker_id`) VALUES
(1, '2024-03-22', 'Completed', 1, 1),
(2, NULL, NULL, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tb_district`
--
ALTER TABLE `tb_district`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `tb_District_state_id_9e24b679_fk_tb_State_state_id` (`state_id`);

--
-- Indexes for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `tb_Feedback_user_id_57d6004e_fk_tb_User_register_u_id` (`user_id`),
  ADD KEY `tb_Feedback_service_request_id_78c3a4d6_fk_tb_Servic` (`service_request_id`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tb_membership`
--
ALTER TABLE `tb_membership`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `tb_Membership_worker_id_34971c30_fk_tb_Worker_register_w_id` (`worker_id`);

--
-- Indexes for table `tb_membership_fee`
--
ALTER TABLE `tb_membership_fee`
  ADD PRIMARY KEY (`mf_id`);

--
-- Indexes for table `tb_services`
--
ALTER TABLE `tb_services`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tb_service_request`
--
ALTER TABLE `tb_service_request`
  ADD PRIMARY KEY (`sr_id`),
  ADD KEY `tb_Service_request_district_id_8de56628_fk_tb_Distri` (`district_id`),
  ADD KEY `tb_Service_request_service_id_4c9539c7_fk_tb_Services_s_id` (`service_id`),
  ADD KEY `tb_Service_request_user_id_e7006073_fk_tb_User_register_u_id` (`user_id`);

--
-- Indexes for table `tb_state`
--
ALTER TABLE `tb_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tb_user_register`
--
ALTER TABLE `tb_user_register`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `tb_User_register_log_id_c02c5f6c_fk_tb_Login_log_id` (`log_id`);

--
-- Indexes for table `tb_worker_register`
--
ALTER TABLE `tb_worker_register`
  ADD PRIMARY KEY (`w_id`),
  ADD KEY `tb_Worker_register_district_id_d5ae8f2f_fk_tb_Distri` (`district_id`),
  ADD KEY `tb_Worker_register_log_id_a910f753_fk_tb_Login_log_id` (`log_id`),
  ADD KEY `tb_Worker_register_service_id_4d47d512_fk_workerApp` (`service_id`);

--
-- Indexes for table `tb_work_assigns`
--
ALTER TABLE `tb_work_assigns`
  ADD PRIMARY KEY (`wa_id`),
  ADD KEY `tb_Work_assigns_service_request_id_216da5ad_fk_tb_Servic` (`service_request_id`),
  ADD KEY `tb_Work_assigns_worker_id_8fe2c735_fk_tb_Worker_register_w_id` (`worker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_district`
--
ALTER TABLE `tb_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_membership`
--
ALTER TABLE `tb_membership`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_membership_fee`
--
ALTER TABLE `tb_membership_fee`
  MODIFY `mf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_services`
--
ALTER TABLE `tb_services`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_service_request`
--
ALTER TABLE `tb_service_request`
  MODIFY `sr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_state`
--
ALTER TABLE `tb_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_user_register`
--
ALTER TABLE `tb_user_register`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_worker_register`
--
ALTER TABLE `tb_worker_register`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_work_assigns`
--
ALTER TABLE `tb_work_assigns`
  MODIFY `wa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tb_district`
--
ALTER TABLE `tb_district`
  ADD CONSTRAINT `tb_District_state_id_9e24b679_fk_tb_State_state_id` FOREIGN KEY (`state_id`) REFERENCES `tb_state` (`state_id`);

--
-- Constraints for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD CONSTRAINT `tb_Feedback_service_request_id_78c3a4d6_fk_tb_Servic` FOREIGN KEY (`service_request_id`) REFERENCES `tb_service_request` (`sr_id`),
  ADD CONSTRAINT `tb_Feedback_user_id_57d6004e_fk_tb_User_register_u_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user_register` (`u_id`);

--
-- Constraints for table `tb_membership`
--
ALTER TABLE `tb_membership`
  ADD CONSTRAINT `tb_Membership_worker_id_34971c30_fk_tb_Worker_register_w_id` FOREIGN KEY (`worker_id`) REFERENCES `tb_worker_register` (`w_id`);

--
-- Constraints for table `tb_service_request`
--
ALTER TABLE `tb_service_request`
  ADD CONSTRAINT `tb_Service_request_district_id_8de56628_fk_tb_Distri` FOREIGN KEY (`district_id`) REFERENCES `tb_district` (`district_id`),
  ADD CONSTRAINT `tb_Service_request_service_id_4c9539c7_fk_tb_Services_s_id` FOREIGN KEY (`service_id`) REFERENCES `tb_services` (`s_id`),
  ADD CONSTRAINT `tb_Service_request_user_id_e7006073_fk_tb_User_register_u_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user_register` (`u_id`);

--
-- Constraints for table `tb_user_register`
--
ALTER TABLE `tb_user_register`
  ADD CONSTRAINT `tb_User_register_log_id_c02c5f6c_fk_tb_Login_log_id` FOREIGN KEY (`log_id`) REFERENCES `tb_login` (`log_id`);

--
-- Constraints for table `tb_worker_register`
--
ALTER TABLE `tb_worker_register`
  ADD CONSTRAINT `tb_Worker_register_district_id_d5ae8f2f_fk_tb_Distri` FOREIGN KEY (`district_id`) REFERENCES `tb_district` (`district_id`),
  ADD CONSTRAINT `tb_Worker_register_log_id_a910f753_fk_tb_Login_log_id` FOREIGN KEY (`log_id`) REFERENCES `tb_login` (`log_id`),
  ADD CONSTRAINT `tb_Worker_register_service_id_4d47d512_fk_workerApp` FOREIGN KEY (`service_id`) REFERENCES `tb_services` (`s_id`);

--
-- Constraints for table `tb_work_assigns`
--
ALTER TABLE `tb_work_assigns`
  ADD CONSTRAINT `tb_Work_assigns_service_request_id_216da5ad_fk_tb_Servic` FOREIGN KEY (`service_request_id`) REFERENCES `tb_service_request` (`sr_id`),
  ADD CONSTRAINT `tb_Work_assigns_worker_id_8fe2c735_fk_tb_Worker_register_w_id` FOREIGN KEY (`worker_id`) REFERENCES `tb_worker_register` (`w_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
