-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 09:10 AM
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
-- Database: `promiti_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(2, NULL, 1, 'Category 2', 'category-2', '2024-11-27 00:29:24', '2024-11-27 00:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `counting_units`
--

CREATE TABLE `counting_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(75) NOT NULL,
  `posting_type` tinyint(4) NOT NULL COMMENT '1 = Draft, 2 = Final',
  `unit_added_on` datetime NOT NULL,
  `unit_added_by` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID',
  `unit_edited_on` datetime DEFAULT NULL,
  `unit_edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User ID',
  `operation_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counting_units`
--

INSERT INTO `counting_units` (`id`, `unit_name`, `posting_type`, `unit_added_on`, `unit_added_by`, `unit_edited_on`, `unit_edited_by`, `operation_ip`) VALUES
(1, 'Pices', 1, '2024-12-08 15:22:00', 1, NULL, NULL, '127.0.0.1'),
(2, 'Packet', 2, '2024-12-08 15:23:00', 1, NULL, NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'emp_name', 'text', 'Emp Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'emp_designation', 'text', 'Emp Designation', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'emp_email', 'text', 'Emp Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 8, 'emp_mobile', 'number', 'Emp Mobile', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 8, 'emp_address', 'text', 'Emp Address', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(63, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(64, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(66, 9, 'class', 'text', 'Class', 1, 1, 1, 1, 1, 1, '{}', 3),
(67, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(68, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(69, 11, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 11, 'key', 'text', 'Key', 1, 1, 1, 1, 1, 1, '{}', 2),
(71, 11, 'table_name', 'text', 'Table Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(72, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(73, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(74, 12, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 12, 'category_name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(76, 12, 'posting_type', 'select_dropdown', 'Posting Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"Draft\",\"2\":\"Final\"}}', 3),
(77, 12, 'cat_added_on', 'timestamp', 'Cat Added On', 1, 1, 1, 1, 1, 1, '{}', 4),
(78, 12, 'cat_added_by', 'text', 'Cat Added By', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\"}', 5),
(79, 12, 'cat_edited_on', 'text', 'Cat Edited On', 0, 0, 0, 0, 0, 0, '{}', 6),
(80, 12, 'cat_edited_by', 'text', 'Cat Edited By', 0, 0, 0, 0, 0, 0, '{}', 7),
(81, 12, 'operation_ip', 'text', 'Operation Ip', 1, 1, 1, 1, 1, 1, '{\"default\":\"127.0.0.1\"}', 8),
(82, 13, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 13, 'unit_name', 'text', 'Unit Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(84, 13, 'posting_type', 'select_dropdown', 'Posting Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"Draft\",\"2\":\"Final\"}}', 3),
(85, 13, 'unit_added_on', 'timestamp', 'Unit Added On', 1, 1, 1, 1, 1, 1, '{}', 4),
(86, 13, 'unit_added_by', 'text', 'Unit Added By', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\"}', 5),
(87, 13, 'unit_edited_on', 'hidden', 'Unit Edited On', 0, 1, 1, 1, 1, 1, '{}', 6),
(88, 13, 'unit_edited_by', 'hidden', 'Unit Edited By', 0, 1, 1, 1, 1, 1, '{}', 7),
(89, 13, 'operation_ip', 'text', 'Operation Ip', 1, 1, 1, 1, 1, 1, '{\"default\":\"127.0.0.1\"}', 8),
(90, 14, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(91, 14, 'supplier_name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(92, 14, 'contact_person', 'text', 'Contact Person', 0, 1, 1, 1, 1, 1, '{}', 3),
(93, 14, 'supplier_mobile', 'text', 'Mobile', 1, 1, 1, 1, 1, 1, '{}', 4),
(94, 14, 'supplier_email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 5),
(95, 14, 'supplier_address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 14, 'posting_type', 'select_dropdown', 'Posting Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"Draft\",\"2\":\"Final\"}}', 7),
(97, 14, 'comments', 'text', 'Comments', 0, 0, 1, 1, 1, 1, '{}', 8),
(98, 14, 'supl_added_on', 'timestamp', 'Added On', 1, 0, 1, 1, 1, 1, '{}', 9),
(99, 14, 'supl_added_by', 'text', 'Added By', 1, 0, 1, 1, 1, 1, '{\"default\":\"1\"}', 10),
(100, 14, 'supl_edited_on', 'hidden', 'Supl Edited On', 0, 0, 0, 0, 0, 0, '{}', 11),
(101, 14, 'supl_edited_by', 'hidden', 'Supl Edited By', 0, 0, 0, 0, 0, 0, '{}', 12),
(102, 14, 'operation_ip', 'text', 'Ip Address', 1, 0, 1, 1, 1, 1, '{\"default\":\"127.0.0.1\"}', 13),
(103, 15, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 15, 'from_year', 'date', 'From Year', 1, 1, 1, 1, 1, 1, '{}', 2),
(105, 15, 'to_year', 'date', 'To Year', 1, 1, 1, 1, 1, 1, '{}', 3),
(106, 15, 'fin_status', 'select_dropdown', 'Fin Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"Active\",\"2\":\"Inactive\"}}', 4),
(107, 15, 'fin_added_on', 'timestamp', 'Fin Added On', 1, 0, 1, 1, 1, 1, '{}', 5),
(108, 15, 'fin_added_by', 'text', 'Fin Added By', 1, 0, 1, 1, 1, 1, '{}', 6),
(109, 15, 'fin_edited_on', 'hidden', 'Fin Edited On', 0, 0, 0, 0, 0, 0, '{}', 7),
(110, 15, 'fin_edited_by', 'hidden', 'Fin Edited By', 0, 0, 0, 0, 0, 0, '{}', 8),
(111, 15, 'operation_ip', 'text', 'Operation Ip', 1, 0, 1, 1, 1, 1, '{\"default\":\"127.0.0.1\"}', 9),
(112, 16, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(113, 16, 'org_name_en', 'text', 'Name (En)', 1, 1, 1, 1, 1, 1, '{}', 2),
(114, 16, 'org_name_bn', 'text', 'Name (Bn)', 0, 1, 1, 1, 1, 1, '{}', 3),
(115, 16, 'org_phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(116, 16, 'org_mobile', 'text', 'Mobile', 0, 1, 1, 1, 1, 1, '{}', 5),
(117, 16, 'org_email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 6),
(118, 16, 'org_address', 'text', 'Org Address', 0, 1, 1, 1, 1, 1, '{}', 7),
(119, 16, 'org_main', 'select_dropdown', 'Org Main', 1, 1, 1, 1, 1, 1, '{\"default\":\"2\",\"options\":{\"1\":\"Yes\",\"2\":\"No\"}}', 8),
(120, 16, 'org_type', 'select_dropdown', 'Org Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"BR\",\"options\":{\"HQ\":\"HQ\",\"ZN\":\"ZN\",\"AR\":\"AR\",\"BR\":\"BR\",\"ORG\":\"Main ORG\"}}', 9);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-11-27 00:29:21', '2024-11-27 00:29:21'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-11-27 00:29:21', '2024-11-27 00:29:21'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-11-27 00:29:21', '2024-11-27 00:29:21'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-11-27 00:29:23', '2024-11-27 00:29:23'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(8, 'employees', 'employees', 'Employee', 'Employees', NULL, 'App\\Models\\Employee', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(9, 'students', 'students', 'Student', 'Students', NULL, 'App\\Models\\Student', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(11, 'permissions', 'permissions', 'Permission', 'Permissions', NULL, 'App\\Models\\Permission', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-12-08 00:21:43', '2024-12-08 00:21:43'),
(12, 'item_categories', 'item-categories', 'Item Category', 'Item Categories', NULL, 'App\\Models\\ItemCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-12-08 00:27:23', '2024-12-08 03:11:14'),
(13, 'counting_units', 'counting-units', 'Counting Unit', 'Counting Units', NULL, 'App\\Models\\CountingUnit', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-12-08 03:19:53', '2024-12-08 03:22:30'),
(14, 'supplier_infos', 'supplier-infos', 'Supplier Info', 'Supplier Infos', NULL, 'App\\Models\\SupplierInfo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-12-08 03:29:02', '2024-12-08 03:37:29'),
(15, 'financial_years', 'financial-years', 'Financial Year', 'Financial Years', NULL, 'App\\Models\\FinancialYear', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-12-08 03:44:06', '2024-12-08 03:44:06'),
(16, 'org_infos', 'org-infos', 'Org Info', 'Org Infos', NULL, 'App\\Models\\OrgInfo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-12-08 03:52:40', '2024-12-08 03:57:22');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_designation` varchar(150) NOT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  `emp_mobile` int(11) DEFAULT NULL,
  `emp_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `emp_name`, `emp_designation`, `emp_email`, `emp_mobile`, `emp_address`, `created_at`, `updated_at`) VALUES
(1, 'Md. Kamal Hossain', 'Sr. Programmer', 'kamal@promiti.com', 1818658676, 'Cumilla, Bangladesh', '2024-11-27 00:52:43', '2024-11-27 00:52:43'),
(2, 'Md. Akmal Hossain', 'Programmer', 'akmal@promiti.com', 1738279545, 'Thakurgaon, Bangladesh', '2024-11-27 00:53:00', '2024-11-27 00:53:48'),
(4, 'Md. Jama Hossain', 'Jr. Programmer', 'jamal@promiti.com', 1618658676, 'Dhaka, Bangladesh', '2024-11-27 04:13:01', '2024-11-27 23:52:22'),
(6, 'Md. Mahmudul Hasan Rimon', 'Jr. Programmer', 'rimon@promiti.com', 1818658965, 'Ranjpur, Bangladesh', '2024-11-27 23:40:27', '2024-11-27 23:40:27'),
(7, 'Md. Gulam Muktadir', 'Asst. Programmer', 'moktadir@promiti.com', 1852321456, 'Ranjpur, Bangladesh', '2024-11-27 23:41:22', '2024-11-27 23:41:22'),
(8, 'Md. Evadat Hossain Mina', 'IT Manager', 'ebadat@promiti.com', 1717017859, 'Gopalgong, Bangladesh', '2024-11-27 23:42:14', '2024-11-27 23:42:14'),
(9, 'Md. Kamrul Hasan Kongkon', 'Communication Manager', 'kamrul@promiti.com', 1818658676, 'Cumilla, Bangladesh', '2024-11-27 23:43:37', '2024-11-27 23:43:37'),
(10, 'Md. Samsul Arefin', 'Support Engineer', 'arefin@promiti.com', 1717070525, 'Ibrahimpur, Dhaka', '2024-11-27 23:59:42', '2024-11-27 23:59:42'),
(11, 'Md. Shahalam', 'HR Admin', 'alam@promiti.com', 1818659586, 'Manikgang, Bangladesh', '2024-11-28 00:01:02', '2024-11-28 00:01:02'),
(12, 'Md. Khalilur Rahman', 'Driver', 'khalil@promiti.com', 1717052368, 'Barishal,Bangladesh', '2024-11-28 00:01:51', '2024-11-28 00:01:51'),
(13, 'Md. Monir Hossain', 'Office Assistant', 'monir@promiti.com', 1552632598, 'Cumilla, Bangladesh', '2024-11-28 00:02:30', '2024-11-28 00:02:30'),
(14, 'Md. Omar Faruk', 'Marketing Manager', 'faruk@promiti.com', 1615869547, 'Cumilla, Bangladesh', '2024-11-28 00:03:30', '2024-11-28 00:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_year` date NOT NULL,
  `to_year` date NOT NULL,
  `fin_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = ACTIVE, 2 = INACTIVE',
  `fin_added_on` datetime NOT NULL,
  `fin_added_by` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID',
  `fin_edited_on` datetime DEFAULT NULL,
  `fin_edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User ID',
  `operation_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `from_year`, `to_year`, `fin_status`, `fin_added_on`, `fin_added_by`, `fin_edited_on`, `fin_edited_by`, `operation_ip`) VALUES
(1, '2024-07-01', '2025-06-30', 1, '2024-12-08 15:44:00', 1, NULL, NULL, '127.0.0.1'),
(2, '2023-07-01', '2024-06-01', 2, '2024-12-08 15:45:00', 1, NULL, NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `posting_type` tinyint(4) NOT NULL COMMENT '1 = Draft, 2 = Final',
  `cat_added_on` datetime NOT NULL,
  `cat_added_by` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID',
  `cat_edited_on` datetime DEFAULT NULL,
  `cat_edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User ID',
  `operation_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `category_name`, `posting_type`, `cat_added_on`, `cat_added_by`, `cat_edited_on`, `cat_edited_by`, `operation_ip`) VALUES
(1, 'Furniture and Fixture', 1, '2024-12-21 15:08:00', 5, NULL, NULL, '127.0.0.1'),
(2, 'Office Equepment', 1, '2024-12-08 15:11:00', 1, NULL, NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(2, 'User Menu', '2024-11-27 00:55:01', '2024-11-27 00:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `permission`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', NULL, '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-11-27 00:29:22', '2024-11-27 00:29:22', 'voyager.dashboard', NULL),
(2, 1, 'Media', NULL, '', '_self', 'voyager-images', NULL, NULL, 4, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.media.index', NULL),
(3, 1, 'Users', NULL, '', '_self', 'voyager-person', NULL, NULL, 3, '2024-11-27 00:29:22', '2024-11-27 00:29:22', 'voyager.users.index', NULL),
(4, 1, 'Roles', NULL, '', '_self', 'voyager-lock', NULL, NULL, 2, '2024-11-27 00:29:22', '2024-11-27 00:29:22', 'voyager.roles.index', NULL),
(5, 1, 'Tools', NULL, '', '_self', 'voyager-tools', NULL, NULL, 8, '2024-11-27 00:29:22', '2024-11-27 00:30:46', NULL, NULL),
(6, 1, 'Menu Builder', NULL, '', '_self', 'voyager-list', NULL, 5, 1, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.menus.index', NULL),
(7, 1, 'Database', NULL, '', '_self', 'voyager-data', NULL, 5, 2, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.database.index', NULL),
(8, 1, 'Compass', NULL, '', '_self', 'voyager-compass', NULL, 5, 3, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', NULL, '', '_self', 'voyager-bread', NULL, 5, 4, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.bread.index', NULL),
(10, 1, 'Settings', NULL, '', '_self', 'voyager-settings', NULL, NULL, 9, '2024-11-27 00:29:22', '2024-11-27 00:30:46', 'voyager.settings.index', NULL),
(11, 1, 'Categories', NULL, '', '_self', 'voyager-categories', NULL, NULL, 7, '2024-11-27 00:29:24', '2024-11-27 00:30:46', 'voyager.categories.index', NULL),
(12, 1, 'Posts', NULL, '', '_self', 'voyager-news', '#000000', NULL, 5, '2024-11-27 00:29:25', '2024-11-27 00:40:02', 'voyager.posts.index', 'null'),
(13, 1, 'Pages', NULL, '', '_self', 'voyager-file-text', NULL, NULL, 6, '2024-11-27 00:29:25', '2024-11-27 00:30:46', 'voyager.pages.index', NULL),
(14, 1, 'Employees', NULL, '', '_self', NULL, NULL, NULL, 10, '2024-11-27 00:51:49', '2024-11-27 00:51:49', 'voyager.employees.index', NULL),
(16, 2, 'Employee', 'browse_employees', 'employees', '_self', NULL, '#000000', 18, 1, '2024-11-27 00:56:32', '2024-11-30 23:51:54', NULL, ''),
(17, 2, 'Student Info', 'browse_students', 'students', '_self', NULL, '#000000', 18, 2, '2024-11-30 23:50:21', '2024-12-01 00:03:30', NULL, ''),
(18, 2, 'Cofigaration', 'browse_employees', '#', '_self', NULL, '#000000', NULL, 1, '2024-11-30 23:51:44', '2024-11-30 23:54:11', NULL, ''),
(19, 1, 'Students', NULL, '', '_self', NULL, NULL, NULL, 11, '2024-12-01 00:02:03', '2024-12-01 00:02:03', 'voyager.students.index', NULL),
(20, 1, 'Permissions', NULL, '', '_self', NULL, NULL, NULL, 12, '2024-12-08 00:21:44', '2024-12-08 00:21:44', 'voyager.permissions.index', NULL),
(21, 1, 'Item Categories', NULL, '', '_self', NULL, NULL, 24, 1, '2024-12-08 00:27:24', '2024-12-08 03:39:16', 'voyager.item-categories.index', NULL),
(22, 1, 'Counting Units', NULL, '', '_self', NULL, NULL, 24, 2, '2024-12-08 03:19:54', '2024-12-08 03:39:25', 'voyager.counting-units.index', NULL),
(23, 1, 'Supplier Infos', NULL, '', '_self', NULL, NULL, 24, 3, '2024-12-08 03:29:02', '2024-12-08 03:39:30', 'voyager.supplier-infos.index', NULL),
(24, 1, 'Configuration', NULL, '#', '_self', NULL, '#000000', NULL, 13, '2024-12-08 03:39:03', '2024-12-08 03:39:30', NULL, ''),
(25, 1, 'Financial Years', NULL, '', '_self', NULL, NULL, NULL, 14, '2024-12-08 03:44:07', '2024-12-08 03:44:07', 'voyager.financial-years.index', NULL),
(26, 1, 'Org Infos', NULL, '', '_self', NULL, NULL, NULL, 15, '2024-12-08 03:52:41', '2024-12-08 03:52:41', 'voyager.org-infos.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(58, '2014_10_12_000000_create_users_table', 1),
(59, '2014_10_12_100000_create_password_resets_table', 1),
(60, '2016_01_01_000000_add_voyager_user_fields', 1),
(61, '2016_01_01_000000_create_data_types_table', 1),
(62, '2016_01_01_000000_create_pages_table', 1),
(63, '2016_01_01_000000_create_posts_table', 1),
(64, '2016_02_15_204651_create_categories_table', 1),
(65, '2016_05_19_173453_create_menu_table', 1),
(66, '2016_10_21_190000_create_roles_table', 1),
(67, '2016_10_21_190000_create_settings_table', 1),
(68, '2016_11_30_135954_create_permission_table', 1),
(69, '2016_11_30_141208_create_permission_role_table', 1),
(70, '2016_12_26_201236_data_types__add__server_side', 1),
(71, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(72, '2017_01_14_005015_create_translations_table', 1),
(73, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(74, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(75, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(76, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(77, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(78, '2017_08_05_000000_add_group_to_settings_table', 1),
(79, '2017_11_26_013050_add_user_role_relationship', 1),
(80, '2017_11_26_015000_create_user_roles_table', 1),
(81, '2018_03_11_000000_add_user_settings', 1),
(82, '2018_03_14_000000_add_details_to_data_types_table', 1),
(83, '2018_03_16_000000_make_settings_value_nullable', 1),
(84, '2019_08_19_000000_create_failed_jobs_table', 1),
(85, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(86, '2024_12_08_060730_create_fixed_asset_config_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `org_infos`
--

CREATE TABLE `org_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `org_name_en` varchar(75) NOT NULL,
  `org_name_bn` varchar(75) DEFAULT NULL,
  `org_phone` varchar(25) DEFAULT NULL,
  `org_mobile` varchar(25) DEFAULT NULL,
  `org_email` varchar(100) DEFAULT NULL,
  `org_address` varchar(250) DEFAULT NULL,
  `org_main` decimal(1,0) NOT NULL DEFAULT 0,
  `org_type` enum('HQ','ZN','AR','BR','ORG') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `org_infos`
