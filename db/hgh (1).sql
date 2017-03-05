-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 02 Mar 2017 pada 05.34
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 7.0.13

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
-- Struktur dari tabel `backups`
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
-- Struktur dari tabel `departments`
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
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Administration', '[]', '#000', NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 'Purchasing', '["purchasing"]', 'blue', NULL, '2017-02-19 00:51:57', '2017-02-19 00:51:57'),
(3, 'Sales & Marketing', '["Sales","Marketing"]', 'Red', NULL, '2017-02-19 00:52:16', '2017-02-19 00:52:16'),
(4, 'Warehouse', '["warehouse"]', 'green', NULL, '2017-02-19 00:52:34', '2017-02-19 00:52:34'),
(5, 'Finance & Accounting', '["finance","accounting"]', 'purple', NULL, '2017-02-19 00:52:56', '2017-02-19 00:52:56'),
(6, 'Board of Directors', '["BOD"]', 'Yellow', NULL, '2017-02-19 00:53:23', '2017-02-19 00:53:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Adhika Dhaneswara', 'Super Admin', 'Male', '8888888888', '', 'dhickoh@gmail.com', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2017-02-08', '2017-02-08', '2017-02-08', NULL, '2017-02-08 00:30:27', '2017-02-08 00:30:27'),
(2, 'derrijohns@gmail.com', 'derrijohns@gmail.com', 'Male', '123456789888', '123456789888', 'derrijohns@gmail.com', 1, '', '', '', '1990-01-01', '1970-01-01', '1990-01-01', NULL, '2017-02-18 15:37:21', '2017-02-18 15:37:21'),
(3, 'Tiesto', 'ass', 'Male', '1234567890', '', 'adhika.dhaneswara@gmail.com', 1, '', '', '', '1990-01-01', '1970-01-01', '1990-01-01', NULL, '2017-02-18 15:57:31', '2017-02-18 15:57:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jenis` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `merk` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `kg_carton` decimal(15,3) NOT NULL,
  `wholesale_kg` decimal(15,3) NOT NULL DEFAULT '0.000',
  `wholesale_carton` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `retail_kg` decimal(15,3) NOT NULL DEFAULT '0.000',
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `deleted_at`, `created_at`, `updated_at`, `jenis`, `merk`, `kg_carton`, `wholesale_kg`, `wholesale_carton`, `retail_kg`, `tipe`) VALUES
(1, NULL, '2017-02-19 06:47:59', '2017-02-19 06:52:12', 1, 2, '18.000', '0.000', 0, '0.000', 'Wholesale');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id`, `deleted_at`, `created_at`, `updated_at`, `nama`) VALUES
(1, NULL, '2017-02-19 06:03:55', '2017-02-19 06:03:55', 'B 11 FQ Slice'),
(2, NULL, '2017-02-19 06:15:17', '2017-02-19 06:15:17', 'B 16 FQ 95 CL BP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `la_configs`
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
-- Dumping data untuk tabel `la_configs`
--

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sitename', '', 'Sistem HGH 1.0', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(2, 'sitename_part1', '', 'Sistem', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(3, 'sitename_part2', '', 'HGH 1.0', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(4, 'sitename_short', '', 'LA', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(5, 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(6, 'sidebar_search', '', '0', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(7, 'show_messages', '', '1', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(8, 'show_notifications', '', '1', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(9, 'show_tasks', '', '1', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(10, 'show_rightsidebar', '', '1', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(11, 'skin', '', 'skin-white', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(12, 'layout', '', 'fixed', '2017-02-08 00:30:15', '2017-02-19 05:53:07'),
(13, 'default_email', '', 'test@example.com', '2017-02-08 00:30:15', '2017-02-19 05:53:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `la_menus`
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
-- Dumping data untuk tabel `la_menus`
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
(12, 'Jenis', 'jenis', 'fa fa-yelp', 'module', 0, 0, '2017-02-19 05:59:02', '2017-02-19 05:59:02'),
(14, 'Merks', 'merks', 'fa fa-tag', 'module', 0, 0, '2017-02-19 06:33:37', '2017-02-19 06:33:37'),
(15, 'Items', 'items', 'fa fa-cube', 'module', 0, 0, '2017-02-19 06:47:31', '2017-02-19 06:47:31'),
(16, 'Penjualans', 'penjualans', 'fa fa-money', 'module', 0, 0, '2017-02-19 07:11:59', '2017-02-19 07:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merks`
--

CREATE TABLE `merks` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nama` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `merks`
--

INSERT INTO `merks` (`id`, `deleted_at`, `created_at`, `updated_at`, `nama`) VALUES
(1, NULL, '2017-02-19 06:34:02', '2017-02-19 06:34:02', 'Amroon'),
(2, NULL, '2017-02-19 06:34:12', '2017-02-19 06:34:12', 'Allana'),
(3, NULL, '2017-02-19 06:34:21', '2017-02-19 06:34:21', 'Roll MK'),
(4, NULL, '2017-02-19 06:34:27', '2017-02-19 06:34:27', 'Al Kabeer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
-- Struktur dari tabel `modules`
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
-- Dumping data untuk tabel `modules`
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
(12, 'Jenis', 'Jenis', 'jenis', 'nama', 'Jeni', 'JenisController', 'fa-yelp', 1, '2017-02-19 05:56:44', '2017-02-19 05:59:02'),
(15, 'Merks', 'Merks', 'merks', 'nama', 'Merk', 'MerksController', 'fa-tag', 1, '2017-02-19 06:31:19', '2017-02-19 06:33:37'),
(16, 'Items', 'Items', 'items', 'jenis', 'Item', 'ItemsController', 'fa-cube', 1, '2017-02-19 06:34:51', '2017-02-19 06:47:31'),
(17, 'Penjualans', 'Penjualans', 'penjualans', 'item', 'Penjualan', 'PenjualansController', 'fa-money', 1, '2017-02-19 07:11:00', '2017-02-19 07:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_fields`
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
-- Dumping data untuk tabel `module_fields`
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
(60, 'nama', 'Nama', 12, 16, 1, '', 0, 256, 1, '', 0, '2017-02-19 05:58:37', '2017-02-19 05:58:37'),
(67, 'nama', 'Nama', 15, 16, 0, '', 0, 256, 1, '', 0, '2017-02-19 06:32:08', '2017-02-19 06:32:08'),
(68, 'jenis', 'Jenis', 16, 7, 0, '', 0, 0, 1, '@jenis', 0, '2017-02-19 06:36:15', '2017-02-19 06:36:15'),
(69, 'merk', 'Merk', 16, 7, 0, '', 0, 0, 1, '@merks', 0, '2017-02-19 06:37:28', '2017-02-19 06:37:28'),
(70, 'kg_carton', 'KG / carton', 16, 6, 0, '', 0, 11, 0, '', 0, '2017-02-19 06:38:03', '2017-02-19 06:38:03'),
(71, 'wholesale_kg', 'Wholesale KG', 16, 6, 0, '0', 0, 11, 1, '', 0, '2017-02-19 06:40:14', '2017-02-19 06:40:14'),
(72, 'wholesale_carton', 'Wholesale Carton', 16, 13, 0, '0', 0, 11, 1, '', 0, '2017-02-19 06:40:45', '2017-02-19 06:40:45'),
(73, 'retail_kg', 'Retail KG', 16, 6, 0, '0', 0, 11, 1, '', 0, '2017-02-19 06:41:45', '2017-02-19 06:41:45'),
(74, 'tipe', 'Tipe', 16, 7, 0, '', 0, 0, 1, '["Wholesale","Retail"]', 0, '2017-02-19 06:51:59', '2017-02-19 06:51:59'),
(75, 'item', 'Item', 17, 7, 0, '', 0, 0, 1, '@items', 0, '2017-02-19 07:11:51', '2017-02-19 07:11:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_field_types`
--

CREATE TABLE `module_field_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `module_field_types`
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
-- Struktur dari tabel `organizations`
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
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualans`
--

CREATE TABLE `penjualans` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
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
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
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
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2017-02-08 00:30:15', '2017-02-08 00:30:15'),
(2, 'EMPLOYEE', 'Employee', '', 1, 1, NULL, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(3, 'SALES_ADMIN', 'Admin Penjualan', 'Admin untuk melakukan penjualan produk ke luar', 1, 3, NULL, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(4, 'PURCHASING_ADMIN', 'Admin Pembelian', 'Admin untuk melakukan beli daging', 1, 2, NULL, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(5, 'WAREHOUSE_ADMIN', 'Admin Warehouse', 'Admin warehouse bertanggung jawab untuk inventori', 1, 4, NULL, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(6, 'CEO', 'CEO', '', 1, 6, NULL, '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(7, 'WAREHOUSE_CIMUNING', 'Admin Cimuning', '', 5, 4, NULL, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(8, 'WAREHOUSE_CAKUNG', 'Admin Cakung', '', 5, 4, NULL, '2017-02-19 01:09:46', '2017-02-19 01:09:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_module`
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
-- Dumping data untuk tabel `role_module`
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
(12, 2, 1, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(13, 2, 2, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(14, 2, 3, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(15, 2, 4, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(16, 2, 5, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(17, 2, 6, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(18, 2, 7, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(19, 2, 8, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(20, 2, 11, 1, 0, 0, 0, '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(21, 3, 1, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(22, 3, 2, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(23, 3, 3, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(24, 3, 4, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(25, 3, 5, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(26, 3, 6, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(27, 3, 7, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(28, 3, 8, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(29, 3, 11, 1, 0, 0, 0, '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(30, 4, 1, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(31, 4, 2, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(32, 4, 3, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(33, 4, 4, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(34, 4, 5, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(35, 4, 6, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(36, 4, 7, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(37, 4, 8, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(38, 4, 11, 1, 0, 0, 0, '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(39, 5, 1, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(40, 5, 2, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(41, 5, 3, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(42, 5, 4, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(43, 5, 5, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(44, 5, 6, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(45, 5, 7, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(46, 5, 8, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(47, 5, 11, 1, 0, 0, 0, '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(48, 6, 1, 1, 0, 0, 0, '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(49, 6, 2, 1, 0, 0, 0, '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(50, 6, 3, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(51, 6, 4, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(52, 6, 5, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(53, 6, 6, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(54, 6, 7, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(55, 6, 8, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(56, 6, 11, 1, 0, 0, 0, '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(57, 7, 1, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(58, 7, 2, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(59, 7, 3, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(60, 7, 4, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(61, 7, 5, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(62, 7, 6, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(63, 7, 7, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(64, 7, 8, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(65, 7, 11, 1, 0, 0, 0, '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(66, 8, 1, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(67, 8, 2, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(68, 8, 3, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(69, 8, 4, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(70, 8, 5, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(71, 8, 6, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(72, 8, 7, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(73, 8, 8, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(74, 8, 11, 1, 0, 0, 0, '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(75, 1, 12, 1, 1, 1, 1, '2017-02-19 05:59:02', '2017-02-19 05:59:02'),
(77, 1, 15, 1, 1, 1, 1, '2017-02-19 06:33:37', '2017-02-19 06:33:37'),
(78, 1, 16, 1, 1, 1, 1, '2017-02-19 06:47:31', '2017-02-19 06:47:31'),
(79, 1, 17, 1, 1, 1, 1, '2017-02-19 07:11:59', '2017-02-19 07:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_module_fields`
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
-- Dumping data untuk tabel `role_module_fields`
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
(60, 2, 1, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(61, 2, 2, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(62, 2, 3, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(63, 2, 4, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(64, 2, 5, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(65, 2, 6, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(66, 2, 7, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(67, 2, 8, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(68, 2, 9, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(69, 2, 10, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(70, 2, 11, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(71, 2, 12, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(72, 2, 13, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(73, 2, 14, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(74, 2, 15, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(75, 2, 16, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(76, 2, 17, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(77, 2, 18, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(78, 2, 19, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(79, 2, 20, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(80, 2, 21, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(81, 2, 22, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(82, 2, 23, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(83, 2, 24, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(84, 2, 25, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(85, 2, 26, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(86, 2, 27, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(87, 2, 28, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(89, 2, 30, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(90, 2, 31, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(91, 2, 32, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(92, 2, 33, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(93, 2, 34, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(94, 2, 35, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(95, 2, 36, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(96, 2, 37, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(97, 2, 38, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(98, 2, 39, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(99, 2, 40, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(100, 2, 41, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(101, 2, 42, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(102, 2, 43, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(103, 2, 44, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(104, 2, 45, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(105, 2, 46, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(106, 2, 47, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(107, 2, 48, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(108, 2, 49, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(109, 2, 50, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(110, 2, 51, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(111, 2, 56, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(112, 2, 57, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(113, 2, 58, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(114, 2, 59, 'readonly', '2017-02-18 15:36:45', '2017-02-18 15:36:45'),
(115, 3, 1, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(116, 3, 2, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(117, 3, 3, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(118, 3, 4, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(119, 3, 5, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(120, 3, 6, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(121, 3, 7, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(122, 3, 8, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(123, 3, 9, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(124, 3, 10, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(125, 3, 11, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(126, 3, 12, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(127, 3, 13, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(128, 3, 14, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(129, 3, 15, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(130, 3, 16, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(131, 3, 17, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(132, 3, 18, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(133, 3, 19, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(134, 3, 20, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(135, 3, 21, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(136, 3, 22, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(137, 3, 23, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(138, 3, 24, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(139, 3, 25, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(140, 3, 26, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(141, 3, 27, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(142, 3, 28, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(144, 3, 30, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(145, 3, 31, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(146, 3, 32, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(147, 3, 33, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(148, 3, 34, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(149, 3, 35, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(150, 3, 36, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(151, 3, 37, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(152, 3, 38, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(153, 3, 39, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(154, 3, 40, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(155, 3, 41, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(156, 3, 42, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(157, 3, 43, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(158, 3, 44, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(159, 3, 45, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(160, 3, 46, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(161, 3, 47, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(162, 3, 48, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(163, 3, 49, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(164, 3, 50, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(165, 3, 51, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(166, 3, 56, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(167, 3, 57, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(168, 3, 58, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(169, 3, 59, 'readonly', '2017-02-19 01:00:11', '2017-02-19 01:00:11'),
(170, 4, 1, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(171, 4, 2, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(172, 4, 3, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(173, 4, 4, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(174, 4, 5, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(175, 4, 6, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(176, 4, 7, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(177, 4, 8, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(178, 4, 9, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(179, 4, 10, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(180, 4, 11, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(181, 4, 12, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(182, 4, 13, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(183, 4, 14, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(184, 4, 15, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(185, 4, 16, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(186, 4, 17, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(187, 4, 18, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(188, 4, 19, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(189, 4, 20, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(190, 4, 21, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(191, 4, 22, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(192, 4, 23, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(193, 4, 24, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(194, 4, 25, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(195, 4, 26, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(196, 4, 27, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(197, 4, 28, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(199, 4, 30, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(200, 4, 31, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(201, 4, 32, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(202, 4, 33, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(203, 4, 34, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(204, 4, 35, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(205, 4, 36, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(206, 4, 37, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(207, 4, 38, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(208, 4, 39, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(209, 4, 40, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(210, 4, 41, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(211, 4, 42, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(212, 4, 43, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(213, 4, 44, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(214, 4, 45, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(215, 4, 46, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(216, 4, 47, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(217, 4, 48, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(218, 4, 49, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(219, 4, 50, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(220, 4, 51, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(221, 4, 56, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(222, 4, 57, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(223, 4, 58, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(224, 4, 59, 'readonly', '2017-02-19 01:02:52', '2017-02-19 01:02:52'),
(225, 5, 1, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(226, 5, 2, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(227, 5, 3, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(228, 5, 4, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(229, 5, 5, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(230, 5, 6, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(231, 5, 7, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(232, 5, 8, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(233, 5, 9, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(234, 5, 10, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(235, 5, 11, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(236, 5, 12, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(237, 5, 13, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(238, 5, 14, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(239, 5, 15, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(240, 5, 16, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(241, 5, 17, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(242, 5, 18, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(243, 5, 19, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(244, 5, 20, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(245, 5, 21, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(246, 5, 22, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(247, 5, 23, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(248, 5, 24, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(249, 5, 25, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(250, 5, 26, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(251, 5, 27, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(252, 5, 28, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(254, 5, 30, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(255, 5, 31, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(256, 5, 32, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(257, 5, 33, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(258, 5, 34, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(259, 5, 35, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(260, 5, 36, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(261, 5, 37, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(262, 5, 38, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(263, 5, 39, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(264, 5, 40, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(265, 5, 41, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(266, 5, 42, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(267, 5, 43, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(268, 5, 44, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(269, 5, 45, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(270, 5, 46, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(271, 5, 47, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(272, 5, 48, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(273, 5, 49, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(274, 5, 50, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(275, 5, 51, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(276, 5, 56, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(277, 5, 57, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(278, 5, 58, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(279, 5, 59, 'readonly', '2017-02-19 01:05:37', '2017-02-19 01:05:37'),
(280, 6, 1, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(281, 6, 2, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(282, 6, 3, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(283, 6, 4, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(284, 6, 5, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(285, 6, 6, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(286, 6, 7, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(287, 6, 8, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(288, 6, 9, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(289, 6, 10, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(290, 6, 11, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(291, 6, 12, 'readonly', '2017-02-19 01:05:55', '2017-02-19 01:05:55'),
(292, 6, 13, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(293, 6, 14, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(294, 6, 15, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(295, 6, 16, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(296, 6, 17, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(297, 6, 18, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(298, 6, 19, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(299, 6, 20, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(300, 6, 21, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(301, 6, 22, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(302, 6, 23, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(303, 6, 24, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(304, 6, 25, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(305, 6, 26, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(306, 6, 27, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(307, 6, 28, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(309, 6, 30, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(310, 6, 31, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(311, 6, 32, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(312, 6, 33, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(313, 6, 34, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(314, 6, 35, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(315, 6, 36, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(316, 6, 37, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(317, 6, 38, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(318, 6, 39, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(319, 6, 40, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(320, 6, 41, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(321, 6, 42, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(322, 6, 43, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(323, 6, 44, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(324, 6, 45, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(325, 6, 46, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(326, 6, 47, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(327, 6, 48, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(328, 6, 49, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(329, 6, 50, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(330, 6, 51, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(331, 6, 56, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(332, 6, 57, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(333, 6, 58, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(334, 6, 59, 'readonly', '2017-02-19 01:05:56', '2017-02-19 01:05:56'),
(335, 7, 1, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(336, 7, 2, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(337, 7, 3, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(338, 7, 4, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(339, 7, 5, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(340, 7, 6, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(341, 7, 7, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(342, 7, 8, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(343, 7, 9, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(344, 7, 10, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(345, 7, 11, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(346, 7, 12, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(347, 7, 13, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(348, 7, 14, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(349, 7, 15, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(350, 7, 16, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(351, 7, 17, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(352, 7, 18, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(353, 7, 19, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(354, 7, 20, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(355, 7, 21, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(356, 7, 22, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(357, 7, 23, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(358, 7, 24, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(359, 7, 25, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(360, 7, 26, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(361, 7, 27, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(362, 7, 28, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(364, 7, 30, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(365, 7, 31, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(366, 7, 32, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(367, 7, 33, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(368, 7, 34, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(369, 7, 35, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(370, 7, 36, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(371, 7, 37, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(372, 7, 38, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(373, 7, 39, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(374, 7, 40, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(375, 7, 41, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(376, 7, 42, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(377, 7, 43, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(378, 7, 44, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(379, 7, 45, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(380, 7, 46, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(381, 7, 47, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(382, 7, 48, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(383, 7, 49, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(384, 7, 50, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(385, 7, 51, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(386, 7, 56, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(387, 7, 57, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(388, 7, 58, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(389, 7, 59, 'readonly', '2017-02-19 01:09:08', '2017-02-19 01:09:08'),
(390, 8, 1, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(391, 8, 2, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(392, 8, 3, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(393, 8, 4, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(394, 8, 5, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(395, 8, 6, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(396, 8, 7, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(397, 8, 8, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(398, 8, 9, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(399, 8, 10, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(400, 8, 11, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(401, 8, 12, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(402, 8, 13, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(403, 8, 14, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(404, 8, 15, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(405, 8, 16, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(406, 8, 17, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(407, 8, 18, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(408, 8, 19, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(409, 8, 20, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(410, 8, 21, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(411, 8, 22, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(412, 8, 23, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(413, 8, 24, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(414, 8, 25, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(415, 8, 26, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(416, 8, 27, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(417, 8, 28, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(419, 8, 30, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(420, 8, 31, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(421, 8, 32, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(422, 8, 33, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(423, 8, 34, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(424, 8, 35, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(425, 8, 36, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(426, 8, 37, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(427, 8, 38, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(428, 8, 39, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(429, 8, 40, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(430, 8, 41, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(431, 8, 42, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(432, 8, 43, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(433, 8, 44, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(434, 8, 45, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(435, 8, 46, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(436, 8, 47, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(437, 8, 48, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(438, 8, 49, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(439, 8, 50, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(440, 8, 51, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(441, 8, 56, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(442, 8, 57, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(443, 8, 58, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(444, 8, 59, 'readonly', '2017-02-19 01:09:46', '2017-02-19 01:09:46'),
(445, 1, 60, 'write', '2017-02-19 05:58:37', '2017-02-19 05:58:37'),
(452, 1, 67, 'write', '2017-02-19 06:32:08', '2017-02-19 06:32:08'),
(453, 1, 68, 'write', '2017-02-19 06:36:15', '2017-02-19 06:36:15'),
(454, 1, 69, 'write', '2017-02-19 06:37:28', '2017-02-19 06:37:28'),
(455, 1, 70, 'write', '2017-02-19 06:38:03', '2017-02-19 06:38:03'),
(456, 1, 71, 'write', '2017-02-19 06:40:14', '2017-02-19 06:40:14'),
(457, 1, 72, 'write', '2017-02-19 06:40:45', '2017-02-19 06:40:45'),
(458, 1, 73, 'write', '2017-02-19 06:41:45', '2017-02-19 06:41:45'),
(459, 1, 74, 'write', '2017-02-19 06:51:59', '2017-02-19 06:51:59'),
(460, 1, 75, 'write', '2017-02-19 07:11:51', '2017-02-19 07:11:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(4, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trucks`
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
-- Dumping data untuk tabel `trucks`
--

INSERT INTO `trucks` (`id`, `deleted_at`, `created_at`, `updated_at`, `name`, `nomor_polisi`, `kapasitas`, `status`) VALUES
(1, NULL, '2017-02-08 01:20:21', '2017-02-08 01:20:21', 'Mitsubishi Lancer', 'B 2393 KRI', 250, 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uploads`
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
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Adhika Dhaneswara', 1, 'dhickoh@gmail.com', '$2y$10$dkq9zbxi72jdXMRi166KceyNsKphLJnBedAYYZQnulix556lyG2.O', 'Employee', 'HaJelAVnTxyIo70QPHxuxLa0ZOZlAjEiHz6mli2xpHwLH0vfbywymoLNlXuS', NULL, '2017-02-08 00:30:27', '2017-02-19 02:11:38'),
(2, 'derrijohns@gmail.com', 2, 'derrijohns@gmail.com', '$2y$10$645Ts9lyoag.mVo4H3IMweybStrbH1ufXczsHS5ojyN3IsP0rAR6y', 'Employee', NULL, NULL, '2017-02-18 15:37:21', '2017-02-18 15:37:21'),
(3, 'Tiesto', 3, 'adhika.dhaneswara@gmail.com', '$2y$10$vsAu.CCAGIvYLxwqfcSCEOwxMHDiE0Q7i36PZsek.qeTAWwwuEtUy', 'Employee', '1HDfdO1V9Q00mOsbFnYiItez69nbFknRBI55wJK6xmfaq2Y69emmUw05elBG', NULL, '2017-02-18 15:57:31', '2017-02-19 02:30:12');

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
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_jenis_foreign` (`jenis`),
  ADD KEY `items_merk_foreign` (`merk`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `merks`
--
ALTER TABLE `merks`
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
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualans_item_foreign` (`item`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `la_configs`
--
ALTER TABLE `la_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `la_menus`
--
ALTER TABLE `la_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `merks`
--
ALTER TABLE `merks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `module_fields`
--
ALTER TABLE `module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
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
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `role_module`
--
ALTER TABLE `role_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`);

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_jenis_foreign` FOREIGN KEY (`jenis`) REFERENCES `jenis` (`id`),
  ADD CONSTRAINT `items_merk_foreign` FOREIGN KEY (`merk`) REFERENCES `merks` (`id`);

--
-- Ketidakleluasaan untuk tabel `module_fields`
--
ALTER TABLE `module_fields`
  ADD CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`);

--
-- Ketidakleluasaan untuk tabel `penjualans`
--
ALTER TABLE `penjualans`
  ADD CONSTRAINT `penjualans_item_foreign` FOREIGN KEY (`item`) REFERENCES `items` (`id`);

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
