-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2017 at 02:55 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hgh`
--

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Administration', '[]', '#000', NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `salary_cur`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Adhika Dhaneswara', 'Super Admin', 'Male', '8888888888', '', 'dhickoh@gmail.com', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2017-02-08', '2017-02-08', '2017-02-08', '0.000', NULL, '2017-02-08 00:30:27', '2017-02-08 00:30:27'),
(3, 'Andre', 'Admin', 'Male', '1234567890', '', 'andrevalerian@yahoo.com', 1, '', '', '', '1990-01-01', '1970-01-01', '1990-01-01', '0.000', NULL, '2017-02-19 01:38:57', '2017-02-19 01:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `la_configs`
--

CREATE TABLE `la_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `la_configs`
--

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sitename', '', 'LaraAdmin 1.0', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 'sitename_part1', '', 'Lara', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(3, 'sitename_part2', '', 'Admin 1.0', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(4, 'sitename_short', '', 'LA', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(5, 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(6, 'sidebar_search', '', '1', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(7, 'show_messages', '', '1', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(8, 'show_notifications', '', '1', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(9, 'show_tasks', '', '1', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(10, 'show_rightsidebar', '', '1', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(11, 'skin', '', 'skin-white', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(12, 'layout', '', 'fixed', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(13, 'default_email', '', 'test@example.com', '2017-02-08 00:30:15', '2017-02-08 00:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `la_menus`
--