--

INSERT INTO `org_infos` (`id`, `org_name_en`, `org_name_bn`, `org_phone`, `org_mobile`, `org_email`, `org_address`, `org_main`, `org_type`) VALUES
(1, 'Gono Kallyan Trust', 'গণ কল্যাণ ট্রাষ্ট', NULL, '01818658676', 'info@gktbd.org', 'Manikgonj', 1, 'HQ'),
(2, 'Adabor Branch', 'আদাবর শাখা', NULL, '01738279545', 'akmal@promiti.com', 'Ring road, Shyamoly', 2, 'BR');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-11-27 00:29:26', '2024-11-27 00:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(2, 'browse_bread', NULL, '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(3, 'browse_database', NULL, '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(4, 'browse_media', NULL, '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(5, 'browse_compass', NULL, '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(6, 'browse_menus', 'menus', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(7, 'read_menus', 'menus', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(8, 'edit_menus', 'menus', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(9, 'add_menus', 'menus', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(10, 'delete_menus', 'menus', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(11, 'browse_roles', 'roles', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(12, 'read_roles', 'roles', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(13, 'edit_roles', 'roles', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(14, 'add_roles', 'roles', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(15, 'delete_roles', 'roles', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(16, 'browse_users', 'users', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(17, 'read_users', 'users', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(18, 'edit_users', 'users', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(19, 'add_users', 'users', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(20, 'delete_users', 'users', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(21, 'browse_settings', 'settings', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(22, 'read_settings', 'settings', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(23, 'edit_settings', 'settings', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(24, 'add_settings', 'settings', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(25, 'delete_settings', 'settings', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(26, 'browse_categories', 'categories', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(27, 'read_categories', 'categories', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(28, 'edit_categories', 'categories', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(29, 'add_categories', 'categories', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(30, 'delete_categories', 'categories', '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(31, 'browse_posts', 'posts', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(32, 'read_posts', 'posts', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(33, 'edit_posts', 'posts', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(34, 'add_posts', 'posts', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(35, 'delete_posts', 'posts', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(36, 'browse_pages', 'pages', '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(37, 'read_pages', 'pages', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(38, 'edit_pages', 'pages', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(39, 'add_pages', 'pages', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(40, 'delete_pages', 'pages', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(41, 'browse_employees', 'employees', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(42, 'read_employees', 'employees', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(43, 'edit_employees', 'employees', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(44, 'add_employees', 'employees', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(45, 'delete_employees', 'employees', '2024-11-27 00:51:49', '2024-11-27 00:51:49'),
(46, 'browse_students', 'students', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(47, 'read_students', 'students', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(48, 'edit_students', 'students', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(49, 'add_students', 'students', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(50, 'delete_students', 'students', '2024-12-01 00:02:03', '2024-12-01 00:02:03'),
(51, 'browse_permissions', 'permissions', '2024-12-08 00:21:44', '2024-12-08 00:21:44'),
(52, 'read_permissions', 'permissions', '2024-12-08 00:21:44', '2024-12-08 00:21:44'),
(53, 'edit_permissions', 'permissions', '2024-12-08 00:21:44', '2024-12-08 00:21:44'),
(54, 'add_permissions', 'permissions', '2024-12-08 00:21:44', '2024-12-08 00:21:44'),
(55, 'delete_permissions', 'permissions', '2024-12-08 00:21:44', '2024-12-08 00:21:44'),
(56, 'browse_item_categories', 'item_categories', '2024-12-08 00:27:24', '2024-12-08 00:27:24'),
(57, 'read_item_categories', 'item_categories', '2024-12-08 00:27:24', '2024-12-08 00:27:24'),
(58, 'edit_item_categories', 'item_categories', '2024-12-08 00:27:24', '2024-12-08 00:27:24'),
(59, 'add_item_categories', 'item_categories', '2024-12-08 00:27:24', '2024-12-08 00:27:24'),
(60, 'delete_item_categories', 'item_categories', '2024-12-08 00:27:24', '2024-12-08 00:27:24'),
(61, 'browse_counting_units', 'counting_units', '2024-12-08 03:19:54', '2024-12-08 03:19:54'),
(62, 'read_counting_units', 'counting_units', '2024-12-08 03:19:54', '2024-12-08 03:19:54'),
(63, 'edit_counting_units', 'counting_units', '2024-12-08 03:19:54', '2024-12-08 03:19:54'),
(64, 'add_counting_units', 'counting_units', '2024-12-08 03:19:54', '2024-12-08 03:19:54'),
(65, 'delete_counting_units', 'counting_units', '2024-12-08 03:19:54', '2024-12-08 03:19:54'),
(66, 'browse_supplier_infos', 'supplier_infos', '2024-12-08 03:29:02', '2024-12-08 03:29:02'),
(67, 'read_supplier_infos', 'supplier_infos', '2024-12-08 03:29:02', '2024-12-08 03:29:02'),
(68, 'edit_supplier_infos', 'supplier_infos', '2024-12-08 03:29:02', '2024-12-08 03:29:02'),
(69, 'add_supplier_infos', 'supplier_infos', '2024-12-08 03:29:02', '2024-12-08 03:29:02'),
(70, 'delete_supplier_infos', 'supplier_infos', '2024-12-08 03:29:02', '2024-12-08 03:29:02'),
(71, 'browse_financial_years', 'financial_years', '2024-12-08 03:44:07', '2024-12-08 03:44:07'),
(72, 'read_financial_years', 'financial_years', '2024-12-08 03:44:07', '2024-12-08 03:44:07'),
(73, 'edit_financial_years', 'financial_years', '2024-12-08 03:44:07', '2024-12-08 03:44:07'),
(74, 'add_financial_years', 'financial_years', '2024-12-08 03:44:07', '2024-12-08 03:44:07'),
(75, 'delete_financial_years', 'financial_years', '2024-12-08 03:44:07', '2024-12-08 03:44:07'),
(76, 'browse_org_infos', 'org_infos', '2024-12-08 03:52:41', '2024-12-08 03:52:41'),
(77, 'read_org_infos', 'org_infos', '2024-12-08 03:52:41', '2024-12-08 03:52:41'),
(78, 'edit_org_infos', 'org_infos', '2024-12-08 03:52:41', '2024-12-08 03:52:41'),
(79, 'add_org_infos', 'org_infos', '2024-12-08 03:52:41', '2024-12-08 03:52:41'),
(80, 'delete_org_infos', 'org_infos', '2024-12-08 03:52:41', '2024-12-08 03:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-11-27 00:29:25', '2024-11-27 00:29:25'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-11-27 00:29:25', '2024-11-27 00:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `post_infos`
--

CREATE TABLE `post_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `org_id` bigint(20) UNSIGNED NOT NULL,
  `post_name_en` varchar(75) NOT NULL,
  `post_name_bn` varchar(75) DEFAULT NULL,
  `post_added_on` datetime NOT NULL,
  `post_added_by` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID',
  `post_edited_on` datetime DEFAULT NULL,
  `post_edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User ID',
  `operation_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(2, 'user', 'Normal User', '2024-11-27 00:29:22', '2024-11-27 00:29:22'),
(3, 'Common User', 'Common User', '2024-11-30 23:46:05', '2024-11-30 23:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Promiti', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `class` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `class`, `created_at`, `updated_at`) VALUES
(1, 'Md. Tafsir Ahammed', 'Ten', '2024-12-01 00:02:35', '2024-12-01 00:02:35'),
(2, 'Imtayaz Ahamed', 'Eleven', '2024-12-01 00:02:53', '2024-12-01 00:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_infos`
--

CREATE TABLE `supplier_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `supplier_mobile` varchar(30) NOT NULL,
  `supplier_email` varchar(100) DEFAULT NULL,
  `supplier_address` varchar(500) DEFAULT NULL,
  `posting_type` tinyint(4) NOT NULL COMMENT '1 = Draft, 2 = Final',
  `comments` varchar(300) DEFAULT NULL,
  `supl_added_on` datetime NOT NULL,
  `supl_added_by` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID',
  `supl_edited_on` datetime DEFAULT NULL,
  `supl_edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User ID',
  `operation_ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_infos`
--

INSERT INTO `supplier_infos` (`id`, `supplier_name`, `contact_person`, `supplier_mobile`, `supplier_email`, `supplier_address`, `posting_type`, `comments`, `supl_added_on`, `supl_added_by`, `supl_edited_on`, `supl_edited_by`, `operation_ip`) VALUES
(1, 'Noor e Modina Engineering', 'Md. Akmal Hossain', '01738279545', 'akmal@promiti.com', 'Thakurgaon', 1, NULL, '2024-12-08 15:31:00', 1, NULL, NULL, '127.0.0.1'),
(2, 'Nova Electronic', 'Md. Kamal Hossain', '01818658676', 'kamal@promit.com', 'Cumilla', 1, NULL, '2024-12-08 15:32:00', 1, NULL, NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-11-27 00:29:26', '2024-11-27 00:29:26'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-11-27 00:29:27', '2024-11-27 00:29:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-11-27 00:29:27', '2024-11-27 00:29:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-11-27 00:29:27', '2024-11-27 00:29:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-11-27 00:29:27', '2024-11-27 00:29:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-11-27 00:29:27', '2024-11-27 00:29:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-11-27 00:29:27', '2024-11-27 00:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$M2bevCa7pjii8PyXI/jtL.VDKEJrOkF0vH9soQG6ux3wL3cF0flc6', 'wHL9cq0dgQJeODACg24cyCdPlx7ITkGjl4V7istQiAH5AsJqyGkvXcLVVltt', NULL, '2024-11-27 00:29:24', '2024-11-27 00:29:24'),
(2, 2, 'Demo User', 'demouser@gmail.com', 'users/default.png', NULL, '$2y$10$RCyX3l7ywGLpJApQdWcSxeveCM5MAw4.biq9aVCF6CNMgc0UZIjsm', '2hT3AOyku6yMt77ZINgQViQiYJ9dEqfamvba3vWkR8trwyBuBaCAyku1voGs', '{\"locale\":\"en\"}', '2024-11-27 00:44:44', '2024-11-27 00:44:44'),
(3, 3, 'Md. Kamal Hossain', 'kamal@promiti.com', 'users/default.png', NULL, '$2y$10$Wm20ImVPdfcQxku3bz5v8.Gh7IoKXL8DFibPYV9wwqjsi.bzMTk42', NULL, '{\"locale\":\"en\"}', '2024-11-30 23:46:48', '2024-11-30 23:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `counting_units`
--
ALTER TABLE `counting_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `financial_years`
--
ALTER TABLE `financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `org_infos`
--
ALTER TABLE `org_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `post_infos`
--
ALTER TABLE `post_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_infos_org_id_foreign` (`org_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_infos`
--
ALTER TABLE `supplier_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `counting_units`
--
ALTER TABLE `counting_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `org_infos`
--
ALTER TABLE `org_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_infos`
--
ALTER TABLE `post_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_infos`
--
ALTER TABLE `supplier_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_infos`
--
ALTER TABLE `post_infos`
  ADD CONSTRAINT `post_infos_org_id_foreign` FOREIGN KEY (`org_id`) REFERENCES `org_infos` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