CREATE TABLE `la_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hierarchy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `la_menus`
--

INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
(1, 'Team', '#', 'fa-group', 'custom', 0, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 'Users', 'users', 'fa-group', 'module', 1, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(3, 'Uploads', 'uploads', 'fa-files-o', 'module', 0, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(4, 'Departments', 'departments', 'fa-tags', 'module', 1, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(5, 'Employees', 'employees', 'fa-group', 'module', 1, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(6, 'Roles', 'roles', 'fa-user-plus', 'module', 1, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(7, 'Organizations', 'organizations', 'fa-university', 'module', 0, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(8, 'Permissions', 'permissions', 'fa-magic', 'module', 1, 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(11, 'Trucks', 'trucks', 'fa fa-truck', 'module', 0, 0, '2017-02-08 01:19:37', '2017-02-08 01:19:37'),
(13, 'Relations', 'relations', 'fa fa-link', 'module', 0, 0, '2017-02-19 06:15:46', '2017-02-19 06:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_05_26_050000_create_modules_table', 1),
(2, '2014_05_26_055000_create_module_field_types_table', 1),
(3, '2014_05_26_060000_create_module_fields_table', 1),
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2014_12_01_000000_create_uploads_table', 1),
(7, '2016_05_26_064006_create_departments_table', 1),
(8, '2016_05_26_064007_create_employees_table', 1),
(9, '2016_05_26_064446_create_roles_table', 1),
(10, '2016_07_05_115343_create_role_user_table', 1),
(11, '2016_07_06_140637_create_organizations_table', 1),
(12, '2016_07_07_134058_create_backups_table', 1),
(13, '2016_07_07_134058_create_menus_table', 1),
(14, '2016_09_10_163337_create_permissions_table', 1),
(15, '2016_09_10_163520_create_permission_role_table', 1),
(16, '2016_09_22_105958_role_module_fields_table', 1),
(17, '2016_09_22_110008_role_module_table', 1),
(18, '2016_10_06_115413_create_la_configs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(3, 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(4, 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(6, 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2017-02-08 00:30:14', '2017-02-08 00:30:15'),
(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(11, 'Trucks', 'Trucks', 'trucks', 'name', 'Truck', 'TrucksController', 'fa-truck', 1, '2017-02-08 01:07:48', '2017-02-08 01:19:37'),
(14, 'Relations', 'Relations', 'relations', 'relation', 'Relation', 'RelationsController', 'fa-link', 1, '2017-02-19 06:04:48', '2017-02-19 06:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `module_fields`
--

CREATE TABLE `module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) UNSIGNED NOT NULL,
  `field_type` int(10) UNSIGNED NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_fields`
--

INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(5, 'type', 'User Type', 1, 7, 0, 'Employee', 0, 0, 0, '["Employee","Client"]', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(13, 'name', 'Name', 3, 16, 1, '', 1, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(14, 'tags', 'Tags', 3, 20, 0, '[]', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(15, 'color', 'Color', 3, 19, 0, '', 0, 50, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(16, 'name', 'Name', 4, 16, 0, '', 5, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(17, 'designation', 'Designation', 4, 19, 0, '', 0, 50, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(18, 'gender', 'Gender', 4, 18, 0, 'Male', 0, 0, 1, '["Male","Female"]', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(19, 'mobile', 'Mobile', 4, 14, 0, '', 10, 20, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(20, 'mobile2', 'Alternative Mobile', 4, 14, 0, '', 10, 20, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(21, 'email', 'Email', 4, 8, 1, '', 5, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(22, 'dept', 'Department', 4, 7, 0, '0', 0, 0, 1, '@departments', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(23, 'city', 'City', 4, 19, 0, '', 0, 50, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(24, 'address', 'Address', 4, 1, 0, '', 0, 1000, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(25, 'about', 'About', 4, 19, 0, '', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(26, 'date_birth', 'Date of Birth', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(27, 'date_hire', 'Hiring Date', 4, 4, 0, 'date(''Y-m-d'')', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(28, 'date_left', 'Resignation Date', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(29, 'salary_cur', 'Current Salary', 4, 6, 0, '0.0', 0, 2, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(34, 'dept', 'Department', 5, 7, 0, '1', 0, 0, 0, '@departments', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(35, 'name', 'Name', 6, 16, 1, '', 5, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(36, 'email', 'Email', 6, 8, 1, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(37, 'phone', 'Phone', 6, 14, 0, '', 0, 20, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(38, 'website', 'Website', 6, 23, 0, 'http://', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(39, 'assigned_to', 'Assigned to', 6, 7, 0, '0', 0, 0, 0, '@employees', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(40, 'connect_since', 'Connected Since', 6, 4, 0, 'date(''Y-m-d'')', 0, 0, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(41, 'address', 'Address', 6, 1, 0, '', 0, 1000, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(42, 'city', 'City', 6, 19, 0, '', 0, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(43, 'description', 'Description', 6, 21, 0, '', 0, 1000, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(44, 'profile_image', 'Profile Image', 6, 12, 0, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(45, 'profile', 'Company Profile', 6, 9, 0, '', 0, 250, 0, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(56, 'name', 'Name', 11, 16, 1, '', 0, 256, 1, '', 0, '2017-02-08 01:17:34', '2017-02-08 01:17:34'),
(57, 'nomor_polisi', 'Nomor Polisi', 11, 19, 1, '', 0, 256, 1, '', 0, '2017-02-08 01:17:51', '2017-02-08 01:17:51'),
(58, 'kapasitas', 'Kapasitas', 11, 13, 1, '', 0, 11, 1, '', 0, '2017-02-08 01:18:07', '2017-02-08 01:18:07'),
(59, 'status', 'Status', 11, 7, 0, '', 0, 0, 1, '["Tersedia","Digunakan"]', 0, '2017-02-08 01:19:32', '2017-02-08 01:19:32'),
(67, 'relation', 'Relation', 14, 7, 0, '', 0, 0, 1, '["Customer","Supplier","Customer & Supplier","Retail"]', 0, '2017-02-19 06:06:21', '2017-02-19 06:12:48'),
(68, 'nama', 'Nama', 14, 16, 0, '', 0, 256, 1, '', 0, '2017-02-19 06:06:38', '2017-02-19 06:06:38'),
(69, 'alamat', 'Alamat', 14, 1, 0, '', 0, 256, 1, '', 0, '2017-02-19 06:06:52', '2017-02-19 06:06:52'),
(70, 'no_telepon', 'No. Telepon', 14, 14, 1, '', 0, 20, 1, '', 0, '2017-02-19 06:07:20', '2017-02-19 06:07:20'),
(71, 'nama_bank', 'Nama Bank', 14, 16, 0, '', 0, 256, 1, '', 0, '2017-02-19 06:07:39', '2017-02-19 06:07:39'),
(72, 'no_rekening', 'No. Rekening', 14, 19, 0, '', 0, 256, 1, '', 0, '2017-02-19 06:07:56', '2017-02-19 06:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `module_field_types`
--

CREATE TABLE `module_field_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_field_types`
--

INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Address', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(2, 'Checkbox', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(3, 'Currency', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(4, 'Date', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(5, 'Datetime', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(6, 'Decimal', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(7, 'Dropdown', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(8, 'Email', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(9, 'File', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(10, 'Float', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(11, 'HTML', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(12, 'Image', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(13, 'Integer', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(14, 'Mobile', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(15, 'Multiselect', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(16, 'Name', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(17, 'Password', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(18, 'Radio', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(19, 'String', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(20, 'Taginput', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(21, 'Textarea', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(22, 'TextField', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(23, 'URL', '2017-02-08 00:30:14', '2017-02-08 00:30:14'),
(24, 'Files', '2017-02-08 00:30:14', '2017-02-08 00:30:14');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nama` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alamat` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_telepon` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nama_bank` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_rekening` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `deleted_at`, `created_at`, `updated_at`, `relation`, `nama`, `alamat`, `no_telepon`, `nama_bank`, `no_rekening`) VALUES
(1, NULL, '2017-02-19 06:16:20', '2017-02-19 06:16:20', 'Customer', 'Akram', 'Jl. Kenanga Raya', '1234567890', 'BCA', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `dept` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 'ADMIN_SUPER', 'Admin Super', '', 1, 1, NULL, '2017-02-08 01:51:17', '2017-02-08 01:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_module`
--

CREATE TABLE `role_module` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_module`
--

INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 1, 2, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(3, 1, 3, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(4, 1, 4, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(5, 1, 5, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(6, 1, 6, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(7, 1, 7, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(8, 1, 8, 1, 1, 1, 1, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(11, 1, 11, 1, 1, 1, 1, '2017-02-08 01:19:37', '2017-02-08 01:19:37'),
(12, 2, 1, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(13, 2, 2, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(14, 2, 3, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(15, 2, 4, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(16, 2, 5, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(17, 2, 6, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(18, 2, 7, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(19, 2, 8, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(20, 2, 11, 1, 0, 0, 0, '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(22, 1, 14, 1, 1, 1, 1, '2017-02-19 06:15:46', '2017-02-19 06:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_module_fields`
--

CREATE TABLE `role_module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_module_fields`
--

INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 1, 2, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(3, 1, 3, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(4, 1, 4, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(5, 1, 5, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(6, 1, 6, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(7, 1, 7, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(8, 1, 8, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(9, 1, 9, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(10, 1, 10, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(11, 1, 11, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(12, 1, 12, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(13, 1, 13, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(14, 1, 14, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(15, 1, 15, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(16, 1, 16, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(17, 1, 17, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(18, 1, 18, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(19, 1, 19, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(20, 1, 20, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(21, 1, 21, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(22, 1, 22, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(23, 1, 23, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(24, 1, 24, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(25, 1, 25, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(26, 1, 26, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(27, 1, 27, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(28, 1, 28, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(29, 1, 29, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(30, 1, 30, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(31, 1, 31, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(32, 1, 32, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(33, 1, 33, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(34, 1, 34, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(35, 1, 35, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(36, 1, 36, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(37, 1, 37, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(38, 1, 38, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(39, 1, 39, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(40, 1, 40, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(41, 1, 41, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(42, 1, 42, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(43, 1, 43, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(44, 1, 44, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(45, 1, 45, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(46, 1, 46, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(47, 1, 47, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(48, 1, 48, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(49, 1, 49, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(50, 1, 50, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(51, 1, 51, 'write', '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(56, 1, 56, 'write', '2017-02-08 01:17:35', '2017-02-08 01:17:35'),
(57, 1, 57, 'write', '2017-02-08 01:17:51', '2017-02-08 01:17:51'),
(58, 1, 58, 'write', '2017-02-08 01:18:07', '2017-02-08 01:18:07'),
(59, 1, 59, 'write', '2017-02-08 01:19:32', '2017-02-08 01:19:32'),
(60, 2, 1, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(61, 2, 2, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(62, 2, 3, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(63, 2, 4, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(64, 2, 5, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(65, 2, 6, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(66, 2, 7, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(67, 2, 8, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(68, 2, 9, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(69, 2, 10, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(70, 2, 11, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(71, 2, 12, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(72, 2, 13, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(73, 2, 14, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(74, 2, 15, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(75, 2, 16, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(76, 2, 17, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(77, 2, 18, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(78, 2, 19, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(79, 2, 20, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(80, 2, 21, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(81, 2, 22, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(82, 2, 23, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(83, 2, 24, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(84, 2, 25, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(85, 2, 26, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(86, 2, 27, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(87, 2, 28, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(88, 2, 29, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(89, 2, 30, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(90, 2, 31, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(91, 2, 32, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(92, 2, 33, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(93, 2, 34, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(94, 2, 35, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(95, 2, 36, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(96, 2, 37, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(97, 2, 38, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(98, 2, 39, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(99, 2, 40, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(100, 2, 41, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(101, 2, 42, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(102, 2, 43, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(103, 2, 44, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(104, 2, 45, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(105, 2, 46, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(106, 2, 47, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(107, 2, 48, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(108, 2, 49, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(109, 2, 50, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(110, 2, 51, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(111, 2, 56, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(112, 2, 57, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(113, 2, 58, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(114, 2, 59, 'readonly', '2017-02-08 01:51:17', '2017-02-08 01:51:17'),
(122, 1, 67, 'write', '2017-02-19 06:06:21', '2017-02-19 06:06:21'),
(123, 1, 68, 'write', '2017-02-19 06:06:38', '2017-02-19 06:06:38'),
(124, 1, 69, 'write', '2017-02-19 06:06:52', '2017-02-19 06:06:52'),
(125, 1, 70, 'write', '2017-02-19 06:07:20', '2017-02-19 06:07:20'),
(126, 1, 71, 'write', '2017-02-19 06:07:40', '2017-02-19 06:07:40'),
(127, 1, 72, 'write', '2017-02-19 06:07:56', '2017-02-19 06:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(5, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nomor_polisi` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `kapasitas` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `nomor_polisi`, `kapasitas`, `status`) VALUES
(1, NULL, '2017-02-08 01:20:21', '2017-02-08 01:20:21', 'Mitsubishi Lancer', 'B 2393 KRI', 250, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Adhika Dhaneswara', 1, 'dhickoh@gmail.com', '$2y$10$dkq9zbxi72jdXMRi166KceyNsKphLJnBedAYYZQnulix556lyG2.O', 'Employee', 'I3JD0Yya59JkYqh8k7qMFwtI4Zh5Cd8AuHPBlGYZTVatKQgBfEILT1QQ3cCG', NULL, '2017-02-08 00:30:27', '2017-02-19 01:39:34'),
(3, 'Andre', 3, 'andrevalerian@yahoo.com', '$2y$10$3vxnRS1MBKa5n7JwYIv88eVXjM33CbnDMBvfEFYn/eVn7KCeLxzqG', 'Employee', 'fqce6wWBzKIL3CauiCveA7afvwTCPP1S4LtJM0TS3xr7AkUhM76Dxac43382', NULL, '2017-02-19 01:38:57', '2017-02-19 02:30:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `backups_name_unique` (`name`),
  ADD UNIQUE KEY `backups_file_name_unique` (`file_name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_dept_foreign` (`dept`);

--
-- Indexes for table `la_configs`
--
ALTER TABLE `la_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `la_menus`
--
ALTER TABLE `la_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_fields`
--
ALTER TABLE `module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_fields_module_foreign` (`module`),
  ADD KEY `module_fields_field_type_foreign` (`field_type`);

--
-- Indexes for table `module_field_types`
--
ALTER TABLE `module_field_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_name_unique` (`name`),
  ADD UNIQUE KEY `organizations_email_unique` (`email`),
  ADD KEY `organizations_assigned_to_foreign` (`assigned_to`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_no_telepon_unique` (`no_telepon`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD KEY `roles_parent_foreign` (`parent`),
  ADD KEY `roles_dept_foreign` (`dept`);

--
-- Indexes for table `role_module`
--
ALTER TABLE `role_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_role_id_foreign` (`role_id`),
  ADD KEY `role_module_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_fields_role_id_foreign` (`role_id`),
  ADD KEY `role_module_fields_field_id_foreign` (`field_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trucks_kapasitas_unique` (`kapasitas`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `la_configs`
--
ALTER TABLE `la_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `la_menus`
--
ALTER TABLE `la_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `module_fields`
--
ALTER TABLE `module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `module_field_types`
--
ALTER TABLE `module_field_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `role_module`
--
ALTER TABLE `role_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`);

--
-- Constraints for table `module_fields`
--
ALTER TABLE `module_fields`
  ADD CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
