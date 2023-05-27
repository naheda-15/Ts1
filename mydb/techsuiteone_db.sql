-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2023 at 09:19 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techsuiteone_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_estimates`
--

CREATE TABLE `accept_estimates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appreciations`
--

CREATE TABLE `appreciations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `award_id` bigint(20) UNSIGNED NOT NULL,
  `award_to` int(10) UNSIGNED NOT NULL,
  `award_date` date NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `clock_in_time` datetime NOT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `clock_in_ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'office',
  `late` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `half_day` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `shift_start_time` datetime DEFAULT NULL,
  `shift_end_time` datetime DEFAULT NULL,
  `employee_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_from_type` enum('home','office','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `overwrite_attendance` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `auto_clock_in` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `auto_clock_in_location` enum('office','home') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'office',
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` int(11) NOT NULL DEFAULT '1',
  `employee_clock_in_out` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `office_open_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[1,2,3,4,5]',
  `ip_address` text COLLATE utf8mb4_unicode_ci,
  `radius` int(11) DEFAULT NULL,
  `radius_check` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `ip_check` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `alert_after` int(11) DEFAULT NULL,
  `alert_after_status` tinyint(1) NOT NULL DEFAULT '1',
  `save_current_location` tinyint(1) NOT NULL DEFAULT '0',
  `default_employee_shift` bigint(20) UNSIGNED DEFAULT '1',
  `week_start_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `allow_shift_change` tinyint(1) NOT NULL DEFAULT '1',
  `show_clock_in_button` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `monthly_report` tinyint(1) NOT NULL DEFAULT '0',
  `monthly_report_roles` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `company_id`, `auto_clock_in`, `auto_clock_in_location`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `employee_clock_in_out`, `office_open_days`, `ip_address`, `radius`, `radius_check`, `ip_check`, `alert_after`, `alert_after_status`, `save_current_location`, `default_employee_shift`, `week_start_from`, `allow_shift_change`, `show_clock_in_button`, `created_at`, `updated_at`, `monthly_report`, `monthly_report_roles`) VALUES
(3, 3, 'no', 'office', '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', NULL, 0, 0, 5, '1', 1, 'no', '2023-05-25 21:34:59', '2023-05-25 21:34:59', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authorize_invoices`
--

CREATE TABLE `authorize_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authorize_subscriptions`
--

CREATE TABLE `authorize_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `award_icon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_icons`
--

CREATE TABLE `award_icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `award_icons`
--

INSERT INTO `award_icons` (`id`, `title`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Trophy', 'trophy', NULL, NULL),
(2, 'Thumbs Up', 'hand-thumbs-up', NULL, NULL),
(3, 'Award', 'award', NULL, NULL),
(4, 'Book', 'book', NULL, NULL),
(5, 'Gift', 'gift', NULL, NULL),
(6, 'Watch', 'watch', NULL, NULL),
(7, 'Cup', 'cup-hot', NULL, NULL),
(8, 'Puzzle', 'puzzle', NULL, NULL),
(9, 'Plane', 'airplane', NULL, NULL),
(10, 'Money', 'piggy-bank', NULL, NULL),
(11, 'Trophy', 'trophy', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(12, 'Thumbs Up', 'hand-thumbs-up', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(13, 'Award', 'award', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(14, 'Book', 'book', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(15, 'Gift', 'gift', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(16, 'Watch', 'watch', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(17, 'Cup', 'cup-hot', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(18, 'Puzzle', 'puzzle', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(19, 'Plane', 'airplane', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(20, 'Money', 'piggy-bank', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(15,2) DEFAULT NULL,
  `bank_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `bank_balance` double(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transactions`
--

CREATE TABLE `bank_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `type` enum('Cr','Dr') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cr',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci,
  `transaction_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_related_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `transaction_date` date DEFAULT NULL,
  `bank_balance` double(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE `client_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `quickbooks_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_docs`
--

CREATE TABLE `client_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_notes`
--

CREATE TABLE `client_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED DEFAULT NULL,
  `is_client_show` tinyint(1) NOT NULL DEFAULT '0',
  `ask_password` tinyint(1) NOT NULL DEFAULT '0',
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_sub_categories`
--

CREATE TABLE `client_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_user_notes`
--

CREATE TABLE `client_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `client_note_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_theme` enum('dark','light') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `sidebar_logo_style` enum('square','full') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'square',
  `login_background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dd-mm-yyyy',
  `year_starts_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `moment_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DD-MM-YYYY',
  `time_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i a',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `latitude` decimal(10,8) NOT NULL DEFAULT '26.91243360',
  `longitude` decimal(11,8) NOT NULL DEFAULT '75.78727090',
  `leaves_start_from` enum('joining_date','year_start') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'joining_date',
  `active_theme` enum('default','custom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive','license_expired') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `currency_converter_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_map_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_self` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `purchase_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `google_recaptcha_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v2_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v2_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v2_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v3_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v3_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v3_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_debug` tinyint(1) NOT NULL DEFAULT '0',
  `rounded_theme` tinyint(1) NOT NULL DEFAULT '1',
  `hide_cron_message` tinyint(1) NOT NULL DEFAULT '0',
  `system_update` tinyint(1) NOT NULL DEFAULT '1',
  `logo_background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#1D82F5',
  `before_days` int(11) NOT NULL,
  `after_days` int(11) NOT NULL,
  `on_deadline` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `default_task_status` int(10) UNSIGNED DEFAULT NULL,
  `show_review_modal` tinyint(1) NOT NULL DEFAULT '1',
  `dashboard_clock` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_form_google_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `lead_form_google_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `taskboard_length` int(11) NOT NULL DEFAULT '10',
  `datatable_row_limit` int(11) NOT NULL DEFAULT '10',
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `session_driver` enum('file','database') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `allow_client_signup` tinyint(1) NOT NULL,
  `admin_client_signup_approval` tinyint(1) NOT NULL,
  `allowed_file_types` text COLLATE utf8mb4_unicode_ci,
  `google_calendar_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `google_client_id` text COLLATE utf8mb4_unicode_ci,
  `google_client_secret` text COLLATE utf8mb4_unicode_ci,
  `google_calendar_verification_status` enum('verified','non_verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'non_verified',
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_file_size` int(11) NOT NULL DEFAULT '10',
  `currency_key_version` enum('free','api') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL,
  `license_updated_at` timestamp NULL DEFAULT NULL,
  `subscription_updated_at` timestamp NULL DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `show_new_webhook_alert` tinyint(1) NOT NULL DEFAULT '0',
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `app_name`, `company_email`, `company_phone`, `logo`, `light_logo`, `favicon`, `auth_theme`, `sidebar_logo_style`, `login_background`, `address`, `website`, `currency_id`, `package_id`, `package_type`, `timezone`, `date_format`, `date_picker_format`, `year_starts_from`, `moment_format`, `time_format`, `locale`, `latitude`, `longitude`, `leaves_start_from`, `active_theme`, `status`, `last_updated_by`, `currency_converter_key`, `google_map_key`, `task_self`, `purchase_code`, `license_type`, `supported_until`, `google_recaptcha_status`, `google_recaptcha_v2_status`, `google_recaptcha_v2_site_key`, `google_recaptcha_v2_secret_key`, `google_recaptcha_v3_status`, `google_recaptcha_v3_site_key`, `google_recaptcha_v3_secret_key`, `app_debug`, `rounded_theme`, `hide_cron_message`, `system_update`, `logo_background_color`, `header_color`, `before_days`, `after_days`, `on_deadline`, `default_task_status`, `show_review_modal`, `dashboard_clock`, `ticket_form_google_captcha`, `lead_form_google_captcha`, `taskboard_length`, `datatable_row_limit`, `last_cron_run`, `session_driver`, `allow_client_signup`, `admin_client_signup_approval`, `allowed_file_types`, `google_calendar_status`, `google_client_id`, `google_client_secret`, `google_calendar_verification_status`, `google_id`, `name`, `token`, `hash`, `allowed_file_size`, `currency_key_version`, `created_at`, `updated_at`, `last_login`, `rtl`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`, `license_updated_at`, `subscription_updated_at`, `approved`, `approved_by`, `show_new_webhook_alert`, `pm_type`, `pm_last_four`) VALUES
(3, 'Demo Company', 'Demo Company', 'admin@techsuiteone.com', NULL, NULL, NULL, NULL, 'light', 'square', NULL, 'Demo Company', NULL, 9, 7, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', '1', 'DD-MM-YYYY', 'h:i a', 'en', 26.91243360, 75.78727090, 'joining_date', 'default', 'active', 1, NULL, NULL, 'yes', NULL, NULL, NULL, 'deactive', 'deactive', NULL, NULL, 'deactive', NULL, NULL, 0, 1, 0, 1, '#ffffff', '#1D82F5', 0, 0, 'yes', 9, 1, 1, 0, 0, 10, 10, NULL, 'file', 0, 0, NULL, 'inactive', NULL, NULL, 'non_verified', NULL, NULL, NULL, 'd1419ba121472e66ff1da0e0013f6dc1', 10, 'free', '2023-05-25 21:34:58', '2023-05-27 07:56:05', '2023-05-27 07:56:05', 0, NULL, NULL, NULL, NULL, '2023-06-26', '2023-05-26 02:15:33', '2023-05-26 02:34:42', 1, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_addresses`
--

CREATE TABLE `company_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_addresses`
--

INSERT INTO `company_addresses` (`id`, `company_id`, `address`, `is_default`, `tax_number`, `tax_name`, `location`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(3, 3, 'Demo Company', 1, NULL, NULL, 'Demo Company', '2023-05-25 21:34:58', '2023-05-25 21:34:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_number` bigint(20) DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_amount` decimal(15,2) NOT NULL,
  `contract_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `original_start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `original_end_date` date DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `contract_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_note` text COLLATE utf8mb4_unicode_ci,
  `cell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_detail` longtext COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_sign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_discussions`
--

CREATE TABLE `contract_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_files`
--

CREATE TABLE `contract_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_renews`
--

CREATE TABLE `contract_renews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `renewed_by` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_signs`
--

CREATE TABLE `contract_signs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_templates`
--

CREATE TABLE `contract_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_template_number` bigint(20) DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_type_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_detail` longtext COLLATE utf8mb4_unicode_ci,
  `added_by` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_two` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

CREATE TABLE `conversation_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `cn_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `sub_total` double(15,2) NOT NULL,
  `total` double(15,2) NOT NULL,
  `adjustment_amount` double(8,2) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('closed','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `recurring` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `billing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_items`
--

CREATE TABLE `credit_note_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_note_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_item_images`
--

CREATE TABLE `credit_note_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_note_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `usd_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `is_cryptocurrency`, `usd_price`, `created_at`, `updated_at`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `currency_position`) VALUES
(9, 3, 'Dollars', '$', 'USD', 1, 'no', NULL, NULL, NULL, 2, ',', '.', 'left'),
(10, 3, 'Pounds', '£', 'GBP', 1, 'no', NULL, NULL, NULL, 2, ',', '.', 'left'),
(11, 3, 'Euros', '€', 'EUR', 1, 'no', NULL, NULL, NULL, 2, ',', '.', 'left'),
(12, 3, 'Rupee', '₹', 'INR', 1, 'no', NULL, NULL, NULL, 2, ',', '.', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `currency_format_settings`
--

CREATE TABLE `currency_format_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_format_settings`
--

INSERT INTO `currency_format_settings` (`id`, `company_id`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`) VALUES
(1, NULL, 'left', 2, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `values` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `company_id`, `name`, `model`) VALUES
(1, NULL, 'Company', 'App\\Models\\Company'),
(26, 3, 'Client', 'App\\Models\\ClientDetails'),
(27, 3, 'Employee', 'App\\Models\\EmployeeDetails'),
(28, 3, 'Project', 'App\\Models\\Project'),
(29, 3, 'Invoice', 'App\\Models\\Invoice'),
(30, 3, 'Estimate', 'App\\Models\\Estimate'),
(31, 3, 'Task', 'App\\Models\\Task'),
(32, 3, 'Expense', 'App\\Models\\Expense'),
(33, 3, 'Lead', 'App\\Models\\Lead'),
(34, 3, 'Product', 'App\\Models\\Product'),
(35, 3, 'Ticket', 'App\\Models\\Ticket'),
(36, 3, 'Time Log', 'App\\Models\\ProjectTimeLog'),
(37, 3, 'Contract', 'App\\Models\\Contract');

-- --------------------------------------------------------

--
-- Table structure for table `custom_link_settings`
--

CREATE TABLE `custom_link_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `link_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `can_be_viewed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `widget_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dashboard_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `company_id`, `widget_name`, `status`, `dashboard_type`, `created_at`, `updated_at`) VALUES
(163, 3, 'total_clients', 1, 'admin-dashboard', NULL, NULL),
(164, 3, 'total_employees', 1, 'admin-dashboard', NULL, NULL),
(165, 3, 'total_projects', 1, 'admin-dashboard', NULL, NULL),
(166, 3, 'total_unpaid_invoices', 1, 'admin-dashboard', NULL, NULL),
(167, 3, 'total_hours_logged', 1, 'admin-dashboard', NULL, NULL),
(168, 3, 'total_pending_tasks', 1, 'admin-dashboard', NULL, NULL),
(169, 3, 'total_today_attendance', 1, 'admin-dashboard', NULL, NULL),
(170, 3, 'total_unresolved_tickets', 1, 'admin-dashboard', NULL, NULL),
(171, 3, 'recent_earnings', 1, 'admin-dashboard', NULL, NULL),
(172, 3, 'settings_leaves', 1, 'admin-dashboard', NULL, NULL),
(173, 3, 'new_tickets', 1, 'admin-dashboard', NULL, NULL),
(174, 3, 'overdue_tasks', 1, 'admin-dashboard', NULL, NULL),
(175, 3, 'pending_follow_up', 1, 'admin-dashboard', NULL, NULL),
(176, 3, 'project_activity_timeline', 1, 'admin-dashboard', NULL, NULL),
(177, 3, 'user_activity_timeline', 1, 'admin-dashboard', NULL, NULL),
(178, 3, 'timelogs', 1, 'admin-dashboard', NULL, NULL),
(179, 3, 'total_clients', 1, 'admin-client-dashboard', NULL, NULL),
(180, 3, 'total_leads', 1, 'admin-client-dashboard', NULL, NULL),
(181, 3, 'total_lead_conversions', 1, 'admin-client-dashboard', NULL, NULL),
(182, 3, 'total_contracts_generated', 1, 'admin-client-dashboard', NULL, NULL),
(183, 3, 'total_contracts_signed', 1, 'admin-client-dashboard', NULL, NULL),
(184, 3, 'client_wise_earnings', 1, 'admin-client-dashboard', NULL, NULL),
(185, 3, 'client_wise_timelogs', 1, 'admin-client-dashboard', NULL, NULL),
(186, 3, 'lead_vs_status', 1, 'admin-client-dashboard', NULL, NULL),
(187, 3, 'lead_vs_source', 1, 'admin-client-dashboard', NULL, NULL),
(188, 3, 'latest_client', 1, 'admin-client-dashboard', NULL, NULL),
(189, 3, 'recent_login_activities', 1, 'admin-client-dashboard', NULL, NULL),
(190, 3, 'total_paid_invoices', 1, 'admin-finance-dashboard', NULL, NULL),
(191, 3, 'total_expenses', 1, 'admin-finance-dashboard', NULL, NULL),
(192, 3, 'total_earnings', 1, 'admin-finance-dashboard', NULL, NULL),
(193, 3, 'total_pending_amount', 1, 'admin-finance-dashboard', NULL, NULL),
(194, 3, 'invoice_overview', 1, 'admin-finance-dashboard', NULL, NULL),
(195, 3, 'estimate_overview', 1, 'admin-finance-dashboard', NULL, NULL),
(196, 3, 'proposal_overview', 1, 'admin-finance-dashboard', NULL, NULL),
(197, 3, 'earnings_by_client', 1, 'admin-finance-dashboard', NULL, NULL),
(198, 3, 'earnings_by_projects', 1, 'admin-finance-dashboard', NULL, NULL),
(199, 3, 'total_unpaid_invoices', 1, 'admin-finance-dashboard', NULL, NULL),
(200, 3, 'total_leaves_approved', 1, 'admin-hr-dashboard', NULL, NULL),
(201, 3, 'total_new_employee', 1, 'admin-hr-dashboard', NULL, NULL),
(202, 3, 'total_employee_exits', 1, 'admin-hr-dashboard', NULL, NULL),
(203, 3, 'average_attendance', 1, 'admin-hr-dashboard', NULL, NULL),
(204, 3, 'department_wise_employee', 1, 'admin-hr-dashboard', NULL, NULL),
(205, 3, 'designation_wise_employee', 1, 'admin-hr-dashboard', NULL, NULL),
(206, 3, 'gender_wise_employee', 1, 'admin-hr-dashboard', NULL, NULL),
(207, 3, 'role_wise_employee', 1, 'admin-hr-dashboard', NULL, NULL),
(208, 3, 'leaves_taken', 1, 'admin-hr-dashboard', NULL, NULL),
(209, 3, 'late_attendance_mark', 1, 'admin-hr-dashboard', NULL, NULL),
(210, 3, 'headcount', 1, 'admin-hr-dashboard', NULL, NULL),
(211, 3, 'joining_vs_attrition', 1, 'admin-hr-dashboard', NULL, NULL),
(212, 3, 'birthday', 1, 'admin-hr-dashboard', NULL, NULL),
(213, 3, 'total_today_attendance', 1, 'admin-hr-dashboard', NULL, NULL),
(214, 3, 'total_project', 1, 'admin-project-dashboard', NULL, NULL),
(215, 3, 'total_hours_logged', 1, 'admin-project-dashboard', NULL, NULL),
(216, 3, 'total_overdue_project', 1, 'admin-project-dashboard', NULL, NULL),
(217, 3, 'status_wise_project', 1, 'admin-project-dashboard', NULL, NULL),
(218, 3, 'pending_milestone', 1, 'admin-project-dashboard', NULL, NULL),
(219, 3, 'total_tickets', 1, 'admin-ticket-dashboard', NULL, NULL),
(220, 3, 'total_unassigned_ticket', 1, 'admin-ticket-dashboard', NULL, NULL),
(221, 3, 'type_wise_ticket', 1, 'admin-ticket-dashboard', NULL, NULL),
(222, 3, 'status_wise_ticket', 1, 'admin-ticket-dashboard', NULL, NULL),
(223, 3, 'channel_wise_ticket', 1, 'admin-ticket-dashboard', NULL, NULL),
(224, 3, 'new_tickets', 1, 'admin-ticket-dashboard', NULL, NULL),
(225, 3, 'profile', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(226, 3, 'shift_schedule', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(227, 3, 'birthday', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(228, 3, 'notices', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(229, 3, 'tasks', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(230, 3, 'projects', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(231, 3, 'my_task', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(232, 3, 'my_calender', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(233, 3, 'week_timelog', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(234, 3, 'leave', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(235, 3, 'lead', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(236, 3, 'work_from_home', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(237, 3, 'appreciation', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(238, 3, 'work_anniversary', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(239, 3, 'ticket', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(240, 3, 'notice_period_duration', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(241, 3, 'probation_date', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(242, 3, 'contract_date', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53'),
(243, 3, 'internship_date', 1, 'private-dashboard', NULL, '2023-05-26 02:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_backup_cron_settings`
--

CREATE TABLE `database_backup_cron_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `hour_of_day` time DEFAULT NULL,
  `backup_after_days` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_backup_after_days` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `database_backup_cron_settings`
--

INSERT INTO `database_backup_cron_settings` (`id`, `status`, `hour_of_day`, `backup_after_days`, `delete_backup_after_days`) VALUES
(1, 'inactive', '00:00:00', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `name`, `parent_id`, `added_by`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Head', NULL, NULL, NULL, '2023-05-25 21:36:55', '2023-05-25 21:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_category_id` int(10) UNSIGNED DEFAULT '1',
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#232629',
  `user_id` int(10) UNSIGNED NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `best_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `last_reply_by_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_categories`
--

CREATE TABLE `discussion_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_categories`
--

INSERT INTO `discussion_categories` (`id`, `company_id`, `order`, `name`, `color`, `created_at`, `updated_at`) VALUES
(3, 3, 1, 'General', '#3498DB', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_files`
--

CREATE TABLE `discussion_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_reply_id` int(10) UNSIGNED DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

CREATE TABLE `discussion_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_notification_settings`
--

CREATE TABLE `email_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_email` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `send_slack` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `send_push` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_notification_settings`
--

INSERT INTO `email_notification_settings` (`id`, `company_id`, `slug`, `setting_name`, `send_email`, `send_slack`, `send_push`, `created_at`, `updated_at`) VALUES
(51, 3, 'new-expenseadded-by-admin', 'New Expense/Added by Admin', 'yes', 'no', 'no', NULL, NULL),
(52, 3, 'new-expenseadded-by-member', 'New Expense/Added by Member', 'yes', 'no', 'no', NULL, NULL),
(53, 3, 'expense-status-changed', 'Expense Status Changed', 'yes', 'no', 'no', NULL, NULL),
(54, 3, 'new-support-ticket-request', 'New Support Ticket Request', 'yes', 'no', 'no', NULL, NULL),
(55, 3, 'new-leave-application', 'New Leave Application', 'yes', 'no', 'no', NULL, NULL),
(56, 3, 'task-completed', 'Task Completed', 'yes', 'no', 'no', NULL, NULL),
(57, 3, 'invoice-createupdate-notification', 'Invoice Create/Update Notification', 'yes', 'no', 'no', NULL, NULL),
(58, 3, 'discussion-reply', 'Discussion Reply', 'yes', 'no', 'no', NULL, NULL),
(59, 3, 'new-product-purchase-request', 'New Product Purchase Request', 'yes', 'no', 'no', NULL, NULL),
(60, 3, 'lead-notification', 'Lead notification', 'yes', 'no', 'no', NULL, NULL),
(61, 3, 'order-createupdate-notification', 'Order Create/Update Notification', 'no', 'no', 'no', NULL, NULL),
(62, 3, 'user-join-via-invitation', 'User Join via Invitation', 'no', 'no', 'no', NULL, NULL),
(63, 3, 'follow-up-reminder', 'Follow Up Reminder', 'no', 'no', 'no', NULL, NULL),
(64, 3, 'user-registrationadded-by-admin', 'User Registration/Added by Admin', 'yes', 'no', 'no', NULL, NULL),
(65, 3, 'employee-assign-to-project', 'Employee Assign to Project', 'yes', 'no', 'no', NULL, NULL),
(66, 3, 'new-notice-published', 'New Notice Published', 'no', 'no', 'no', NULL, NULL),
(67, 3, 'user-assign-to-task', 'User Assign to Task', 'yes', 'no', 'no', NULL, NULL),
(68, 3, 'birthday-notification', 'Birthday notification', 'yes', 'yes', 'no', NULL, NULL),
(69, 3, 'payment-notification', 'Payment Notification', 'yes', 'no', 'no', NULL, NULL),
(70, 3, 'appreciation-notification', 'Employee Appreciation', 'yes', 'no', 'no', NULL, NULL),
(71, 3, 'clock-in-notification', 'Clock In Notification', 'no', 'no', 'no', NULL, NULL),
(72, 3, 'holiday-notification', 'Holiday Notification', 'no', 'no', 'no', NULL, NULL),
(73, 3, 'estimate-notification', 'Estimate Notification', 'yes', 'no', 'no', NULL, NULL),
(74, 3, 'event-notification', 'Event Notification', 'yes', 'no', 'no', NULL, NULL),
(75, 3, 'message-notification', 'Message Notification', 'yes', 'no', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `hourly_rate` double DEFAULT NULL,
  `slack_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_date` date DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `attendance_reminder` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `calendar_view` text COLLATE utf8mb4_unicode_ci,
  `about_me` text COLLATE utf8mb4_unicode_ci,
  `reporting_to` int(10) UNSIGNED DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `internship_end_date` date DEFAULT NULL,
  `employment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marriage_anniversary_date` date DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice_period_end_date` date DEFAULT NULL,
  `notice_period_start_date` date DEFAULT NULL,
  `probation_end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `company_id`, `user_id`, `employee_id`, `address`, `hourly_rate`, `slack_username`, `department_id`, `designation_id`, `joining_date`, `last_date`, `added_by`, `last_updated_by`, `attendance_reminder`, `date_of_birth`, `calendar_view`, `about_me`, `reporting_to`, `contract_end_date`, `internship_end_date`, `employment_type`, `marriage_anniversary_date`, `marital_status`, `notice_period_end_date`, `notice_period_start_date`, `probation_end_date`, `created_at`, `updated_at`) VALUES
(3, 3, 4, 'EMP-1', NULL, NULL, NULL, NULL, NULL, '2023-05-25 21:34:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(4, 3, 5, '2', NULL, NULL, NULL, 1, 1, '2023-05-26 00:00:00', NULL, 4, 4, NULL, NULL, 'task,events,holiday,tickets,leaves', NULL, NULL, NULL, NULL, NULL, NULL, 'unmarried', NULL, NULL, NULL, '2023-05-25 21:39:12', '2023-05-25 21:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE `employee_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_quotas`
--

CREATE TABLE `employee_leave_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `no_of_leaves` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_leave_quotas`
--

INSERT INTO `employee_leave_quotas` (`id`, `user_id`, `leave_type_id`, `no_of_leaves`, `created_at`, `updated_at`) VALUES
(7, 4, 7, 5, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(8, 4, 8, 5, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(9, 4, 9, 5, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(10, 5, 7, 5, '2023-05-25 21:39:12', '2023-05-25 21:39:12'),
(11, 5, 8, 5, '2023-05-25 21:39:12', '2023-05-25 21:39:12'),
(12, 5, 9, 5, '2023-05-25 21:39:12', '2023-05-25 21:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `employee_shifts`
--

CREATE TABLE `employee_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `shift_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_short_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` tinyint(4) NOT NULL,
  `office_open_days` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_shifts`
--

INSERT INTO `employee_shifts` (`id`, `company_id`, `shift_name`, `shift_short_code`, `color`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `office_open_days`, `created_at`, `updated_at`) VALUES
(5, 3, 'General Shift', 'GS', '#99C7F1', '09:00:00', '18:00:00', NULL, 20, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(6, 3, 'Day Off', 'DO', '', '00:00:00', '00:00:00', NULL, 0, 0, '', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `employee_shift_change_requests`
--

CREATE TABLE `employee_shift_change_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `shift_schedule_id` bigint(20) UNSIGNED NOT NULL,
  `employee_shift_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('waiting','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_shift_schedules`
--

CREATE TABLE `employee_shift_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_shift_id` bigint(20) UNSIGNED NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `shift_start_time` datetime DEFAULT NULL,
  `shift_end_time` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_teams`
--

CREATE TABLE `employee_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `estimate_number` bigint(20) DEFAULT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting','sent','draft','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `send_status` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_viewed` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_item_images`
--

CREATE TABLE `estimate_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `estimate_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_templates`
--

CREATE TABLE `estimate_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` double NOT NULL,
  `total` double NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `invoice_convert` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('declined','accepted','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `client_comment` text COLLATE utf8mb4_unicode_ci,
  `signature_approval` tinyint(1) NOT NULL DEFAULT '1',
  `hash` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_template_items`
--

CREATE TABLE `estimate_template_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_template_id` bigint(20) UNSIGNED NOT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_template_item_images`
--

CREATE TABLE `estimate_template_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_template_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `where` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `repeat` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `repeat_every` int(11) DEFAULT NULL,
  `repeat_cycles` int(11) DEFAULT NULL,
  `repeat_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `send_reminder` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `remind_time` int(11) DEFAULT NULL,
  `remind_type` enum('day','hour','minute') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `event_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

CREATE TABLE `event_attendees` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_files`
--

CREATE TABLE `event_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `default_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `can_claim` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expenses_recurring_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `approver_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category`
--

CREATE TABLE `expenses_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category_roles`
--

CREATE TABLE `expenses_category_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `expenses_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_recurring`
--

CREATE TABLE `expenses_recurring` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_month` int(11) DEFAULT '1',
  `day_of_week` int(11) DEFAULT '1',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rotation` enum('monthly','weekly','bi-weekly','quarterly','half-yearly','annually','daily') COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `next_expense_date` date DEFAULT NULL,
  `unlimited_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `price` double NOT NULL,
  `bill` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `purchase_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immediate_expense` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_files`
--

CREATE TABLE `faq_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('image','icon','task','bills','team','apps') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `front_feature_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `language_setting_id`, `title`, `description`, `image`, `icon`, `type`, `front_feature_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Meet Your Business Needs', '<p>Manage your projects and your talent in a single system, resulting in empowered teams, satisfied clients, and increased profitability.</p><ul class=\"list1 border-top pt-5 mt-5\">\n                            <li class=\"mb-3\">\n                                Keep a track of all your projects in most simple way.\n                            </li>\n                            <li class=\"mb-3\">\n                                Assign tasks to project members and track the status.\n                            </li>\n                            <li class=\"mb-3\">\n                                Add members to your projects and keep them in sync  with the progress.\n                            </li>\n                        </ul>', NULL, NULL, 'image', NULL, NULL, NULL),
(2, 1, 'Analyse Your Workflow', '<p>Reports section to analyse what\'s working and what\'s not for your business</p><ul class=\"list1 border-top pt-5 mt-5\">\n                            <li class=\"mb-3\">\n                                It Shows how much you earned and how much you spent.\n                            </li>\n                            <li class=\"mb-3\">\n                                Ticket report shows you Open vs Closed tickets.\n                            </li>\n                            <li class=\"mb-3\">\n                                It creates task report to track completed vs pending tasks.\n                            </li>\n                        </ul>', NULL, NULL, 'image', NULL, NULL, NULL),
(3, 1, 'Manage your support tickets efficiently', '<p>Whether someone\'s internet is not working, someone is facing issue with housekeeping or need something regarding their work they can raise a ticket for all their problems.</p><ul class=\"list1 border-top pt-5 mt-5\"><li class=\"mb-3\">Admin can assign the tickets to respective department agents.</li></ul>', NULL, NULL, 'image', NULL, NULL, NULL),
(4, 1, 'Responsive', 'Your website works on any device: desktop, tablet or mobile.', NULL, 'fas fa-desktop', 'icon', NULL, NULL, NULL),
(5, 1, 'Customizable', 'You can easily read, edit, and write your own code, or change everything.', NULL, 'fas fa-wrench', 'icon', NULL, NULL, NULL),
(6, 1, 'UI Elements', 'There is a bunch of useful and necessary elements for developing your website.', NULL, 'fas fa-cubes', 'icon', NULL, NULL, NULL),
(7, 1, 'Clean Code', 'You can find our code well organized, commented and readable.', NULL, 'fas fa-code', 'icon', NULL, NULL, NULL),
(8, 1, 'Documented', 'As you can see in the source code, we provided a comprehensive documentation.', NULL, 'far fa-file-alt', 'icon', NULL, NULL, NULL),
(9, 1, 'Free Updates', 'When you purchase this template, you\'ll freely receive future updates.', NULL, 'fas fa-download', 'icon', NULL, NULL, NULL),
(10, 1, 'Track Projects', 'Keep a track of all your projects in the most simple way.', NULL, 'fas fa-desktop', 'task', 1, NULL, '2023-05-25 21:22:04'),
(11, 1, 'Add Members', 'Add members to your projects and keep them in sync with the progress.', NULL, 'fas fa-users', 'task', 1, NULL, '2023-05-25 21:22:04'),
(12, 1, 'Assign Tasks', 'Your website is fully responsive, it will work on any device, desktop, tablet and mobile.', NULL, 'fas fa-list', 'task', 1, NULL, '2023-05-25 21:22:04'),
(13, 1, 'Estimates', 'Create estimates how much project can cost and send to your clients.', NULL, 'fas fa-calculator', 'bills', 2, NULL, '2023-05-25 21:22:04'),
(14, 1, 'Invoices', 'Simple and professional invoices can be download in form of PDF.', NULL, 'far fa-file-alt', 'bills', 2, NULL, '2023-05-25 21:22:04'),
(15, 1, 'Payments', 'Track payments done by clients in the payment section.', NULL, 'fas fa-money-bill-alt', 'bills', 2, NULL, '2023-05-25 21:22:04'),
(16, 1, 'Tickets', 'When someone is facing a problem, they can raise a ticket for their problems. Admin can assign the tickets to respective department agents.', NULL, 'fas fa-ticket-alt', 'team', 3, NULL, '2023-05-25 21:22:04'),
(17, 1, 'Leaves', 'Employees can apply for the multiple leaves from their panel. Admin can approve or reject the leave applications.', NULL, 'fas fa-ban', 'team', 3, NULL, '2023-05-25 21:22:04'),
(18, 1, 'Attendance', 'Attendance module allows employees to clock-in and clock-out, right from their dashboard. Admin can track the attendance of the team.', NULL, 'far fa-check-circle', 'team', 3, NULL, '2023-05-25 21:22:04'),
(19, 1, 'OneSignal', NULL, NULL, NULL, 'apps', NULL, NULL, NULL),
(20, 1, 'Slack', NULL, NULL, NULL, 'apps', NULL, NULL, NULL),
(21, 1, 'Paypal', NULL, NULL, NULL, 'apps', NULL, NULL, NULL),
(22, 1, 'Pusher', NULL, NULL, NULL, 'apps', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_storage`
--

CREATE TABLE `file_storage` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `storage_location` enum('local','aws_s3','digitalocean','wasabi') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

CREATE TABLE `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `filesystem` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_keys` text COLLATE utf8mb4_unicode_ci,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storage_settings`
--

INSERT INTO `file_storage_settings` (`id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, 'local', NULL, 'enabled', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `capital` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flags`
--

INSERT INTO `flags` (`id`, `capital`, `code`, `continent`, `name`) VALUES
(1, 'Kabul', 'af', 'Asia', 'Afghanistan'),
(2, 'Mariehamn', 'ax', 'Europe', 'Aland Islands'),
(3, 'Tirana', 'al', 'Europe', 'Albania'),
(4, 'Algiers', 'dz', 'Africa', 'Algeria'),
(5, 'Pago Pago', 'as', 'Oceania', 'American Samoa'),
(6, 'Andorra la Vella', 'ad', 'Europe', 'Andorra'),
(7, 'Luanda', 'ao', 'Africa', 'Angola'),
(8, 'The Valley', 'ai', 'North America', 'Anguilla'),
(9, '', 'aq', '', 'Antarctica'),
(10, 'St. John\'s', 'ag', 'North America', 'Antigua and Barbuda'),
(11, 'Buenos Aires', 'ar', 'South America', 'Argentina'),
(12, 'Yerevan', 'am', 'Asia', 'Armenia'),
(13, 'Oranjestad', 'aw', 'South America', 'Aruba'),
(14, 'Georgetown', 'ac', 'Africa', 'Ascension Island'),
(15, 'Canberra', 'au', 'Oceania', 'Australia'),
(16, 'Vienna', 'at', 'Europe', 'Austria'),
(17, 'Baku', 'az', 'Asia', 'Azerbaijan'),
(18, 'Nassau', 'bs', 'North America', 'Bahamas'),
(19, 'Manama', 'bh', 'Asia', 'Bahrain'),
(20, 'Dhaka', 'bd', 'Asia', 'Bangladesh'),
(21, 'Bridgetown', 'bb', 'North America', 'Barbados'),
(22, 'Minsk', 'by', 'Europe', 'Belarus'),
(23, 'Brussels', 'be', 'Europe', 'Belgium'),
(24, 'Belmopan', 'bz', 'North America', 'Belize'),
(25, 'Porto-Novo', 'bj', 'Africa', 'Benin'),
(26, 'Hamilton', 'bm', 'North America', 'Bermuda'),
(27, 'Thimphu', 'bt', 'Asia', 'Bhutan'),
(28, 'Sucre', 'bo', 'South America', 'Bolivia'),
(29, 'Kralendijk', 'bq', 'South America', 'Bonaire, Sint Eustatius and Saba'),
(30, 'Sarajevo', 'ba', 'Europe', 'Bosnia and Herzegovina'),
(31, 'Gaborone', 'bw', 'Africa', 'Botswana'),
(32, '', 'bv', '', 'Bouvet Island'),
(33, 'Brasília', 'br', 'South America', 'Brazil'),
(34, 'Diego Garcia', 'io', 'Asia', 'British Indian Ocean Territory'),
(35, 'Bandar Seri Begawan', 'bn', 'Asia', 'Brunei Darussalam'),
(36, 'Sofia', 'bg', 'Europe', 'Bulgaria'),
(37, 'Ouagadougou', 'bf', 'Africa', 'Burkina Faso'),
(38, 'Bujumbura', 'bi', 'Africa', 'Burundi'),
(39, 'Praia', 'cv', 'Africa', 'Cabo Verde'),
(40, 'Phnom Penh', 'kh', 'Asia', 'Cambodia'),
(41, 'Yaoundé', 'cm', 'Africa', 'Cameroon'),
(42, 'Ottawa', 'ca', 'North America', 'Canada'),
(43, '', 'ic', '', 'Canary Islands'),
(44, '', 'es-ct', '', 'Catalonia'),
(45, 'George Town', 'ky', 'North America', 'Cayman Islands'),
(46, 'Bangui', 'cf', 'Africa', 'Central African Republic'),
(47, '', 'cefta', '', 'Central European Free Trade Agreement'),
(48, '', 'ea', '', 'Ceuta & Melilla'),
(49, 'N\'Djamena', 'td', 'Africa', 'Chad'),
(50, 'Santiago', 'cl', 'South America', 'Chile'),
(51, 'Beijing', 'cn', 'Asia', 'China'),
(52, 'Flying Fish Cove', 'cx', 'Asia', 'Christmas Island'),
(53, '', 'cp', '', 'Clipperton Island'),
(54, 'West Island', 'cc', 'Asia', 'Cocos (Keeling) Islands'),
(55, 'Bogotá', 'co', 'South America', 'Colombia'),
(56, 'Moroni', 'km', 'Africa', 'Comoros'),
(57, 'Avarua', 'ck', 'Oceania', 'Cook Islands'),
(58, 'San José', 'cr', 'North America', 'Costa Rica'),
(59, 'Zagreb', 'hr', 'Europe', 'Croatia'),
(60, 'Havana', 'cu', 'North America', 'Cuba'),
(61, 'Willemstad', 'cw', 'South America', 'Curaçao'),
(62, 'Nicosia', 'cy', 'Europe', 'Cyprus'),
(63, 'Prague', 'cz', 'Europe', 'Czech Republic'),
(64, 'Yamoussoukro', 'ci', 'Africa', 'Côte d\'Ivoire'),
(65, 'Kinshasa', 'cd', 'Africa', 'Democratic Republic of the Congo'),
(66, 'Copenhagen', 'dk', 'Europe', 'Denmark'),
(67, '', 'dg', '', 'Diego Garcia'),
(68, 'Djibouti', 'dj', 'Africa', 'Djibouti'),
(69, 'Roseau', 'dm', 'North America', 'Dominica'),
(70, 'Santo Domingo', 'do', 'North America', 'Dominican Republic'),
(71, 'Quito', 'ec', 'South America', 'Ecuador'),
(72, 'Cairo', 'eg', 'Africa', 'Egypt'),
(73, 'San Salvador', 'sv', 'North America', 'El Salvador'),
(74, 'London', 'gb-eng', 'Europe', 'England'),
(75, 'Malabo', 'gq', 'Africa', 'Equatorial Guinea'),
(76, 'Asmara', 'er', 'Africa', 'Eritrea'),
(77, 'Tallinn', 'ee', 'Europe', 'Estonia'),
(78, 'Lobamba, Mbabane', 'sz', 'Africa', 'Eswatini'),
(79, 'Addis Ababa', 'et', 'Africa', 'Ethiopia'),
(80, '', 'eu', '', 'Europe'),
(81, 'Stanley', 'fk', 'South America', 'Falkland Islands'),
(82, 'Tórshavn', 'fo', 'Europe', 'Faroe Islands'),
(83, 'Palikir', 'fm', 'Oceania', 'Federated States of Micronesia'),
(84, 'Suva', 'fj', 'Oceania', 'Fiji'),
(85, 'Helsinki', 'fi', 'Europe', 'Finland'),
(86, 'Paris', 'fr', 'Europe', 'France'),
(87, 'Cayenne', 'gf', 'South America', 'French Guiana'),
(88, 'Papeete', 'pf', 'Oceania', 'French Polynesia'),
(89, 'Saint-Pierre, Réunion', 'tf', 'Africa', 'French Southern Territories'),
(90, 'Libreville', 'ga', 'Africa', 'Gabon'),
(91, '', 'es-ga', '', 'Galicia'),
(92, 'Banjul', 'gm', 'Africa', 'Gambia'),
(93, 'Tbilisi', 'ge', 'Asia', 'Georgia'),
(94, 'Berlin', 'de', 'Europe', 'Germany'),
(95, 'Accra', 'gh', 'Africa', 'Ghana'),
(96, 'Gibraltar', 'gi', 'Europe', 'Gibraltar'),
(97, 'Athens', 'gr', 'Europe', 'Greece'),
(98, 'Nuuk', 'gl', 'North America', 'Greenland'),
(99, 'St. George\'s', 'gd', 'North America', 'Grenada'),
(100, 'Basse-Terre', 'gp', 'North America', 'Guadeloupe'),
(101, 'Hagåtña', 'gu', 'Oceania', 'Guam'),
(102, 'Guatemala City', 'gt', 'North America', 'Guatemala'),
(103, 'Saint Peter Port', 'gg', 'Europe', 'Guernsey'),
(104, 'Conakry', 'gn', 'Africa', 'Guinea'),
(105, 'Bissau', 'gw', 'Africa', 'Guinea-Bissau'),
(106, 'Georgetown', 'gy', 'South America', 'Guyana'),
(107, 'Port-au-Prince', 'ht', 'North America', 'Haiti'),
(108, '', 'hm', '', 'Heard Island and McDonald Islands'),
(109, 'Vatican City', 'va', 'Europe', 'Holy See'),
(110, 'Tegucigalpa', 'hn', 'North America', 'Honduras'),
(111, 'Hong Kong', 'hk', 'Asia', 'Hong Kong'),
(112, 'Budapest', 'hu', 'Europe', 'Hungary'),
(113, 'Reykjavik', 'is', 'Europe', 'Iceland'),
(114, 'New Delhi', 'in', 'Asia', 'India'),
(115, 'Jakarta', 'id', 'Asia', 'Indonesia'),
(116, 'Tehran', 'ir', 'Asia', 'Iran'),
(117, 'Baghdad', 'iq', 'Asia', 'Iraq'),
(118, 'Dublin', 'ie', 'Europe', 'Ireland'),
(119, 'Douglas', 'im', 'Europe', 'Isle of Man'),
(120, 'Jerusalem', 'il', 'Asia', 'Israel'),
(121, 'Rome', 'it', 'Europe', 'Italy'),
(122, 'Kingston', 'jm', 'North America', 'Jamaica'),
(123, 'Tokyo', 'jp', 'Asia', 'Japan'),
(124, 'Saint Helier', 'je', 'Europe', 'Jersey'),
(125, 'Amman', 'jo', 'Asia', 'Jordan'),
(126, 'Astana', 'kz', 'Asia', 'Kazakhstan'),
(127, 'Nairobi', 'ke', 'Africa', 'Kenya'),
(128, 'South Tarawa', 'ki', 'Oceania', 'Kiribati'),
(129, 'Pristina', 'xk', 'Europe', 'Kosovo'),
(130, 'Kuwait City', 'kw', 'Asia', 'Kuwait'),
(131, 'Bishkek', 'kg', 'Asia', 'Kyrgyzstan'),
(132, 'Vientiane', 'la', 'Asia', 'Laos'),
(133, 'Riga', 'lv', 'Europe', 'Latvia'),
(134, 'Beirut', 'lb', 'Asia', 'Lebanon'),
(135, 'Maseru', 'ls', 'Africa', 'Lesotho'),
(136, 'Monrovia', 'lr', 'Africa', 'Liberia'),
(137, 'Tripoli', 'ly', 'Africa', 'Libya'),
(138, 'Vaduz', 'li', 'Europe', 'Liechtenstein'),
(139, 'Vilnius', 'lt', 'Europe', 'Lithuania'),
(140, 'Luxembourg City', 'lu', 'Europe', 'Luxembourg'),
(141, 'Macau', 'mo', 'Asia', 'Macau'),
(142, 'Antananarivo', 'mg', 'Africa', 'Madagascar'),
(143, 'Lilongwe', 'mw', 'Africa', 'Malawi'),
(144, 'Kuala Lumpur', 'my', 'Asia', 'Malaysia'),
(145, 'Malé', 'mv', 'Asia', 'Maldives'),
(146, 'Bamako', 'ml', 'Africa', 'Mali'),
(147, 'Valletta', 'mt', 'Europe', 'Malta'),
(148, 'Majuro', 'mh', 'Oceania', 'Marshall Islands'),
(149, 'Fort-de-France', 'mq', 'North America', 'Martinique'),
(150, 'Nouakchott', 'mr', 'Africa', 'Mauritania'),
(151, 'Port Louis', 'mu', 'Africa', 'Mauritius'),
(152, 'Mamoudzou', 'yt', 'Africa', 'Mayotte'),
(153, 'Mexico City', 'mx', 'North America', 'Mexico'),
(154, 'Chișinău', 'md', 'Europe', 'Moldova'),
(155, 'Monaco', 'mc', 'Europe', 'Monaco'),
(156, 'Ulaanbaatar', 'mn', 'Asia', 'Mongolia'),
(157, 'Podgorica', 'me', 'Europe', 'Montenegro'),
(158, 'Little Bay, Brades, Plymouth', 'ms', 'North America', 'Montserrat'),
(159, 'Rabat', 'ma', 'Africa', 'Morocco'),
(160, 'Maputo', 'mz', 'Africa', 'Mozambique'),
(161, 'Naypyidaw', 'mm', 'Asia', 'Myanmar'),
(162, 'Windhoek', 'na', 'Africa', 'Namibia'),
(163, 'Yaren District', 'nr', 'Oceania', 'Nauru'),
(164, 'Kathmandu', 'np', 'Asia', 'Nepal'),
(165, 'Amsterdam', 'nl', 'Europe', 'Netherlands'),
(166, 'Nouméa', 'nc', 'Oceania', 'New Caledonia'),
(167, 'Wellington', 'nz', 'Oceania', 'New Zealand'),
(168, 'Managua', 'ni', 'North America', 'Nicaragua'),
(169, 'Niamey', 'ne', 'Africa', 'Niger'),
(170, 'Abuja', 'ng', 'Africa', 'Nigeria'),
(171, 'Alofi', 'nu', 'Oceania', 'Niue'),
(172, 'Kingston', 'nf', 'Oceania', 'Norfolk Island'),
(173, 'Pyongyang', 'kp', 'Asia', 'North Korea'),
(174, 'Skopje', 'mk', 'Europe', 'North Macedonia'),
(175, 'Belfast', 'gb-nir', 'Europe', 'Northern Ireland'),
(176, 'Saipan', 'mp', 'Oceania', 'Northern Mariana Islands'),
(177, 'Oslo', 'no', 'Europe', 'Norway'),
(178, 'Muscat', 'om', 'Asia', 'Oman'),
(179, 'Islamabad', 'pk', 'Asia', 'Pakistan'),
(180, 'Ngerulmud', 'pw', 'Oceania', 'Palau'),
(181, 'Panama City', 'pa', 'North America', 'Panama'),
(182, 'Port Moresby', 'pg', 'Oceania', 'Papua New Guinea'),
(183, 'Asunción', 'py', 'South America', 'Paraguay'),
(184, 'Lima', 'pe', 'South America', 'Peru'),
(185, 'Manila', 'ph', 'Asia', 'Philippines'),
(186, 'Adamstown', 'pn', 'Oceania', 'Pitcairn'),
(187, 'Warsaw', 'pl', 'Europe', 'Poland'),
(188, 'Lisbon', 'pt', 'Europe', 'Portugal'),
(189, 'San Juan', 'pr', 'North America', 'Puerto Rico'),
(190, 'Doha', 'qa', 'Asia', 'Qatar'),
(191, 'Brazzaville', 'cg', 'Africa', 'Republic of the Congo'),
(192, 'Bucharest', 'ro', 'Europe', 'Romania'),
(193, 'Moscow', 'ru', 'Europe', 'Russia'),
(194, 'Kigali', 'rw', 'Africa', 'Rwanda'),
(195, 'Saint-Denis', 're', 'Africa', 'Réunion'),
(196, 'Gustavia', 'bl', 'North America', 'Saint Barthélemy'),
(197, 'Jamestown', 'sh', 'Africa', 'Saint Helena, Ascension and Tristan da Cunha'),
(198, 'Basseterre', 'kn', 'North America', 'Saint Kitts and Nevis'),
(199, 'Castries', 'lc', 'North America', 'Saint Lucia'),
(200, 'Marigot', 'mf', 'North America', 'Saint Martin'),
(201, 'Saint-Pierre', 'pm', 'North America', 'Saint Pierre and Miquelon'),
(202, 'Kingstown', 'vc', 'North America', 'Saint Vincent and the Grenadines'),
(203, 'Apia', 'ws', 'Oceania', 'Samoa'),
(204, 'San Marino', 'sm', 'Europe', 'San Marino'),
(205, 'São Tomé', 'st', 'Africa', 'Sao Tome and Principe'),
(206, 'Riyadh', 'sa', 'Asia', 'Saudi Arabia'),
(207, 'Edinburgh', 'gb-sct', 'Europe', 'Scotland'),
(208, 'Dakar', 'sn', 'Africa', 'Senegal'),
(209, 'Belgrade', 'rs', 'Europe', 'Serbia'),
(210, 'Victoria', 'sc', 'Africa', 'Seychelles'),
(211, 'Freetown', 'sl', 'Africa', 'Sierra Leone'),
(212, 'Singapore', 'sg', 'Asia', 'Singapore'),
(213, 'Philipsburg', 'sx', 'North America', 'Sint Maarten'),
(214, 'Bratislava', 'sk', 'Europe', 'Slovakia'),
(215, 'Ljubljana', 'si', 'Europe', 'Slovenia'),
(216, 'Honiara', 'sb', 'Oceania', 'Solomon Islands'),
(217, 'Mogadishu', 'so', 'Africa', 'Somalia'),
(218, 'Pretoria', 'za', 'Africa', 'South Africa'),
(219, 'King Edward Point', 'gs', 'Antarctica', 'South Georgia and the South Sandwich Islands'),
(220, 'Seoul', 'kr', 'Asia', 'South Korea'),
(221, 'Juba', 'ss', 'Africa', 'South Sudan'),
(222, 'Madrid', 'es', 'Europe', 'Spain'),
(223, 'Sri Jayawardenepura Kotte, Colombo', 'lk', 'Asia', 'Sri Lanka'),
(224, 'Ramallah', 'ps', 'Asia', 'State of Palestine'),
(225, 'Khartoum', 'sd', 'Africa', 'Sudan'),
(226, 'Paramaribo', 'sr', 'South America', 'Suriname'),
(227, 'Longyearbyen', 'sj', 'Europe', 'Svalbard and Jan Mayen'),
(228, 'Stockholm', 'se', 'Europe', 'Sweden'),
(229, 'Bern', 'ch', 'Europe', 'Switzerland'),
(230, 'Damascus', 'sy', 'Asia', 'Syria'),
(231, 'Taipei', 'tw', 'Asia', 'Taiwan'),
(232, 'Dushanbe', 'tj', 'Asia', 'Tajikistan'),
(233, 'Dodoma', 'tz', 'Africa', 'Tanzania'),
(234, 'Bangkok', 'th', 'Asia', 'Thailand'),
(235, 'Dili', 'tl', 'Asia', 'Timor-Leste'),
(236, 'Lomé', 'tg', 'Africa', 'Togo'),
(237, 'Nukunonu, Atafu,Tokelau', 'tk', 'Oceania', 'Tokelau'),
(238, 'Nukuʻalofa', 'to', 'Oceania', 'Tonga'),
(239, 'Port of Spain', 'tt', 'South America', 'Trinidad and Tobago'),
(240, '', 'ta', '', 'Tristan da Cunha'),
(241, 'Tunis', 'tn', 'Africa', 'Tunisia'),
(242, 'Ankara', 'tr', 'Asia', 'Turkey'),
(243, 'Ashgabat', 'tm', 'Asia', 'Turkmenistan'),
(244, 'Cockburn Town', 'tc', 'North America', 'Turks and Caicos Islands'),
(245, 'Funafuti', 'tv', 'Oceania', 'Tuvalu'),
(246, 'Kampala', 'ug', 'Africa', 'Uganda'),
(247, 'Kiev', 'ua', 'Europe', 'Ukraine'),
(248, 'Abu Dhabi', 'ae', 'Asia', 'United Arab Emirates'),
(249, 'London', 'gb', 'Europe', 'United Kingdom'),
(250, '', 'un', '', 'United Nations'),
(251, 'Washington, D.C.', 'um', 'North America', 'United States Minor Outlying Islands'),
(252, 'Washington, D.C.', 'us', 'North America', 'United States of America'),
(253, '', 'xx', '', 'Unknown'),
(254, 'Montevideo', 'uy', 'South America', 'Uruguay'),
(255, 'Tashkent', 'uz', 'Asia', 'Uzbekistan'),
(256, 'Port Vila', 'vu', 'Oceania', 'Vanuatu'),
(257, 'Caracas', 've', 'South America', 'Venezuela'),
(258, 'Hanoi', 'vn', 'Asia', 'Vietnam'),
(259, 'Road Town', 'vg', 'North America', 'Virgin Islands (British)'),
(260, 'Charlotte Amalie', 'vi', 'North America', 'Virgin Islands (U.S.)'),
(261, 'Cardiff', 'gb-wls', 'Europe', 'Wales'),
(262, 'Mata-Utu', 'wf', 'Oceania', 'Wallis and Futuna'),
(263, 'Laayoune', 'eh', 'Africa', 'Western Sahara'),
(264, 'Sana\'a', 'ye', 'Asia', 'Yemen'),
(265, 'Lusaka', 'zm', 'Africa', 'Zambia'),
(266, 'Harare', 'zw', 'Africa', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `footer_menu`
--

CREATE TABLE `footer_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_embed` text COLLATE utf8mb4_unicode_ci,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('header','footer','both') COLLATE utf8mb4_unicode_ci DEFAULT 'footer',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_menu`
--

INSERT INTO `footer_menu` (`id`, `name`, `slug`, `description`, `video_link`, `video_embed`, `file_name`, `hash_name`, `external_link`, `type`, `status`, `language_setting_id`, `created_at`, `updated_at`, `private`) VALUES
(1, 'Terms of use', 'terms-of-use', '<div><b><span style=\"font-size: 14px;\"><span style=\"font-size: 14px;\">TERMS OF USE FOR WORKSUITE.BIZ</span></span></b></div><div><br></div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div><br></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div>THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</div><div>UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any Materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India,Terms of Use for worksuite.biz</div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD-PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding, and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div><span style=\"font-size: 12px;\">THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</span></div><div><span style=\"font-size: 12px;\">UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</span></div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India, without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect. without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect.</div>', NULL, NULL, NULL, NULL, NULL, 'footer', 'active', 1, NULL, NULL, 0),
(2, 'Privacy Policy', 'privacy-policy', '<div><b><span style=\"font-size: 14px;\"><span style=\"font-size: 14px;\">TERMS OF USE FOR WORKSUITE.BIZ</span></span></b></div><div><br></div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div><br></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div>THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</div><div>UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any Materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India,Terms of Use for worksuite.biz</div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD-PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding, and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div><span style=\"font-size: 12px;\">THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</span></div><div><span style=\"font-size: 12px;\">UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</span></div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India, without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect. without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect.</div>', NULL, NULL, NULL, NULL, NULL, 'footer', 'active', 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `front_clients`
--

CREATE TABLE `front_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_clients`
--

INSERT INTO `front_clients` (`id`, `title`, `image`, `language_setting_id`, `created_at`, `updated_at`) VALUES
(1, 'Client 1', NULL, 1, NULL, NULL),
(2, 'Client 2', NULL, 1, NULL, NULL),
(3, 'Client 3', NULL, 1, NULL, NULL),
(4, 'Client 4', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_details`
--

CREATE TABLE `front_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `get_started_show` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `sign_in_show` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_links` text COLLATE utf8mb4_unicode_ci,
  `primary_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` longtext COLLATE utf8mb4_unicode_ci,
  `custom_css_theme_two` longtext COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `contact_html` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `homepage_background` enum('default','color','image','image_and_color') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `background_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '#CDDCDC',
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_details`
--

INSERT INTO `front_details` (`id`, `get_started_show`, `sign_in_show`, `address`, `phone`, `email`, `social_links`, `primary_color`, `custom_css`, `custom_css_theme_two`, `locale`, `contact_html`, `created_at`, `updated_at`, `homepage_background`, `background_color`, `background_image`) VALUES
(1, 'yes', 'yes', '4868  Ben Street Lansing Michigan 48906', '+91 1234567890', 'company@example.com', '[{\"name\":\"facebook\",\"link\":\"https:\\/\\/www.facebook.com\\/worksuiteapp\"},{\"name\":\"twitter\",\"link\":\"https:\\/\\/twitter.com\\/worksuiteapp\"},{\"name\":\"instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/worksuiteapp\\/\"},{\"name\":\"dribbble\",\"link\":\"https:\\/\\/dribbble.com\"},{\"name\":\"youtube\",\"link\":\"https:\\/\\/www.youtube.com\\/channel\\/UCoqD9VJ4E1UHz3nE_noyKng\"}]', '#453130', NULL, NULL, 'en', NULL, '2023-05-25 21:22:04', '2023-05-25 21:22:04', 'default', '#CDDCDC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_faqs`
--

CREATE TABLE `front_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_faqs`
--

INSERT INTO `front_faqs` (`id`, `question`, `answer`, `language_setting_id`, `created_at`, `updated_at`) VALUES
(1, 'Can i see demo?', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px;\">Yes, definitely. We would be happy to demonstrate you Worksuite through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id worksuite@froiden.com.</span>', 1, NULL, NULL),
(2, 'How can i update app?', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px;\">Yes, definitely. We would be happy to demonstrate you Worksuite through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id worksuite@froiden.com.</span>', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_features`
--

CREATE TABLE `front_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_features`
--

INSERT INTO `front_features` (`id`, `language_setting_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Task Management', 'Manage your projects and talent in one system for empowered teams, satisfied clients, and increased profitability.', 'enable', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(2, 1, 'Manage All Bills', 'Automate billing and revenue recognition to streamline the contract-to-cash cycle.', 'enable', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(3, 1, NULL, NULL, 'enable', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `front_menu_buttons`
--

CREATE TABLE `front_menu_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `home` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'home',
  `feature` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'feature',
  `price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'price',
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'contact',
  `get_start` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'get_start',
  `login` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'login',
  `contact_submit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'contact_submit',
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_menu_buttons`
--

INSERT INTO `front_menu_buttons` (`id`, `home`, `feature`, `price`, `contact`, `get_start`, `login`, `contact_submit`, `language_setting_id`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'Features', 'Pricing', 'Contact', 'Get Started', 'Login', 'Submit Enquiry', 1, '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `front_widgets`
--

CREATE TABLE `front_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_script` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_script` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gdpr_settings`
--

CREATE TABLE `gdpr_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `enable_gdpr` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer_area` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer_footer` tinyint(1) NOT NULL DEFAULT '0',
  `top_information_block` longtext COLLATE utf8mb4_unicode_ci,
  `enable_export` tinyint(1) NOT NULL DEFAULT '0',
  `data_removal` tinyint(1) NOT NULL DEFAULT '0',
  `lead_removal_public_form` tinyint(1) NOT NULL DEFAULT '0',
  `terms_customer_footer` tinyint(1) NOT NULL DEFAULT '0',
  `terms` longtext COLLATE utf8mb4_unicode_ci,
  `policy` longtext COLLATE utf8mb4_unicode_ci,
  `public_lead_edit` tinyint(1) NOT NULL DEFAULT '0',
  `consent_customer` tinyint(1) NOT NULL DEFAULT '0',
  `consent_leads` tinyint(1) NOT NULL DEFAULT '0',
  `consent_block` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gdpr_settings`
--

INSERT INTO `gdpr_settings` (`id`, `enable_gdpr`, `show_customer_area`, `show_customer_footer`, `top_information_block`, `enable_export`, `data_removal`, `lead_removal_public_form`, `terms_customer_footer`, `terms`, `policy`, `public_lead_edit`, `consent_customer`, `consent_leads`, `consent_block`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `global_currencies`
--

CREATE TABLE `global_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `usd_price` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_currencies`
--

INSERT INTO `global_currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dollars', '$', 'USD', 1, NULL, 'no', 'left', 2, ',', '.', 'enable', NULL, NULL, NULL),
(2, 'Pounds', '£', 'GBP', 1, NULL, 'no', 'left', 2, ',', '.', 'enable', NULL, NULL, NULL),
(3, 'Euros', '€', 'EUR', 1, NULL, 'no', 'left', 2, ',', '.', 'enable', NULL, NULL, NULL),
(4, 'Rupee', '₹', 'INR', 1, NULL, 'no', 'left', 2, ',', '.', 'enable', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_invoices`
--

CREATE TABLE `global_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `global_subscription_id` int(10) UNSIGNED DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `m_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_interval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `stripe_invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_invoice_settings`
--

CREATE TABLE `global_invoice_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `authorised_signatory` tinyint(1) NOT NULL DEFAULT '0',
  `authorised_signatory_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_invoice_settings`
--

INSERT INTO `global_invoice_settings` (`id`, `logo`, `template`, `locale`, `authorised_signatory`, `authorised_signatory_signature`, `invoice_terms`, `created_at`, `updated_at`) VALUES
(1, '600c2e183202d727d585b741632e1eaa.png', 'invoice-5', 'en', 0, NULL, 'Thank you for your business.', '2023-05-25 21:21:59', '2023-05-25 22:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `global_payment_gateway_credentials`
--

CREATE TABLE `global_payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `paypal_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_paypal_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_paypal_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `paypal_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `live_stripe_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_stripe_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_stripe_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `stripe_mode` enum('test','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'test',
  `live_razorpay_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_razorpay_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_razorpay_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_razorpay_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `razorpay_mode` enum('test','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'test',
  `paystack_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_merchant_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_paystack_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_paystack_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_payment_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'https://api.paystack.co',
  `paystack_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `paystack_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `mollie_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `payfast_merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_passphrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_payfast_merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `payfast_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `authorize_api_login_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_transaction_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_environment` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `authorize_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `square_application_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_environment` enum('sandbox','production') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `square_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `test_flutterwave_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_flutterwave_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_flutterwave_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutterwave_webhook_secret_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutterwave_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `flutterwave_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_payment_gateway_credentials`
--

INSERT INTO `global_payment_gateway_credentials` (`id`, `paypal_client_id`, `paypal_secret`, `sandbox_paypal_client_id`, `sandbox_paypal_secret`, `paypal_status`, `paypal_mode`, `live_stripe_client_id`, `live_stripe_secret`, `live_stripe_webhook_secret`, `test_stripe_client_id`, `test_stripe_secret`, `test_stripe_webhook_secret`, `stripe_status`, `stripe_mode`, `live_razorpay_key`, `live_razorpay_secret`, `test_razorpay_key`, `test_razorpay_secret`, `razorpay_webhook_secret`, `razorpay_status`, `razorpay_mode`, `paystack_key`, `paystack_secret`, `paystack_merchant_email`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`, `paystack_status`, `paystack_mode`, `mollie_api_key`, `mollie_status`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`, `payfast_mode`, `payfast_status`, `authorize_api_login_id`, `authorize_transaction_key`, `authorize_environment`, `authorize_status`, `square_application_id`, `square_access_token`, `square_location_id`, `square_environment`, `square_status`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_webhook_secret_hash`, `flutterwave_status`, `flutterwave_mode`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 'deactive', 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, 'deactive', 'test', NULL, NULL, NULL, NULL, NULL, 'inactive', 'test', NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.paystack.co', 'deactive', 'sandbox', NULL, 'deactive', NULL, NULL, NULL, NULL, NULL, NULL, 'sandbox', 'deactive', NULL, NULL, 'sandbox', 'deactive', NULL, NULL, NULL, 'sandbox', 'deactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'deactive', 'sandbox', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `global_app_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_background_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#1D82F5',
  `sidebar_logo_style` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'square',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `last_license_verified_at` timestamp NULL DEFAULT NULL,
  `google_recaptcha_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v2_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v2_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v2_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v3_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `google_recaptcha_v3_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_v3_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_debug` tinyint(1) NOT NULL DEFAULT '0',
  `currency_converter_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_key_version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `moment_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DD-MM-YYYY',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  `license_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_cron_message` tinyint(1) NOT NULL DEFAULT '0',
  `system_update` tinyint(1) NOT NULL DEFAULT '1',
  `show_review_modal` tinyint(1) NOT NULL DEFAULT '1',
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_theme` enum('dark','light') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `session_driver` enum('file','database') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `allowed_file_types` text COLLATE utf8mb4_unicode_ci,
  `allowed_file_size` int(11) NOT NULL DEFAULT '10',
  `datatable_row_limit` int(11) NOT NULL DEFAULT '10',
  `show_update_popup` tinyint(1) NOT NULL DEFAULT '1',
  `google_calendar_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `google_client_id` text COLLATE utf8mb4_unicode_ci,
  `google_client_secret` text COLLATE utf8mb4_unicode_ci,
  `google_calendar_verification_status` enum('verified','non_verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'non_verified',
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i a',
  `latitude` decimal(10,8) NOT NULL DEFAULT '26.91243360',
  `longitude` decimal(11,8) NOT NULL DEFAULT '75.78727090',
  `active_theme` enum('default','custom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `google_map_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rounded_theme` tinyint(1) NOT NULL,
  `front_design` tinyint(1) NOT NULL DEFAULT '1',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `logo_front` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ui` tinyint(1) NOT NULL,
  `auth_css` longtext COLLATE utf8mb4_unicode_ci,
  `auth_css_theme_two` longtext COLLATE utf8mb4_unicode_ci,
  `new_company_locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_disable` tinyint(1) NOT NULL DEFAULT '0',
  `setup_homepage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `custom_homepage_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_message` text COLLATE utf8mb4_unicode_ci,
  `enable_register` tinyint(1) NOT NULL DEFAULT '1',
  `registration_open` tinyint(1) NOT NULL DEFAULT '1',
  `company_need_approval` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `global_app_name`, `logo`, `light_logo`, `login_background`, `logo_background_color`, `header_color`, `sidebar_logo_style`, `locale`, `hash`, `purchase_code`, `supported_until`, `last_license_verified_at`, `google_recaptcha_status`, `google_recaptcha_v2_status`, `google_recaptcha_v2_site_key`, `google_recaptcha_v2_secret_key`, `google_recaptcha_v3_status`, `google_recaptcha_v3_site_key`, `google_recaptcha_v3_secret_key`, `app_debug`, `currency_converter_key`, `currency_key_version`, `moment_format`, `timezone`, `rtl`, `license_type`, `hide_cron_message`, `system_update`, `show_review_modal`, `last_cron_run`, `favicon`, `auth_theme`, `session_driver`, `allowed_file_types`, `allowed_file_size`, `datatable_row_limit`, `show_update_popup`, `google_calendar_status`, `google_client_id`, `google_client_secret`, `google_calendar_verification_status`, `google_id`, `name`, `token`, `created_at`, `updated_at`, `company_email`, `company_phone`, `address`, `website`, `currency_id`, `date_format`, `date_picker_format`, `time_format`, `latitude`, `longitude`, `active_theme`, `last_updated_by`, `google_map_key`, `rounded_theme`, `front_design`, `email_verification`, `logo_front`, `login_ui`, `auth_css`, `auth_css_theme_two`, `new_company_locale`, `frontend_disable`, `setup_homepage`, `custom_homepage_url`, `expired_message`, `enable_register`, `registration_open`, `company_need_approval`) VALUES
(1, 'One Business Platform', 'c3ed8241d3d5d4ff163e15fa479c9337.png', '2e7768b71d3f83f22c878f1683b1d641.png', 'f3fee2d50802c1e5fed7e88604f3ca15.png', '#FFFFFF', '#00A0DF', 'square', 'en', 'c563f2eba2e544e33eac435d093a2ada', 'b1efaebc-f003-4623-ac25-8b5005286e40', '2023-11-04 04:37:18', '2023-05-27 05:21:11', 'deactive', 'deactive', NULL, NULL, 'deactive', NULL, NULL, 0, NULL, 'free', 'DD-MM-YYYY', 'America/New_York', 0, 'Extended License', 0, 1, 1, NULL, 'cb5d1d2c9f31ac9ad0d583d145e82881.png', 'light', 'file', 'image/*,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/docx,application/pdf,text/plain,application/msword,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/zip,application/x-zip-compressed, application/x-compressed, multipart/x-zip,.xlsx,video/x-flv,video/mp4,application/x-mpegURL,video/MP2T,video/3gpp,video/quicktime,video/x-msvideo,video/x-ms-wmv,application/sla,.stl', 10, 10, 1, 'inactive', NULL, NULL, 'non_verified', NULL, NULL, NULL, '2023-05-25 21:22:04', '2023-05-27 05:48:18', '', NULL, NULL, NULL, 1, 'm-d-Y', NULL, 'h:i A', 26.91243360, 75.78727090, 'default', NULL, '', 0, 1, 0, '4108c5c7488adc986fd4f908364fb0d8.png', 0, NULL, NULL, NULL, 0, 'signup', NULL, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `global_subscriptions`
--

CREATE TABLE `global_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `subscribed_on_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google_calendar_modules`
--

CREATE TABLE `google_calendar_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_status` tinyint(1) NOT NULL DEFAULT '0',
  `leave_status` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_status` tinyint(1) NOT NULL DEFAULT '0',
  `contract_status` tinyint(1) NOT NULL DEFAULT '0',
  `task_status` tinyint(1) NOT NULL DEFAULT '0',
  `event_status` tinyint(1) NOT NULL DEFAULT '0',
  `holiday_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_calendar_modules`
--

INSERT INTO `google_calendar_modules` (`id`, `company_id`, `lead_status`, `leave_status`, `invoice_status`, `contract_status`, `task_status`, `event_status`, `holiday_status`, `created_at`, `updated_at`) VALUES
(3, 3, 0, 0, 0, 0, 0, 0, 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `occassion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_number` bigint(20) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `default_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `status` enum('paid','unpaid','partial','canceled','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `recurring` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `billing_cycle` int(11) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `credit_note` tinyint(1) NOT NULL DEFAULT '0',
  `show_shipping_address` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `estimate_id` int(10) UNSIGNED DEFAULT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT '1',
  `due_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_recurring_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `company_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `custom_invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL,
  `last_viewed` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_images`
--

CREATE TABLE `invoice_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring`
--

CREATE TABLE `invoice_recurring` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `next_invoice_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `sub_total` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `show_shipping_address` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `day_of_month` int(11) DEFAULT '1',
  `day_of_week` int(11) DEFAULT '1',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rotation` enum('monthly','weekly','bi-weekly','quarterly','half-yearly','annually','daily') COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `client_can_stop` tinyint(1) NOT NULL DEFAULT '1',
  `unlimited_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `immediate_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring_items`
--

CREATE TABLE `invoice_recurring_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_recurring_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `taxes` text COLLATE utf8mb4_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring_item_images`
--

CREATE TABLE `invoice_recurring_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_recurring_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

CREATE TABLE `invoice_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `invoice_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `estimate_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EST',
  `estimate_number_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `estimate_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `credit_note_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CN',
  `credit_note_number_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `credit_note_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `contract_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CONT',
  `contract_number_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `contract_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `order_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ODR',
  `order_number_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `order_digit` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_after` int(11) NOT NULL,
  `invoice_terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimate_terms` text COLLATE utf8mb4_unicode_ci,
  `gst_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_gst` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `logo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code_show` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `send_reminder` int(11) NOT NULL DEFAULT '0',
  `reminder` enum('after','every') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_reminder_after` int(11) NOT NULL DEFAULT '0',
  `tax_calculation_msg` tinyint(1) NOT NULL DEFAULT '0',
  `show_status` tinyint(1) NOT NULL DEFAULT '1',
  `authorised_signatory` tinyint(1) NOT NULL DEFAULT '0',
  `authorised_signatory_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_project` int(11) NOT NULL DEFAULT '0',
  `show_client_name` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `show_client_email` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `show_client_phone` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `show_client_company_address` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `show_client_company_name` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `company_id`, `invoice_prefix`, `invoice_number_separator`, `invoice_digit`, `estimate_prefix`, `estimate_number_separator`, `estimate_digit`, `credit_note_prefix`, `credit_note_number_separator`, `credit_note_digit`, `contract_prefix`, `contract_number_separator`, `contract_digit`, `order_prefix`, `order_number_separator`, `order_digit`, `template`, `due_after`, `invoice_terms`, `estimate_terms`, `gst_number`, `show_gst`, `logo`, `hsn_sac_code_show`, `locale`, `send_reminder`, `reminder`, `send_reminder_after`, `tax_calculation_msg`, `show_status`, `authorised_signatory`, `authorised_signatory_signature`, `show_project`, `show_client_name`, `show_client_email`, `show_client_phone`, `show_client_company_address`, `show_client_company_name`, `created_at`, `updated_at`) VALUES
(3, 3, 'INV', '#', 3, 'EST', '#', 3, 'CN', '#', 3, 'CONT', '#', 3, 'ODR', '#', 3, 'invoice-5', 15, 'Thank you for your business.', NULL, NULL, 'no', NULL, 0, 'en', 0, NULL, 0, 0, 1, 0, NULL, 0, 'yes', 'yes', 'yes', 'yes', 'yes', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','resolved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_bases`
--

CREATE TABLE `knowledge_bases` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'employee',
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_files`
--

CREATE TABLE `knowledge_base_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `knowledge_base_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_categories`
--

CREATE TABLE `knowledge_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

CREATE TABLE `language_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flag_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`, `flag_code`) VALUES
(1, 'en', 'English', 'enabled', NULL, NULL, 'en'),
(2, 'ar', 'Arabic', 'disabled', NULL, NULL, 'sa'),
(3, 'de', 'German', 'disabled', NULL, NULL, 'de'),
(4, 'es', 'Spanish', 'disabled', NULL, NULL, 'es'),
(5, 'et', 'Estonian', 'disabled', NULL, NULL, 'et'),
(6, 'fa', 'Farsi', 'disabled', NULL, NULL, 'ir'),
(7, 'fr', 'French', 'disabled', NULL, NULL, 'fr'),
(8, 'gr', 'Greek', 'disabled', NULL, NULL, 'gr'),
(9, 'it', 'Italian', 'disabled', NULL, NULL, 'it'),
(10, 'nl', 'Dutch', 'disabled', NULL, NULL, 'nl'),
(11, 'pl', 'Polish', 'disabled', NULL, NULL, 'pl'),
(12, 'pt', 'Portuguese', 'disabled', NULL, NULL, 'pt'),
(13, 'pt-br', 'Portuguese (Brazil)', 'disabled', NULL, NULL, 'br'),
(14, 'ro', 'Romanian', 'disabled', NULL, NULL, 'ro'),
(15, 'ru', 'Russian', 'disabled', NULL, NULL, 'ru'),
(16, 'tr', 'Turkish', 'disabled', NULL, NULL, 'tr'),
(17, 'zh-CN', 'Chinese (S)', 'disabled', NULL, NULL, 'cn'),
(18, 'zh-TW', 'Chinese (T)', 'disabled', NULL, NULL, 'cn');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `column_priority` int(11) NOT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `salutation` enum('mr','mrs','miss','dr','sir','madam') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `next_follow_up` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `value` double DEFAULT '0',
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_agents`
--

CREATE TABLE `lead_agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_category`
--

CREATE TABLE `lead_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_custom_forms`
--

CREATE TABLE `lead_custom_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_fields_id` int(10) UNSIGNED DEFAULT NULL,
  `field_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_order` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_custom_forms`
--

INSERT INTO `lead_custom_forms` (`id`, `company_id`, `custom_fields_id`, `field_display_name`, `field_name`, `field_order`, `status`, `required`, `added_by`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(27, 3, NULL, 'Name', 'name', 1, 'active', 1, NULL, NULL, NULL, NULL),
(28, 3, NULL, 'Email', 'email', 2, 'active', 0, NULL, NULL, NULL, NULL),
(29, 3, NULL, 'Company Name', 'company_name', 3, 'active', 0, NULL, NULL, NULL, NULL),
(30, 3, NULL, 'Website', 'website', 4, 'active', 0, NULL, NULL, NULL, NULL),
(31, 3, NULL, 'Address', 'address', 5, 'active', 0, NULL, NULL, NULL, NULL),
(32, 3, NULL, 'Mobile', 'mobile', 6, 'active', 0, NULL, NULL, NULL, NULL),
(33, 3, NULL, 'Message', 'message', 7, 'active', 0, NULL, NULL, NULL, NULL),
(34, 3, NULL, 'City', 'city', 1, 'active', 0, NULL, NULL, NULL, NULL),
(35, 3, NULL, 'State', 'state', 2, 'active', 0, NULL, NULL, NULL, NULL),
(36, 3, NULL, 'Country', 'country', 3, 'active', 0, NULL, NULL, NULL, NULL),
(37, 3, NULL, 'Postal Code', 'postal_code', 4, 'active', 0, NULL, NULL, NULL, NULL),
(38, 3, NULL, 'Source', 'source', 8, 'active', 0, NULL, NULL, NULL, NULL),
(39, 3, NULL, 'Product', 'product', 9, 'active', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_files`
--

CREATE TABLE `lead_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_follow_up`
--

CREATE TABLE `lead_follow_up` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `next_follow_up_date` datetime DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `send_reminder` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `remind_time` text COLLATE utf8mb4_unicode_ci,
  `remind_type` enum('minute','hour','day') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_notes`
--

CREATE TABLE `lead_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED DEFAULT NULL,
  `is_lead_show` tinyint(1) NOT NULL DEFAULT '0',
  `ask_password` tinyint(1) NOT NULL DEFAULT '0',
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_products`
--

CREATE TABLE `lead_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `company_id`, `type`, `added_by`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(13, 3, 'email', NULL, NULL, NULL, NULL),
(14, 3, 'google', NULL, NULL, NULL, NULL),
(15, 3, 'facebook', NULL, NULL, NULL, NULL),
(16, 3, 'friend', NULL, NULL, NULL, NULL),
(17, 3, 'direct visit', NULL, NULL, NULL, NULL),
(18, 3, 'tv ad', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE `lead_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `label_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ff0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`id`, `company_id`, `type`, `priority`, `default`, `label_color`, `created_at`, `updated_at`) VALUES
(7, 3, 'pending', 1, 1, '#FFE700', NULL, NULL),
(8, 3, 'in process', 2, 0, '#009EFF', NULL, NULL),
(9, 3, 'done', 3, 0, '#1FAE07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_user_notes`
--

CREATE TABLE `lead_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lead_note_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_date` date NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('approved','pending','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reject_reason` text COLLATE utf8mb4_unicode_ci,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `half_day_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager_status_permission` enum('pre-approve','approved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_reason` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_files`
--

CREATE TABLE `leave_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_settings`
--

CREATE TABLE `leave_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `manager_permission` enum('pre-approve','approved','cannot-approve') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pre-approve',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_settings`
--

INSERT INTO `leave_settings` (`id`, `company_id`, `manager_permission`, `created_at`, `updated_at`) VALUES
(3, 3, 'pre-approve', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_leaves` int(11) NOT NULL DEFAULT '5',
  `paid` tinyint(1) NOT NULL DEFAULT '1',
  `monthly_limit` int(11) NOT NULL DEFAULT '0',
  `effective_after` int(11) DEFAULT NULL,
  `effective_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unused_leave` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encashed` tinyint(1) NOT NULL,
  `allowed_probation` tinyint(1) NOT NULL,
  `allowed_notice` tinyint(1) NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `company_id`, `type_name`, `color`, `no_of_leaves`, `paid`, `monthly_limit`, `effective_after`, `effective_type`, `unused_leave`, `encashed`, `allowed_probation`, `allowed_notice`, `gender`, `marital_status`, `department`, `designation`, `role`, `created_at`, `updated_at`) VALUES
(7, 3, 'Casual', '#16813D', 5, 1, 0, NULL, NULL, NULL, 0, 0, 0, '[\"male\",\"female\",\"others\"]', '[\"married\",\"unmarried\"]', '[1]', '[1]', '[7,8]', NULL, '2023-05-25 21:37:23'),
(8, 3, 'Sick', '#DB1313', 5, 1, 0, NULL, NULL, NULL, 0, 0, 0, '[\"male\",\"female\",\"others\"]', '[\"married\",\"unmarried\"]', '[1]', '[1]', '[7,8]', NULL, '2023-05-25 21:37:23'),
(9, 3, 'Earned', '#B078C6', 5, 1, 0, NULL, NULL, NULL, 0, 0, 0, '[\"male\",\"female\",\"others\"]', '[\"married\",\"unmarried\"]', '[1]', '[1]', '[7,8]', NULL, '2023-05-25 21:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `log_time_for`
--

CREATE TABLE `log_time_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `log_time_for` enum('project','task') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'project',
  `auto_timer_stop` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `approval_required` tinyint(1) NOT NULL,
  `tracker_reminder` tinyint(1) NOT NULL,
  `timelog_report` tinyint(1) NOT NULL,
  `daily_report_roles` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_time_for`
--

INSERT INTO `log_time_for` (`id`, `company_id`, `log_time_for`, `auto_timer_stop`, `approval_required`, `tracker_reminder`, `timelog_report`, `daily_report_roles`, `created_at`, `updated_at`, `time`) VALUES
(3, 3, 'project', 'no', 0, 0, 0, NULL, '2023-05-25 21:34:59', '2023-05-25 21:34:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translate_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setting_menu` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_settings`
--

CREATE TABLE `menu_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_menu` longtext COLLATE utf8mb4_unicode_ci,
  `default_main_menu` longtext COLLATE utf8mb4_unicode_ci,
  `setting_menu` longtext COLLATE utf8mb4_unicode_ci,
  `default_setting_menu` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_settings`
--

CREATE TABLE `message_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `allow_client_admin` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `allow_client_employee` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `restrict_client` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `send_sound_notification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_settings`
--

INSERT INTO `message_settings` (`id`, `company_id`, `allow_client_admin`, `allow_client_employee`, `restrict_client`, `created_at`, `updated_at`, `send_sound_notification`) VALUES
(3, 3, 'no', 'no', 'no', '2023-05-25 21:34:59', '2023-05-25 21:34:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_01_01_000000_create_worksuite_table_collation_fix', 1),
(2, '2018_01_01_000000_create_worksuite_new_table', 1),
(3, '2018_01_01_000000_create_worksuite_saas_upgrade_new_table', 1),
(4, '2018_02_01_000000_create_worksuite_saas_upgrade_fix_table', 1),
(5, '2022_07_04_111754_add_project_short_code_column_project_table', 1),
(6, '2022_07_14_063826_contract_templates', 1),
(7, '2022_07_22_042424_create_proposal_templates_table', 1),
(8, '2022_07_28_043824_add_export_column_custom_fields_table', 1),
(9, '2022_08_03_101616_create_event_files_table', 1),
(10, '2022_08_12_000000_create_other_migration_till_date_table', 1),
(11, '2022_08_13_070443_add_task_unique_id_column_tasks_table', 1),
(12, '2022_08_18_120924_create_task_settings_table', 1),
(13, '2022_08_19_100314_add_leave_widget_in_dashboard_widget_table', 1),
(14, '2022_08_19_115209_create_project_status_settings_table', 1),
(15, '2022_08_22_104028_knowledge_heading_missing', 1),
(16, '2022_08_23_065943_change_status_type_projects_table', 1),
(17, '2022_08_24_122345_add_lead_widget_in_dashboard_widget_table', 1),
(18, '2022_08_25_085025_add_other_location_to_attendances_table', 1),
(19, '2022_08_25_123713_add_work_from_home_widget_in_dashboard_widgets_table', 1),
(20, '2022_08_26_042542_remove_on_delete_cascade_from_invoice_recurring_id_to_invoices', 1),
(21, '2022_08_26_053139_add_parent_id_column_designation_table', 1),
(22, '2022_08_29_064339_add_added_by_to_project_template', 1),
(23, '2022_08_29_103443_add_flag_code_column_to_language_settings', 1),
(24, '2022_09_00_000000_create_company_table', 1),
(25, '2022_09_01_000000_add_company_id_in_all_table', 1),
(26, '2022_09_01_060824_create_appreciations_table', 1),
(27, '2022_09_01_083053_create_global_settings_table', 1),
(28, '2022_09_02_151515_create_flags_table', 1),
(29, '2022_09_05_064405_add_miro_board_column_in_project_table', 1),
(30, '2022_09_07_172743_add_lead_status_column_to_permissions', 1),
(31, '2022_09_13_075642_add_customised_permission_column', 1),
(32, '2022_09_13_075642_create_leave_settings_table', 1),
(33, '2022_09_16_071005_add_headcount_and_joining_vs_attrition_widget_in_dashboard_widget_table', 1),
(34, '2022_09_16_105720_update_permission_of_client_and_employee_document', 1),
(35, '2022_09_19_124014_add_delete_approve_leave_in_permission_table', 1),
(36, '2022_09_20_045836_add_bank_account_module_in_module_table', 1),
(37, '2022_09_23_053942_update_type_of_hsn_sac_code_to_proposal_template_items', 1),
(38, '2022_09_23_181722_add_approve_reason_column_to_leaves_table', 1),
(39, '2022_10_03_080325_create_super_admin_tables_table', 1),
(40, '2022_10_09_155207_add_custom_year_to_companies_table', 1),
(41, '2022_10_19_112953_create_user_auths_table', 1),
(42, '2022_10_31_130459_order_with_order_number', 1),
(43, '2022_11_03_115958_add_auto_clock_in_location_to_attendance_settings_table', 1),
(44, '2022_11_16_122431_add_contract_note_to_contracts_table', 1),
(45, '2022_11_23_070556_show_new_webhook_alert', 1),
(46, '2022_11_24_112953_create_global_payment_gateway_credentials_table', 1),
(47, '2022_11_25_083742_add_company_id_for_null_values', 1),
(48, '2022_12_01_070705_create_leave_files_table', 1),
(49, '2022_12_05_062331_create_emoji_address_ticket_widget_table', 1),
(50, '2022_12_12_113800_add_wasabi_hash_test_payfast', 1),
(51, '2022_12_13_071454_add_currency_id_in_currency_format_table', 1),
(52, '2022_12_13_112213_add_new_fields_in_employee_details_table', 1),
(53, '2022_12_28_112213_add_new_fields_in_companies_table', 1),
(54, '2022_12_29_061634_add_column_in_invoice_table', 1),
(55, '2022_12_29_084526_create_subscriptions_table', 1),
(56, '2022_12_30_045028_add_number_separator_to_invoice_settings_table', 1),
(57, '2022_12_30_090615_move_google_map_key', 1),
(58, '2023_01_05_084453_add_column_in_log_time_table', 1),
(59, '2023_01_09_162235_create_estimate_templates_table', 1),
(60, '2023_01_11_080325_create_super_admin_paystack_subscription_tables_table', 1),
(61, '2023_01_20_052539_create_unit_types_table', 1),
(62, '2023_01_23_122023_add_column_in_invoice_recurring_table', 1),
(63, '2023_01_31_072924_add_settings_to_email_notification_settings', 1),
(64, '2023_02_01_085841_add_company_sign_contracts_table', 1),
(65, '2023_02_04_064358_create_lead_products_table', 1),
(66, '2023_02_07_122807_create_quick_books_settings_table', 1),
(67, '2023_02_09_083357_create_passprt_and_visa_table', 1),
(68, '2023_02_13_045833_add_report_column_in_log_time_table', 1),
(69, '2023_02_15_045950_add_unit_id_orders_table', 1),
(70, '2023_02_15_121548_add_data_in_ticket_custom_forms_table', 1),
(71, '2023_02_17_052112_add_permissions_for_lead_report', 1),
(72, '2023_02_27_081104_add_column_in_leave_type_table', 1),
(73, '2023_03_02_065728_custom_fileds_data_fix', 1),
(74, '2023_03_05_065728_missing_data_fix', 1),
(75, '2023_03_16_105629_add_manage_ticket_group_field_in_permission_table', 1),
(76, '2023_03_17_045842_lead_custom_field', 1),
(77, '2023_03_21_090422_add_order_prefix_in_invoice_settings_table', 1),
(78, '2023_03_21_120725_fix_global_invoices_saas_fix', 1),
(79, '2023_03_23_064221_add_country_phonecode_column_in_users_table', 1),
(80, '2023_03_24_073030_add_payment_columns_in_invoices_table', 1),
(81, '2023_03_24_081626_add_permission_for_sales_report', 1),
(82, '2023_03_29_072032_create_order_carts_table', 1),
(83, '2023_03_29_090137_create_custom_link_settings_table', 1),
(84, '2023_03_30_191625_add_restrict_admin_theme_change_column_theme_settings', 1),
(85, '2023_03_31_123237_fix_timelog_project_id', 1),
(86, '2023_04_03_132318_fix_invoice_units', 1),
(87, '2023_04_04_101429_google_calendar_keys_move_to_global_settings', 1),
(88, '2023_04_11_083659_add_bank_column_in_recurring_invoice_table', 1),
(89, '2023_04_11_092420_add_overwrite_existing_attendance_column_in_attendances_table', 1),
(90, '2023_04_11_101429_task_hash_insert_in_task_table', 1),
(91, '2023_04_18_061829_add_file_column_in_employee_shift_schedules_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'clients', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(2, 'employees', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(3, 'projects', 'User can view the basic details of projects assigned to him even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(4, 'attendance', 'User can view his own attendance even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(5, 'tasks', 'User can view the tasks assigned to him even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(6, 'estimates', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(7, 'invoices', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(8, 'payments', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(9, 'timelogs', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(10, 'tickets', 'User can view the tickets generated by him as default even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(11, 'events', 'User can view the events to be attended by him as default even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(12, 'notices', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(13, 'leaves', 'User can view the leaves applied by him as default even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(14, 'leads', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(15, 'holidays', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(16, 'products', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(17, 'expenses', 'User can view and add(self expenses) the expenses as default even without any permission.', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(18, 'contracts', 'User can view all contracts', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(19, 'reports', 'User can manage permission of particular report', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(20, 'settings', 'User can manage settings', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(21, 'dashboards', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(22, 'orders', NULL, '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(23, 'knowledgebase', NULL, '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(24, 'bankaccount', NULL, '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(25, 'messages', NULL, '2023-05-25 21:21:51', '2023-05-25 21:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','employee','client') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_allowed` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `company_id`, `module_name`, `status`, `type`, `created_at`, `updated_at`, `is_allowed`) VALUES
(355, 3, 'employees', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(356, 3, 'employees', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(357, 3, 'tasks', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(358, 3, 'tasks', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(359, 3, 'tasks', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(360, 3, 'tickets', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(361, 3, 'tickets', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(362, 3, 'tickets', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(363, 3, 'events', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(364, 3, 'events', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(365, 3, 'events', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(366, 3, 'notices', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(367, 3, 'notices', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(368, 3, 'notices', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(369, 3, 'reports', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(370, 3, 'reports', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(371, 3, 'knowledgebase', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(372, 3, 'knowledgebase', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(373, 3, 'knowledgebase', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(374, 3, 'messages', 'active', 'client', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(375, 3, 'messages', 'active', 'employee', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1),
(376, 3, 'messages', 'active', 'admin', '2023-05-26 03:35:38', '2023-05-26 03:35:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mollie_invoices`
--

CREATE TABLE `mollie_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mollie_subscriptions`
--

CREATE TABLE `mollie_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'employee',
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_views`
--

CREATE TABLE `notice_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1dcb37d3-1cce-4843-9263-c978df0400cf', 'App\\Notifications\\SuperAdmin\\NewCompanyRegister', 'App\\Models\\User', 1, '{\"id\":3,\"company_name\":\"Demo Company\",\"app_name\":\"Demo Company\",\"company_email\":\"admin@techsuiteone.com\",\"company_phone\":null,\"logo\":null,\"light_logo\":null,\"favicon\":null,\"auth_theme\":\"light\",\"sidebar_logo_style\":\"square\",\"login_background\":null,\"address\":\"Demo Company\",\"website\":null,\"currency_id\":9,\"package_id\":1,\"package_type\":\"monthly\",\"timezone\":\"Asia\\/Kolkata\",\"date_format\":\"d-m-Y\",\"date_picker_format\":\"dd-mm-yyyy\",\"year_starts_from\":\"1\",\"moment_format\":\"DD-MM-YYYY\",\"time_format\":\"h:i a\",\"locale\":\"en\",\"latitude\":\"26.91243360\",\"longitude\":\"75.78727090\",\"leaves_start_from\":\"joining_date\",\"active_theme\":\"default\",\"status\":\"active\",\"last_updated_by\":null,\"currency_converter_key\":null,\"google_map_key\":null,\"task_self\":\"yes\",\"purchase_code\":null,\"license_type\":null,\"supported_until\":null,\"google_recaptcha_status\":\"deactive\",\"google_recaptcha_v2_status\":\"deactive\",\"google_recaptcha_v2_site_key\":null,\"google_recaptcha_v2_secret_key\":null,\"google_recaptcha_v3_status\":\"deactive\",\"google_recaptcha_v3_site_key\":null,\"google_recaptcha_v3_secret_key\":null,\"app_debug\":0,\"rounded_theme\":1,\"hide_cron_message\":0,\"system_update\":1,\"logo_background_color\":\"#ffffff\",\"header_color\":\"#1D82F5\",\"before_days\":0,\"after_days\":0,\"on_deadline\":\"yes\",\"default_task_status\":9,\"show_review_modal\":1,\"dashboard_clock\":1,\"ticket_form_google_captcha\":0,\"lead_form_google_captcha\":0,\"taskboard_length\":10,\"datatable_row_limit\":10,\"last_cron_run\":null,\"session_driver\":\"file\",\"allow_client_signup\":0,\"admin_client_signup_approval\":0,\"allowed_file_types\":null,\"google_calendar_status\":\"inactive\",\"google_client_id\":null,\"google_client_secret\":null,\"google_calendar_verification_status\":\"non_verified\",\"google_id\":null,\"name\":null,\"token\":null,\"hash\":\"d1419ba121472e66ff1da0e0013f6dc1\",\"allowed_file_size\":10,\"currency_key_version\":\"free\",\"last_login\":null,\"rtl\":0,\"stripe_id\":null,\"card_brand\":null,\"card_last_four\":null,\"trial_ends_at\":null,\"licence_expire_on\":null,\"license_updated_at\":null,\"subscription_updated_at\":null,\"approved\":1,\"approved_by\":null,\"show_new_webhook_alert\":0,\"pm_type\":null,\"pm_last_four\":null,\"logo_url\":\"https:\\/\\/myapps.techsuiteone.com\\/img\\/worksuite-logo.png\",\"login_background_url\":null,\"moment_date_format\":\"DD-MM-YYYY\",\"favicon_url\":\"https:\\/\\/myapps.techsuiteone.com\\/favicon.png\",\"package\":{\"id\":1,\"currency_id\":1,\"name\":\"Default\",\"description\":\"Its a default package and cannot be deleted\",\"max_storage_size\":0,\"max_file_size\":0,\"annual_price\":0,\"monthly_price\":0,\"billing_cycle\":0,\"max_employees\":20,\"sort\":\"1\",\"module_in_package\":\"[\\\"clients\\\",\\\"employees\\\",\\\"projects\\\",\\\"attendance\\\",\\\"tasks\\\",\\\"estimates\\\",\\\"invoices\\\",\\\"payments\\\",\\\"timelogs\\\",\\\"tickets\\\",\\\"events\\\",\\\"notices\\\",\\\"leaves\\\",\\\"leads\\\",\\\"holidays\\\",\\\"products\\\",\\\"expenses\\\",\\\"contracts\\\",\\\"reports\\\",\\\"orders\\\",\\\"knowledgebase\\\",\\\"bankaccount\\\",\\\"messages\\\"]\",\"stripe_annual_plan_id\":null,\"stripe_monthly_plan_id\":null,\"razorpay_annual_plan_id\":null,\"razorpay_monthly_plan_id\":null,\"default\":\"yes\",\"paystack_monthly_plan_id\":null,\"paystack_annual_plan_id\":null,\"is_private\":0,\"storage_unit\":\"mb\",\"is_recommended\":0,\"is_free\":1,\"is_auto_renew\":0,\"monthly_status\":\"1\",\"annual_status\":\"1\",\"formatted_annual_price\":\"$0.00\",\"formatted_monthly_price\":\"$0.00\"}}', NULL, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
('41eeec5c-dd8c-4e6d-a531-d499a2889fa5', 'App\\Notifications\\NewUser', 'App\\Models\\User', 4, '{\"id\":4,\"company_id\":3,\"user_auth_id\":3,\"is_superadmin\":0,\"name\":\"Admin\",\"email\":\"admin@techsuiteone.com\",\"image\":null,\"country_phonecode\":null,\"mobile\":null,\"gender\":null,\"salutation\":null,\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"last_login\":null,\"email_notifications\":1,\"country_id\":null,\"dark_theme\":0,\"rtl\":0,\"admin_approval\":1,\"permission_sync\":1,\"google_calendar_status\":1,\"customised_permissions\":0,\"stripe_id\":null,\"pm_type\":null,\"pm_last_four\":null,\"trial_ends_at\":null,\"image_url\":\"https:\\/\\/www.gravatar.com\\/avatar\\/aff892426250706c048cd9276d5d27db.png?s=200&d=mp\",\"modules\":[],\"mobile_with_phonecode\":\"--\",\"client_details\":null,\"employee_detail\":null}', '2023-05-26 03:12:19', '2023-05-25 21:34:59', '2023-05-26 03:12:19'),
('dd968ca5-02bd-4ad3-99b3-840664cbcb4f', 'App\\Notifications\\NewUser', 'App\\Models\\User', 5, '{\"id\":5,\"company_id\":3,\"user_auth_id\":4,\"is_superadmin\":0,\"name\":\"user\",\"email\":\"user@techsuiteone.com\",\"image\":null,\"country_phonecode\":93,\"mobile\":null,\"gender\":\"male\",\"salutation\":null,\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"last_login\":null,\"email_notifications\":1,\"country_id\":1,\"dark_theme\":0,\"rtl\":0,\"admin_approval\":1,\"permission_sync\":1,\"google_calendar_status\":1,\"customised_permissions\":0,\"stripe_id\":null,\"pm_type\":null,\"pm_last_four\":null,\"trial_ends_at\":null,\"image_url\":\"https:\\/\\/www.gravatar.com\\/avatar\\/78ef1a43e3eedd6065c67cdd7f8c6506.png?s=200&d=mp\",\"modules\":[\"clients\",\"projects\",\"tickets\",\"invoices\",\"estimates\",\"events\",\"messages\",\"tasks\",\"timelogs\",\"contracts\",\"notices\",\"payments\",\"orders\",\"knowledgebase\",\"employees\",\"attendance\",\"expenses\",\"leaves\",\"leads\",\"holidays\",\"products\",\"reports\",\"bankaccount\"],\"mobile_with_phonecode\":\"--\",\"client_details\":null,\"employee_detail\":null}', NULL, '2023-05-25 21:39:12', '2023-05-25 21:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `offline_invoices`
--

CREATE TABLE `offline_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `status` enum('paid','unpaid','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offline_invoices`
--

INSERT INTO `offline_invoices` (`id`, `company_id`, `package_id`, `package_type`, `offline_method_id`, `transaction_id`, `amount`, `pay_date`, `next_pay_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 7, NULL, NULL, NULL, 1.00, '2023-05-26', '2023-06-26', 'paid', '2023-05-26 02:15:33', '2023-05-26 02:15:33'),
(2, 3, 6, NULL, NULL, NULL, 0.00, '2023-05-26', '2023-06-26', 'paid', '2023-05-26 02:17:31', '2023-05-26 02:22:17'),
(3, 3, 7, NULL, NULL, NULL, 1.00, '2023-05-26', '2023-06-26', 'paid', '2023-05-26 02:29:25', '2023-05-26 02:29:25'),
(4, 3, 6, NULL, NULL, NULL, 0.00, '2023-05-26', '2023-06-26', 'paid', '2023-05-26 02:34:01', '2023-05-26 02:34:01'),
(5, 3, 7, NULL, NULL, NULL, 1.00, '2023-05-26', '2023-06-26', 'paid', '2023-05-26 02:34:42', '2023-05-26 02:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_plan_changes`
--

CREATE TABLE `offline_plan_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('verified','pending','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `order_date` date NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(8,2) NOT NULL,
  `status` enum('pending','on-hold','failed','processing','completed','canceled','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `show_shipping_address` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `company_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `custom_order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_carts`
--

CREATE TABLE `order_carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_images`
--

CREATE TABLE `order_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_storage_size` int(11) NOT NULL,
  `max_file_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `annual_price` double DEFAULT '0',
  `monthly_price` double DEFAULT '0',
  `billing_cycle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `max_employees` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sort` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_in_package` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_annual_plan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_monthly_plan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` enum('yes','no','trial') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `paystack_monthly_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_annual_plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL,
  `storage_unit` enum('gb','mb') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mb',
  `is_recommended` tinyint(1) NOT NULL DEFAULT '0',
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `is_auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `monthly_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `annual_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `currency_id`, `name`, `description`, `max_storage_size`, `max_file_size`, `annual_price`, `monthly_price`, `billing_cycle`, `max_employees`, `sort`, `module_in_package`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `razorpay_annual_plan_id`, `razorpay_monthly_plan_id`, `default`, `paystack_monthly_plan_id`, `paystack_annual_plan_id`, `is_private`, `storage_unit`, `is_recommended`, `is_free`, `is_auto_renew`, `monthly_status`, `annual_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Forever Free Business Platform', 'Its a default package and cannot be deleted', -1, 0, 0, 0, 0, 10, '1', '{\"2\":\"employees\",\"5\":\"tasks\",\"10\":\"tickets\",\"25\":\"messages\"}', NULL, NULL, NULL, NULL, 'yes', NULL, NULL, 0, 'mb', 0, 0, 0, '1', '1', '2023-05-25 21:22:04', '2023-05-26 03:36:50'),
(2, 1, 'Trial', 'Its a trial package', 500, 0, 0, 0, 0, 20, '', '[\"clients\",\"employees\",\"projects\",\"attendance\",\"tasks\",\"estimates\",\"invoices\",\"payments\",\"timelogs\",\"tickets\",\"events\",\"notices\",\"leaves\",\"leads\",\"holidays\",\"products\",\"expenses\",\"contracts\",\"reports\",\"orders\",\"knowledgebase\",\"bankaccount\",\"messages\"]', 'trial_plan', 'trial_plan', NULL, NULL, 'trial', NULL, NULL, 0, 'mb', 0, 0, 0, '1', '1', '2023-05-25 21:22:04', '2023-05-25 21:22:04'),
(3, 1, 'Starter', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 500, 30, 500, 50, 10, 50, '2', '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"notices\",\"13\":\"leaves\",\"14\":\"leads\",\"15\":\"holidays\",\"16\":\"products\",\"17\":\"expenses\",\"18\":\"contracts\",\"19\":\"reports\",\"22\":\"orders\",\"23\":\"knowledgebase\",\"24\":\"bankaccount\",\"25\":\"messages\"}', 'starter_annual', 'starter_monthly', NULL, NULL, 'no', NULL, NULL, 1, 'mb', 0, 0, 0, '1', '1', '2023-05-25 21:22:04', '2023-05-25 23:23:36'),
(4, 1, 'Medium', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 500, 50, 1000, 100, 10, 100, '3', '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"notices\",\"13\":\"leaves\",\"14\":\"leads\",\"15\":\"holidays\",\"16\":\"products\",\"17\":\"expenses\",\"18\":\"contracts\",\"19\":\"reports\",\"22\":\"orders\",\"23\":\"knowledgebase\",\"24\":\"bankaccount\",\"25\":\"messages\"}', 'medium_annual', 'medium_monthly', NULL, NULL, 'no', NULL, NULL, 1, 'mb', 0, 0, 0, '1', '1', '2023-05-25 21:22:04', '2023-05-25 23:23:25'),
(5, 1, 'Larger', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 500, 100, 5000, 500, 10, 500, '4', '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"notices\",\"13\":\"leaves\",\"14\":\"leads\",\"15\":\"holidays\",\"16\":\"products\",\"17\":\"expenses\",\"18\":\"contracts\",\"19\":\"reports\",\"22\":\"orders\",\"23\":\"knowledgebase\",\"24\":\"bankaccount\",\"25\":\"messages\"}', 'larger_annual', 'larger_monthly', NULL, NULL, 'no', NULL, NULL, 1, 'mb', 0, 0, 0, '1', '1', '2023-05-25 21:22:04', '2023-05-25 23:23:09'),
(6, 1, 'FOREVER FREE', 'Enjoy the Tech Suite One Business Platform for FREE as long as you\'re on the platform.', -1, 0, 0, 0, 0, 20, '1', '{\"2\":\"employees\",\"5\":\"tasks\",\"10\":\"tickets\",\"25\":\"messages\"}', NULL, NULL, NULL, NULL, 'no', NULL, NULL, 0, 'mb', 0, 1, 0, '1', '1', '2023-05-25 23:33:42', '2023-05-26 03:36:27'),
(7, 1, 'PARTNER', 'Business Strategist', -1, 0, 199.99, 24.99, 0, 25, '2', '{\"2\":\"employees\",\"5\":\"tasks\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"notices\",\"19\":\"reports\",\"23\":\"knowledgebase\",\"25\":\"messages\"}', NULL, NULL, NULL, NULL, 'no', NULL, NULL, 0, 'mb', 0, 0, 0, '1', '1', '2023-05-25 23:41:32', '2023-05-26 03:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `package_settings`
--

CREATE TABLE `package_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `no_of_days` int(11) DEFAULT '30',
  `modules` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_message` text COLLATE utf8mb4_unicode_ci,
  `notification_before` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_settings`
--

INSERT INTO `package_settings` (`id`, `status`, `no_of_days`, `modules`, `trial_message`, `notification_before`, `created_at`, `updated_at`) VALUES
(1, 'inactive', 30, '[\"clients\",\"employees\",\"projects\",\"attendance\",\"tasks\",\"estimates\",\"invoices\",\"payments\",\"timelogs\",\"tickets\",\"events\",\"notices\",\"leaves\",\"leads\",\"holidays\",\"products\",\"expenses\",\"contracts\",\"reports\",\"orders\",\"knowledgebase\",\"bankaccount\",\"messages\"]', 'Start 30 days free trial', NULL, '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `passport_details`
--

CREATE TABLE `passport_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `passport_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payfast_invoices`
--

CREATE TABLE `payfast_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `m_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payfast_subscriptions`
--

CREATE TABLE `payfast_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `payfast_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payfast_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `ends_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `credit_notes_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `default_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('complete','pending','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_on` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `payment_gateway_response` text COLLATE utf8mb4_unicode_ci COMMENT 'null = success',
  `payload_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_account_id` int(10) UNSIGNED DEFAULT NULL,
  `quickbooks_payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `paypal_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `live_stripe_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_stripe_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_stripe_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `live_razorpay_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_razorpay_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `paypal_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `sandbox_paypal_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_paypal_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_stripe_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_razorpay_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_razorpay_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_mode` enum('test','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'test',
  `razorpay_mode` enum('test','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'test',
  `paystack_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_merchant_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `paystack_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `test_paystack_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_paystack_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_payment_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'https://api.paystack.co',
  `mollie_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `payfast_merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_passphrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `payfast_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'deactive',
  `authorize_api_login_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_transaction_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_environment` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `authorize_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `square_application_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_environment` enum('sandbox','production') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `square_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `flutterwave_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `flutterwave_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `test_flutterwave_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_flutterwave_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_flutterwave_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_flutterwave_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutterwave_webhook_secret_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_payfast_merchant_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `company_id`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `live_stripe_client_id`, `live_stripe_secret`, `live_stripe_webhook_secret`, `stripe_status`, `live_razorpay_key`, `live_razorpay_secret`, `razorpay_status`, `paypal_mode`, `sandbox_paypal_client_id`, `sandbox_paypal_secret`, `test_stripe_client_id`, `test_stripe_secret`, `test_stripe_webhook_secret`, `test_razorpay_key`, `test_razorpay_secret`, `stripe_mode`, `razorpay_mode`, `paystack_key`, `paystack_secret`, `paystack_merchant_email`, `paystack_status`, `paystack_mode`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`, `mollie_api_key`, `mollie_status`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `payfast_mode`, `payfast_status`, `authorize_api_login_id`, `authorize_transaction_key`, `authorize_environment`, `authorize_status`, `square_application_id`, `square_access_token`, `square_location_id`, `square_environment`, `square_status`, `flutterwave_status`, `flutterwave_mode`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_webhook_secret_hash`, `created_at`, `updated_at`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`) VALUES
(3, 3, NULL, NULL, 'deactive', NULL, NULL, NULL, 'deactive', NULL, NULL, 'inactive', 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, 'deactive', 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co', NULL, 'deactive', NULL, NULL, NULL, 'sandbox', 'deactive', NULL, NULL, 'sandbox', 'deactive', NULL, NULL, NULL, 'sandbox', 'deactive', 'deactive', 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 21:34:59', '2023-05-25 21:34:59', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_invoices`
--

CREATE TABLE `paypal_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `recurring` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `status` enum('paid','unpaid','pending') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_on` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_invoices`
--

CREATE TABLE `paystack_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_subscriptions`
--

CREATE TABLE `paystack_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_id`, `is_custom`, `allowed_permissions`, `created_at`, `updated_at`) VALUES
(1, 'add_clients', 'Add Clients', NULL, 1, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(2, 'view_clients', 'View Clients', NULL, 1, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(3, 'edit_clients', 'Edit Clients', NULL, 1, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(4, 'delete_clients', 'Delete Clients', NULL, 1, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(5, 'manage_client_category', 'Manage Client Category', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(6, 'manage_client_subcategory', 'Manage Client Subcategory', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(7, 'add_client_contacts', 'Add Client Contacts', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(8, 'view_client_contacts', 'View Client Contacts', NULL, 1, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(9, 'edit_client_contacts', 'Edit Client Contacts', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(10, 'delete_client_contacts', 'Delete Client Contacts', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(11, 'add_client_note', 'Add Client Note', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(12, 'view_client_note', 'View Client Note', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(13, 'edit_client_note', 'Edit Client Note', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(14, 'delete_client_note', 'Delete Client Note', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(15, 'add_client_document', 'Add Client Document', NULL, 1, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(16, 'view_client_document', 'View Client Document', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(17, 'edit_client_document', 'Edit Client Document', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(18, 'delete_client_document', 'Delete Client Document', NULL, 1, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(19, 'add_employees', 'Add Employees', NULL, 2, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(20, 'view_employees', 'View Employees', NULL, 2, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(21, 'edit_employees', 'Edit Employees', NULL, 2, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(22, 'delete_employees', 'Delete Employees', NULL, 2, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(23, 'add_designation', 'Add Designation', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(24, 'view_designation', 'View Designation', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(25, 'edit_designation', 'Edit Designation', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(26, 'delete_designation', 'Delete Designation', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(27, 'add_department', 'Add Department', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(28, 'view_department', 'View Department', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(29, 'edit_department', 'Edit Department', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(30, 'delete_department', 'Delete Department', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(31, 'add_documents', 'Add Documents', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(32, 'view_documents', 'View Documents', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(33, 'edit_documents', 'Edit Documents', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(34, 'delete_documents', 'Delete Documents', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:53'),
(35, 'view_leaves_taken', 'View Leaves Taken', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(36, 'update_leaves_quota', 'Update Leaves Quota', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(37, 'view_employee_tasks', 'View Employee Tasks', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(38, 'view_employee_projects', 'View Employee Projects', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(39, 'view_employee_timelogs', 'View Employee Timelogs', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(40, 'change_employee_role', 'Change Employee Role', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(41, 'manage_emergency_contact', 'Manage Emergency Contact', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(42, 'manage_award', 'Manage Award', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(43, 'add_appreciation', 'Add Appreciation', NULL, 2, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(44, 'view_appreciation', 'View Appreciation', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(45, 'edit_appreciation', 'Edit Appreciation', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(46, 'delete_appreciation', 'Delete Appreciation', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(47, 'add_immigration', 'Add Immigration', NULL, 2, 1, '{\"all\":4, \"owned\":2, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(48, 'view_immigration', 'View Immigration', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(49, 'edit_immigration', 'Edit Immigration', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(50, 'delete_immigration', 'Delete Immigration', NULL, 2, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(51, 'add_projects', 'Add Projects', NULL, 3, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(52, 'view_projects', 'View Projects', NULL, 3, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(53, 'edit_projects', 'Edit Projects', NULL, 3, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(54, 'delete_projects', 'Delete Projects', NULL, 3, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(55, 'manage_project_category', 'Manage Project Category', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(56, 'view_project_files', 'View Project Files', NULL, 3, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(57, 'add_project_files', 'Add Project Files', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(58, 'delete_project_files', 'Delete Project Files', NULL, 3, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(59, 'view_project_discussions', 'View Project Discussions', NULL, 3, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(60, 'add_project_discussions', 'Add Project Discussions', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(61, 'edit_project_discussions', 'Edit Project Discussions', NULL, 3, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(62, 'delete_project_discussions', 'Delete Project Discussions', NULL, 3, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(63, 'manage_discussion_category', 'Manage Discussion Category', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(64, 'view_project_milestones', 'View Project Milestones', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(65, 'add_project_milestones', 'Add Project Milestones', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(66, 'edit_project_milestones', 'Edit Project Milestones', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(67, 'delete_project_milestones', 'Delete Project Milestones', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(68, 'view_project_members', 'View Project Members', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(69, 'add_project_members', 'Add Project Members', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(70, 'edit_project_members', 'Edit Project Members', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(71, 'delete_project_members', 'Delete Project Members', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(72, 'view_project_rating', 'View Project Rating', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(73, 'add_project_rating', 'Add Project Rating', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(74, 'edit_project_rating', 'Edit Project Rating', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(75, 'delete_project_rating', 'Delete Project Rating', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(76, 'view_project_budget', 'View Project Budget', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(77, 'view_project_timelogs', 'View Project Timelogs', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(78, 'view_project_expenses', 'View Project Expenses', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(79, 'view_project_tasks', 'View Project Tasks', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(80, 'view_project_invoices', 'View Project Invoices', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(81, 'view_project_burndown_chart', 'View Project Burndown Chart', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(82, 'view_project_payments', 'View Project Payments', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(83, 'view_project_gantt_chart', 'View Project Gantt Chart', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(84, 'add_project_note', 'Add Project Note', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(85, 'view_project_note', 'View Project Note', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(86, 'edit_project_note', 'Edit Project Note', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(87, 'delete_project_note', 'Delete Project Note', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(88, 'manage_project_template', 'Manage Project Template', NULL, 3, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(89, 'view_project_template', 'View Project Template', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(90, 'view_project_hourly_rates', 'View Project Hourly Rates', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(91, 'create_public_project', 'Create Public Project', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(92, 'view_miroboard', 'View Miroboard', NULL, 3, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:22:04'),
(93, 'manage_employee_shifts', 'Manage Employee Shifts', NULL, 4, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(94, 'view_shift_roster', 'View Shift Roster', NULL, 4, 1, '{\"all\":4, \"owned\":2, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(95, 'add_attendance', 'Add Attendance', NULL, 4, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(96, 'view_attendance', 'View Attendance', NULL, 4, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(97, 'edit_attendance', 'Edit Attendance', NULL, 4, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(98, 'delete_attendance', 'Delete Attendance', NULL, 4, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(99, 'add_tasks', 'Add Tasks', NULL, 5, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(100, 'view_tasks', 'View Tasks', NULL, 5, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(101, 'edit_tasks', 'Edit Tasks', NULL, 5, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(102, 'delete_tasks', 'Delete Tasks', NULL, 5, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(103, 'view_task_category', 'View Task Category', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(104, 'add_task_category', 'Add Task Category', NULL, 5, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(105, 'edit_task_category', 'Edit Task Category', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(106, 'delete_task_category', 'Delete Task Category', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(107, 'view_task_files', 'View Task Files', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(108, 'add_task_files', 'Add Task Files', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(109, 'delete_task_files', 'Delete Task Files', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(110, 'view_sub_tasks', 'View Sub Tasks', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(111, 'add_sub_tasks', 'Add Sub Tasks', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(112, 'edit_sub_tasks', 'Edit Sub Tasks', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(113, 'delete_sub_tasks', 'Delete Sub Tasks', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(114, 'view_task_comments', 'View Task Comments', NULL, 5, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(115, 'add_task_comments', 'Add Task Comments', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(116, 'edit_task_comments', 'Edit Task Comments', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(117, 'delete_task_comments', 'Delete Task Comments', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(118, 'view_task_notes', 'View Task Notes', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(119, 'add_task_notes', 'Add Task Notes', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(120, 'edit_task_notes', 'Edit Task Notes', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(121, 'delete_task_notes', 'Delete Task Notes', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(122, 'task_labels', 'Task Labels', NULL, 5, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(123, 'change_status', 'Change Status', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(124, 'send_reminder', 'Send Reminder', NULL, 5, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(125, 'add_status', 'Add Status', NULL, 5, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(126, 'view_unassigned_tasks', 'View Unassigned Tasks', NULL, 5, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(127, 'create_unassigned_tasks', 'Create Unassigned Tasks', NULL, 5, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(128, 'add_estimates', 'Add Estimates', NULL, 6, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(129, 'view_estimates', 'View Estimates', NULL, 6, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(130, 'edit_estimates', 'Edit Estimates', NULL, 6, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(131, 'delete_estimates', 'Delete Estimates', NULL, 6, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(132, 'add_invoices', 'Add Invoices', NULL, 7, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(133, 'view_invoices', 'View Invoices', NULL, 7, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(134, 'edit_invoices', 'Edit Invoices', NULL, 7, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(135, 'delete_invoices', 'Delete Invoices', NULL, 7, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(136, 'manage_tax', 'Manage Tax', NULL, 7, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(137, 'link_invoice_bank_account', 'Link Invoice Bank Account', NULL, 7, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(138, 'manage_recurring_invoice', 'Manage Recurring Invoice', NULL, 7, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:22:00'),
(139, 'add_payments', 'Add Payments', NULL, 8, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(140, 'view_payments', 'View Payments', NULL, 8, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(141, 'edit_payments', 'Edit Payments', NULL, 8, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(142, 'delete_payments', 'Delete Payments', NULL, 8, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(143, 'link_payment_bank_account', 'Link Payment Bank Account', NULL, 8, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(144, 'add_timelogs', 'Add Timelogs', NULL, 9, 0, '{\"all\":4,\"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(145, 'view_timelogs', 'View Timelogs', NULL, 9, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(146, 'edit_timelogs', 'Edit Timelogs', NULL, 9, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(147, 'delete_timelogs', 'Delete Timelogs', NULL, 9, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(148, 'approve_timelogs', 'Approve Timelogs', NULL, 9, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(149, 'manage_active_timelogs', 'Manage Active Timelogs', NULL, 9, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(150, 'view_timelog_earnings', 'View Timelog Earnings', NULL, 9, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(151, 'add_tickets', 'Add Tickets', NULL, 10, 0, '{\"all\":4,\"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(152, 'view_tickets', 'View Tickets', NULL, 10, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(153, 'edit_tickets', 'Edit Tickets', NULL, 10, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(154, 'delete_tickets', 'Delete Tickets', NULL, 10, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(155, 'manage_ticket_type', 'Manage Ticket Type', NULL, 10, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(156, 'manage_ticket_agent', 'Manage Ticket Agent', NULL, 10, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(157, 'manage_ticket_channel', 'Manage Ticket Channel', NULL, 10, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(158, 'manage_ticket_tags', 'Manage Ticket Tags', NULL, 10, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(159, 'manage_ticket_groups', 'Manage Ticket Groups', NULL, 10, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(160, 'add_events', 'Add Events', NULL, 11, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(161, 'view_events', 'View Events', NULL, 11, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(162, 'edit_events', 'Edit Events', NULL, 11, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(163, 'delete_events', 'Delete Events', NULL, 11, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(164, 'add_notice', 'Add Notice', NULL, 12, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(165, 'view_notice', 'View Notice', NULL, 12, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(166, 'edit_notice', 'Edit Notice', NULL, 12, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(167, 'delete_notice', 'Delete Notice', NULL, 12, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(168, 'add_leave', 'Add Leave', NULL, 13, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(169, 'view_leave', 'View Leave', NULL, 13, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(170, 'edit_leave', 'Edit Leave', NULL, 13, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(171, 'delete_leave', 'Delete Leave', NULL, 13, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(172, 'approve_or_reject_leaves', 'Approve Or Reject Leaves', NULL, 13, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(173, 'delete_approve_leaves', 'Delete Approve Leaves', NULL, 13, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:22:04'),
(174, 'add_lead', 'Add Lead', NULL, 14, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(175, 'view_lead', 'View Lead', NULL, 14, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(176, 'edit_lead', 'Edit Lead', NULL, 14, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(177, 'delete_lead', 'Delete Lead', NULL, 14, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(178, 'view_lead_agents', 'View Lead Agents', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(179, 'add_lead_agent', 'Add Lead Agent', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(180, 'edit_lead_agent', 'Edit Lead Agent', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(181, 'delete_lead_agent', 'Delete Lead Agent', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(182, 'view_lead_category', 'View Lead Category', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(183, 'add_lead_category', 'Add Lead Category', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(184, 'edit_lead_category', 'Edit Lead Category', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(185, 'delete_lead_category', 'Delete Lead Category', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(186, 'manage_lead_custom_forms', 'Manage Lead Custom Forms', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(187, 'view_lead_files', 'View Lead Files', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(188, 'add_lead_files', 'Add Lead Files', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(189, 'delete_lead_files', 'Delete Lead Files', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(190, 'view_lead_follow_up', 'View Lead Follow Up', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(191, 'add_lead_follow_up', 'Add Lead Follow Up', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(192, 'edit_lead_follow_up', 'Edit Lead Follow Up', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(193, 'delete_lead_follow_up', 'Delete Lead Follow Up', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(194, 'view_lead_sources', 'View Lead Sources', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(195, 'add_lead_sources', 'Add Lead Sources', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(196, 'edit_lead_sources', 'Edit Lead Sources', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(197, 'delete_lead_sources', 'Delete Lead Sources', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(198, 'view_lead_proposals', 'View Lead Proposals', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(199, 'add_lead_proposals', 'Add Lead Proposals', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(200, 'edit_lead_proposals', 'Edit Lead Proposals', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(201, 'delete_lead_proposals', 'Delete Lead Proposals', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(202, 'manage_proposal_template', 'Manage Proposal Template', NULL, 14, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(203, 'change_lead_status', 'Change Lead Status', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(204, 'add_lead_note', 'Add Lead Note', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(205, 'view_lead_note', 'View Lead Note', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(206, 'edit_lead_note', 'Edit Lead Note', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(207, 'delete_lead_note', 'Delete Lead Note', NULL, 14, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(208, 'manage_lead_status', 'Manage Lead Status', NULL, 14, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(209, 'add_holiday', 'Add Holiday', NULL, 15, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(210, 'view_holiday', 'View Holiday', NULL, 15, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(211, 'edit_holiday', 'Edit Holiday', NULL, 15, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(212, 'delete_holiday', 'Delete Holiday', NULL, 15, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(213, 'add_product', 'Add Product', NULL, 16, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(214, 'view_product', 'View Product', NULL, 16, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(215, 'edit_product', 'Edit Product', NULL, 16, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(216, 'delete_product', 'Delete Product', NULL, 16, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(217, 'manage_product_category', 'Manage Product Category', NULL, 16, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(218, 'manage_product_sub_category', 'Manage Product Sub Category', NULL, 16, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(219, 'add_expenses', 'Add Expenses', NULL, 17, 0, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(220, 'view_expenses', 'View Expenses', NULL, 17, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(221, 'edit_expenses', 'Edit Expenses', NULL, 17, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(222, 'delete_expenses', 'Delete Expenses', NULL, 17, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(223, 'manage_expense_category', 'Manage Expense Category', NULL, 17, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(224, 'manage_recurring_expense', 'Manage Recurring Expense', NULL, 17, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(225, 'approve_expenses', 'Approve Expenses', NULL, 17, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(226, 'link_expense_bank_account', 'Link Expense Bank Account', NULL, 17, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(227, 'add_contract', 'Add Contract', NULL, 18, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(228, 'view_contract', 'View Contract', NULL, 18, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(229, 'edit_contract', 'Edit Contract', NULL, 18, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(230, 'delete_contract', 'Delete Contract', NULL, 18, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(231, 'manage_contract_type', 'Manage Contract Type', NULL, 18, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(232, 'renew_contract', 'Renew Contract', NULL, 18, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(233, 'add_contract_discussion', 'Add Contract Discussion', NULL, 18, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(234, 'edit_contract_discussion', 'Edit Contract Discussion', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(235, 'view_contract_discussion', 'View Contract Discussion', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(236, 'delete_contract_discussion', 'Delete Contract Discussion', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(237, 'add_contract_files', 'Add Contract Files', NULL, 18, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(238, 'view_contract_files', 'View Contract Files', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(239, 'delete_contract_files', 'Delete Contract Files', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(240, 'manage_contract_template', 'Manage Contract Template', NULL, 18, 1, '{\"all\":4, \"added\":1, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(241, 'view_task_report', 'View Task Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(242, 'view_time_log_report', 'View Time Log Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(243, 'view_finance_report', 'View Finance Report', NULL, 19, 1, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(244, 'view_income_expense_report', 'View Income Vs Expense Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(245, 'view_leave_report', 'View Leave Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(246, 'view_attendance_report', 'View Attendance Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(247, 'view_expense_report', 'View Expense Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(248, 'view_lead_report', 'View Lead Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(249, 'view_sales_report', 'View Sales Report', NULL, 19, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(250, 'manage_company_setting', 'Manage Company Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(251, 'manage_app_setting', 'Manage App Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(252, 'manage_notification_setting', 'Manage Notification Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(253, 'manage_currency_setting', 'Manage Currency Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(254, 'manage_payment_setting', 'Manage Payment Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(255, 'manage_finance_setting', 'Manage Finance Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(256, 'manage_ticket_setting', 'Manage Ticket Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(257, 'manage_project_setting', 'Manage Project Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(258, 'manage_attendance_setting', 'Manage Attendance Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(259, 'manage_leave_setting', 'Manage Leave Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(260, 'manage_custom_field_setting', 'Manage Custom Field Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(261, 'manage_message_setting', 'Manage Message Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(262, 'manage_storage_setting', 'Manage Storage Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(263, 'manage_language_setting', 'Manage Language Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(264, 'manage_lead_setting', 'Manage Lead Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(265, 'manage_time_log_setting', 'Manage Time Log Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(266, 'manage_task_setting', 'Manage Task Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(267, 'manage_social_login_setting', 'Manage Social Login Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(268, 'manage_security_setting', 'Manage Security Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(269, 'manage_gdpr_setting', 'Manage Gdpr Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(270, 'manage_theme_setting', 'Manage Theme Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(271, 'manage_role_permission_setting', 'Manage Role Permission Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(272, 'manage_module_setting', 'Manage Module Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(273, 'manage_google_calendar_setting', 'Manage Google Calendar Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(274, 'manage_custom_link_setting', 'Manage Custom Link Setting', NULL, 20, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(275, 'view_overview_dashboard', 'View Overview Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(276, 'view_project_dashboard', 'View Project Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(277, 'view_client_dashboard', 'View Client Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(278, 'view_hr_dashboard', 'View Hr Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(279, 'view_ticket_dashboard', 'View Ticket Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(280, 'view_finance_dashboard', 'View Finance Dashboard', NULL, 21, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(281, 'add_order', 'Add Order', NULL, 22, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(282, 'view_order', 'View Order', NULL, 22, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(283, 'edit_order', 'Edit Order', NULL, 22, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(284, 'delete_order', 'Delete Order', NULL, 22, 0, '{\"all\":4, \"added\":1, \"owned\":2,\"both\":3, \"none\":5}', '2023-05-25 21:21:50', '2023-05-25 21:21:50'),
(285, 'add_knowledgebase', 'Add Knowledgebase', NULL, 23, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(286, 'view_knowledgebase', 'View Knowledgebase', NULL, 23, 0, '{\"all\":4,\"added\":1,\"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(287, 'edit_knowledgebase', 'Edit Knowledgebase', NULL, 23, 0, '{\"all\":4,\"added\":1,\"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(288, 'delete_knowledgebase', 'Delete Knowledgebase', NULL, 23, 0, '{\"all\":4,\"added\":1,\"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(289, 'add_bankaccount', 'Add Bankaccount', NULL, 24, 0, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(290, 'view_bankaccount', 'View Bankaccount', NULL, 24, 0, '{\"all\":4,\"added\":1, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(291, 'edit_bankaccount', 'Edit Bankaccount', NULL, 24, 0, '{\"all\":4,\"added\":1, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(292, 'delete_bankaccount', 'Delete Bankaccount', NULL, 24, 0, '{\"all\":4,\"added\":1, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(293, 'add_bank_transfer', 'Add Bank Transfer', NULL, 24, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(294, 'add_bank_deposit', 'Add Bank Deposit', NULL, 24, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51'),
(295, 'add_bank_withdraw', 'Add Bank Withdraw', NULL, 24, 1, '{\"all\":4, \"none\":5}', '2023-05-25 21:21:51', '2023-05-25 21:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `permission_type_id`) VALUES
(58, 8, 1),
(58, 9, 1),
(61, 8, 1),
(61, 9, 1),
(62, 8, 1),
(62, 9, 1),
(99, 8, 1),
(101, 8, 1),
(102, 8, 1),
(109, 8, 1),
(112, 8, 1),
(113, 8, 1),
(116, 8, 1),
(116, 9, 1),
(117, 8, 1),
(117, 9, 1),
(120, 8, 1),
(120, 9, 1),
(121, 8, 1),
(121, 9, 1),
(144, 8, 1),
(146, 8, 1),
(151, 8, 1),
(151, 9, 1),
(153, 9, 1),
(154, 8, 1),
(154, 9, 1),
(168, 8, 1),
(174, 8, 1),
(176, 8, 1),
(187, 8, 1),
(192, 8, 1),
(193, 8, 1),
(219, 8, 1),
(221, 8, 1),
(222, 8, 1),
(44, 8, 2),
(47, 8, 2),
(48, 8, 2),
(49, 8, 2),
(50, 8, 2),
(52, 8, 2),
(52, 9, 2),
(96, 8, 2),
(100, 9, 2),
(129, 9, 2),
(133, 9, 2),
(140, 9, 2),
(145, 9, 2),
(161, 8, 2),
(161, 9, 2),
(165, 8, 2),
(165, 9, 2),
(228, 9, 2),
(282, 9, 2),
(100, 8, 3),
(145, 8, 3),
(152, 8, 3),
(152, 9, 3),
(153, 8, 3),
(169, 8, 3),
(175, 8, 3),
(203, 8, 3),
(220, 8, 3),
(1, 7, 4),
(2, 7, 4),
(3, 7, 4),
(4, 7, 4),
(5, 7, 4),
(6, 7, 4),
(7, 7, 4),
(8, 7, 4),
(9, 7, 4),
(10, 7, 4),
(11, 7, 4),
(12, 7, 4),
(13, 7, 4),
(14, 7, 4),
(15, 7, 4),
(16, 7, 4),
(17, 7, 4),
(18, 7, 4),
(19, 7, 4),
(20, 7, 4),
(21, 7, 4),
(22, 7, 4),
(23, 7, 4),
(24, 7, 4),
(25, 7, 4),
(26, 7, 4),
(27, 7, 4),
(28, 7, 4),
(29, 7, 4),
(30, 7, 4),
(31, 7, 4),
(32, 7, 4),
(33, 7, 4),
(34, 7, 4),
(35, 7, 4),
(35, 8, 4),
(36, 7, 4),
(37, 7, 4),
(38, 7, 4),
(39, 7, 4),
(40, 7, 4),
(41, 7, 4),
(42, 7, 4),
(43, 7, 4),
(44, 7, 4),
(45, 7, 4),
(46, 7, 4),
(47, 7, 4),
(48, 7, 4),
(49, 7, 4),
(50, 7, 4),
(51, 7, 4),
(52, 7, 4),
(53, 7, 4),
(54, 7, 4),
(55, 7, 4),
(56, 7, 4),
(56, 8, 4),
(56, 9, 4),
(57, 7, 4),
(57, 8, 4),
(57, 9, 4),
(58, 7, 4),
(59, 7, 4),
(59, 8, 4),
(59, 9, 4),
(60, 7, 4),
(60, 8, 4),
(60, 9, 4),
(61, 7, 4),
(62, 7, 4),
(63, 7, 4),
(64, 7, 4),
(65, 7, 4),
(66, 7, 4),
(67, 7, 4),
(68, 7, 4),
(68, 8, 4),
(68, 9, 4),
(69, 7, 4),
(70, 7, 4),
(71, 7, 4),
(72, 7, 4),
(73, 7, 4),
(74, 7, 4),
(75, 7, 4),
(76, 7, 4),
(77, 7, 4),
(77, 8, 4),
(77, 9, 4),
(78, 7, 4),
(79, 7, 4),
(79, 8, 4),
(79, 9, 4),
(80, 7, 4),
(80, 9, 4),
(81, 7, 4),
(82, 7, 4),
(82, 9, 4),
(83, 7, 4),
(84, 7, 4),
(85, 7, 4),
(85, 8, 4),
(85, 9, 4),
(86, 7, 4),
(87, 7, 4),
(88, 7, 4),
(89, 7, 4),
(90, 7, 4),
(91, 7, 4),
(92, 7, 4),
(93, 7, 4),
(94, 7, 4),
(95, 7, 4),
(96, 7, 4),
(97, 7, 4),
(98, 7, 4),
(99, 7, 4),
(100, 7, 4),
(101, 7, 4),
(102, 7, 4),
(103, 7, 4),
(104, 7, 4),
(105, 7, 4),
(106, 7, 4),
(107, 7, 4),
(107, 8, 4),
(107, 9, 4),
(108, 7, 4),
(108, 8, 4),
(109, 7, 4),
(110, 7, 4),
(110, 8, 4),
(110, 9, 4),
(111, 7, 4),
(111, 8, 4),
(112, 7, 4),
(113, 7, 4),
(114, 7, 4),
(114, 8, 4),
(114, 9, 4),
(115, 7, 4),
(115, 8, 4),
(115, 9, 4),
(116, 7, 4),
(117, 7, 4),
(118, 7, 4),
(118, 8, 4),
(118, 9, 4),
(119, 7, 4),
(119, 8, 4),
(119, 9, 4),
(120, 7, 4),
(121, 7, 4),
(122, 7, 4),
(123, 7, 4),
(124, 7, 4),
(125, 7, 4),
(126, 7, 4),
(127, 7, 4),
(128, 7, 4),
(129, 7, 4),
(130, 7, 4),
(131, 7, 4),
(132, 7, 4),
(133, 7, 4),
(134, 7, 4),
(135, 7, 4),
(136, 7, 4),
(137, 7, 4),
(138, 7, 4),
(139, 7, 4),
(140, 7, 4),
(141, 7, 4),
(142, 7, 4),
(143, 7, 4),
(144, 7, 4),
(145, 7, 4),
(146, 7, 4),
(147, 7, 4),
(148, 7, 4),
(149, 7, 4),
(150, 7, 4),
(151, 7, 4),
(152, 7, 4),
(153, 7, 4),
(154, 7, 4),
(155, 7, 4),
(156, 7, 4),
(157, 7, 4),
(158, 7, 4),
(159, 7, 4),
(160, 7, 4),
(161, 7, 4),
(162, 7, 4),
(163, 7, 4),
(164, 7, 4),
(165, 7, 4),
(166, 7, 4),
(167, 7, 4),
(168, 7, 4),
(169, 7, 4),
(170, 7, 4),
(171, 7, 4),
(172, 7, 4),
(173, 7, 4),
(174, 7, 4),
(175, 7, 4),
(176, 7, 4),
(177, 7, 4),
(178, 7, 4),
(179, 7, 4),
(180, 7, 4),
(181, 7, 4),
(182, 7, 4),
(183, 7, 4),
(184, 7, 4),
(185, 7, 4),
(186, 7, 4),
(187, 7, 4),
(188, 7, 4),
(188, 8, 4),
(189, 7, 4),
(190, 7, 4),
(190, 8, 4),
(191, 7, 4),
(191, 8, 4),
(192, 7, 4),
(193, 7, 4),
(194, 7, 4),
(195, 7, 4),
(196, 7, 4),
(197, 7, 4),
(198, 7, 4),
(199, 7, 4),
(200, 7, 4),
(201, 7, 4),
(202, 7, 4),
(203, 7, 4),
(204, 7, 4),
(205, 7, 4),
(206, 7, 4),
(207, 7, 4),
(208, 7, 4),
(209, 7, 4),
(210, 7, 4),
(210, 8, 4),
(211, 7, 4),
(212, 7, 4),
(213, 7, 4),
(214, 7, 4),
(214, 9, 4),
(215, 7, 4),
(216, 7, 4),
(217, 7, 4),
(218, 7, 4),
(219, 7, 4),
(220, 7, 4),
(221, 7, 4),
(222, 7, 4),
(223, 7, 4),
(224, 7, 4),
(225, 7, 4),
(226, 7, 4),
(227, 7, 4),
(228, 7, 4),
(229, 7, 4),
(230, 7, 4),
(231, 7, 4),
(232, 7, 4),
(233, 7, 4),
(233, 9, 4),
(234, 7, 4),
(235, 7, 4),
(235, 9, 4),
(236, 7, 4),
(237, 7, 4),
(238, 7, 4),
(238, 9, 4),
(239, 7, 4),
(240, 7, 4),
(241, 7, 4),
(242, 7, 4),
(243, 7, 4),
(244, 7, 4),
(245, 7, 4),
(246, 7, 4),
(247, 7, 4),
(248, 7, 4),
(249, 7, 4),
(250, 7, 4),
(251, 7, 4),
(252, 7, 4),
(253, 7, 4),
(254, 7, 4),
(255, 7, 4),
(256, 7, 4),
(257, 7, 4),
(258, 7, 4),
(259, 7, 4),
(260, 7, 4),
(261, 7, 4),
(262, 7, 4),
(263, 7, 4),
(264, 7, 4),
(265, 7, 4),
(266, 7, 4),
(267, 7, 4),
(268, 7, 4),
(269, 7, 4),
(270, 7, 4),
(271, 7, 4),
(272, 7, 4),
(273, 7, 4),
(274, 7, 4),
(275, 7, 4),
(276, 7, 4),
(277, 7, 4),
(278, 7, 4),
(279, 7, 4),
(280, 7, 4),
(281, 7, 4),
(281, 9, 4),
(282, 7, 4),
(283, 7, 4),
(284, 7, 4),
(285, 7, 4),
(286, 7, 4),
(287, 7, 4),
(288, 7, 4),
(289, 7, 4),
(290, 7, 4),
(291, 7, 4),
(292, 7, 4),
(293, 7, 4),
(294, 7, 4),
(295, 7, 4),
(1, 8, 5),
(1, 9, 5),
(2, 8, 5),
(2, 9, 5),
(3, 8, 5),
(3, 9, 5),
(4, 8, 5),
(4, 9, 5),
(5, 8, 5),
(5, 9, 5),
(6, 8, 5),
(6, 9, 5),
(7, 8, 5),
(7, 9, 5),
(8, 8, 5),
(8, 9, 5),
(9, 8, 5),
(9, 9, 5),
(10, 8, 5),
(10, 9, 5),
(11, 8, 5),
(11, 9, 5),
(12, 8, 5),
(12, 9, 5),
(13, 8, 5),
(13, 9, 5),
(14, 8, 5),
(14, 9, 5),
(15, 8, 5),
(15, 9, 5),
(16, 8, 5),
(16, 9, 5),
(17, 8, 5),
(17, 9, 5),
(18, 8, 5),
(18, 9, 5),
(19, 8, 5),
(19, 9, 5),
(20, 8, 5),
(20, 9, 5),
(21, 8, 5),
(21, 9, 5),
(22, 8, 5),
(22, 9, 5),
(23, 8, 5),
(23, 9, 5),
(24, 8, 5),
(24, 9, 5),
(25, 8, 5),
(25, 9, 5),
(26, 8, 5),
(26, 9, 5),
(27, 8, 5),
(27, 9, 5),
(28, 8, 5),
(28, 9, 5),
(29, 8, 5),
(29, 9, 5),
(30, 8, 5),
(30, 9, 5),
(31, 8, 5),
(31, 9, 5),
(32, 8, 5),
(32, 9, 5),
(33, 8, 5),
(33, 9, 5),
(34, 8, 5),
(34, 9, 5),
(35, 9, 5),
(36, 8, 5),
(36, 9, 5),
(37, 8, 5),
(37, 9, 5),
(38, 8, 5),
(38, 9, 5),
(39, 8, 5),
(39, 9, 5),
(40, 8, 5),
(40, 9, 5),
(41, 8, 5),
(41, 9, 5),
(42, 8, 5),
(42, 9, 5),
(43, 8, 5),
(43, 9, 5),
(44, 9, 5),
(45, 8, 5),
(45, 9, 5),
(46, 8, 5),
(46, 9, 5),
(47, 9, 5),
(48, 9, 5),
(49, 9, 5),
(50, 9, 5),
(51, 8, 5),
(51, 9, 5),
(53, 8, 5),
(53, 9, 5),
(54, 8, 5),
(54, 9, 5),
(55, 8, 5),
(55, 9, 5),
(63, 8, 5),
(63, 9, 5),
(64, 8, 5),
(64, 9, 5),
(65, 8, 5),
(65, 9, 5),
(66, 8, 5),
(66, 9, 5),
(67, 8, 5),
(67, 9, 5),
(69, 8, 5),
(69, 9, 5),
(70, 8, 5),
(70, 9, 5),
(71, 8, 5),
(71, 9, 5),
(72, 8, 5),
(72, 9, 5),
(73, 8, 5),
(73, 9, 5),
(74, 8, 5),
(74, 9, 5),
(75, 8, 5),
(75, 9, 5),
(76, 8, 5),
(76, 9, 5),
(78, 8, 5),
(78, 9, 5),
(80, 8, 5),
(81, 8, 5),
(81, 9, 5),
(82, 8, 5),
(83, 8, 5),
(83, 9, 5),
(84, 8, 5),
(84, 9, 5),
(86, 8, 5),
(86, 9, 5),
(87, 8, 5),
(87, 9, 5),
(88, 8, 5),
(88, 9, 5),
(89, 8, 5),
(89, 9, 5),
(90, 8, 5),
(90, 9, 5),
(91, 8, 5),
(91, 9, 5),
(92, 8, 5),
(92, 9, 5),
(93, 8, 5),
(93, 9, 5),
(94, 8, 5),
(94, 9, 5),
(95, 8, 5),
(95, 9, 5),
(96, 9, 5),
(97, 8, 5),
(97, 9, 5),
(98, 8, 5),
(98, 9, 5),
(99, 9, 5),
(101, 9, 5),
(102, 9, 5),
(103, 8, 5),
(103, 9, 5),
(104, 8, 5),
(104, 9, 5),
(105, 8, 5),
(105, 9, 5),
(106, 8, 5),
(106, 9, 5),
(108, 9, 5),
(109, 9, 5),
(111, 9, 5),
(112, 9, 5),
(113, 9, 5),
(122, 8, 5),
(122, 9, 5),
(123, 8, 5),
(123, 9, 5),
(124, 8, 5),
(124, 9, 5),
(125, 8, 5),
(125, 9, 5),
(126, 8, 5),
(126, 9, 5),
(127, 8, 5),
(127, 9, 5),
(128, 8, 5),
(128, 9, 5),
(129, 8, 5),
(130, 8, 5),
(130, 9, 5),
(131, 8, 5),
(131, 9, 5),
(132, 8, 5),
(132, 9, 5),
(133, 8, 5),
(134, 8, 5),
(134, 9, 5),
(135, 8, 5),
(135, 9, 5),
(136, 8, 5),
(136, 9, 5),
(137, 8, 5),
(137, 9, 5),
(138, 8, 5),
(138, 9, 5),
(139, 8, 5),
(139, 9, 5),
(140, 8, 5),
(141, 8, 5),
(141, 9, 5),
(142, 8, 5),
(142, 9, 5),
(143, 8, 5),
(143, 9, 5),
(144, 9, 5),
(146, 9, 5),
(147, 8, 5),
(147, 9, 5),
(148, 8, 5),
(148, 9, 5),
(149, 8, 5),
(149, 9, 5),
(150, 8, 5),
(150, 9, 5),
(155, 8, 5),
(155, 9, 5),
(156, 8, 5),
(156, 9, 5),
(157, 8, 5),
(157, 9, 5),
(158, 8, 5),
(158, 9, 5),
(159, 8, 5),
(159, 9, 5),
(160, 8, 5),
(160, 9, 5),
(162, 8, 5),
(162, 9, 5),
(163, 8, 5),
(163, 9, 5),
(164, 8, 5),
(164, 9, 5),
(166, 8, 5),
(166, 9, 5),
(167, 8, 5),
(167, 9, 5),
(168, 9, 5),
(169, 9, 5),
(170, 8, 5),
(170, 9, 5),
(171, 8, 5),
(171, 9, 5),
(172, 8, 5),
(172, 9, 5),
(173, 8, 5),
(173, 9, 5),
(174, 9, 5),
(175, 9, 5),
(176, 9, 5),
(177, 8, 5),
(177, 9, 5),
(178, 8, 5),
(178, 9, 5),
(179, 8, 5),
(179, 9, 5),
(180, 8, 5),
(180, 9, 5),
(181, 8, 5),
(181, 9, 5),
(182, 8, 5),
(182, 9, 5),
(183, 8, 5),
(183, 9, 5),
(184, 8, 5),
(184, 9, 5),
(185, 8, 5),
(185, 9, 5),
(186, 8, 5),
(186, 9, 5),
(187, 9, 5),
(188, 9, 5),
(189, 8, 5),
(189, 9, 5),
(190, 9, 5),
(191, 9, 5),
(192, 9, 5),
(193, 9, 5),
(194, 8, 5),
(194, 9, 5),
(195, 8, 5),
(195, 9, 5),
(196, 8, 5),
(196, 9, 5),
(197, 8, 5),
(197, 9, 5),
(198, 8, 5),
(198, 9, 5),
(199, 8, 5),
(199, 9, 5),
(200, 8, 5),
(200, 9, 5),
(201, 8, 5),
(201, 9, 5),
(202, 8, 5),
(202, 9, 5),
(203, 9, 5),
(204, 8, 5),
(204, 9, 5),
(205, 8, 5),
(205, 9, 5),
(206, 8, 5),
(206, 9, 5),
(207, 8, 5),
(207, 9, 5),
(208, 8, 5),
(208, 9, 5),
(209, 8, 5),
(209, 9, 5),
(210, 9, 5),
(211, 8, 5),
(211, 9, 5),
(212, 8, 5),
(212, 9, 5),
(213, 8, 5),
(213, 9, 5),
(214, 8, 5),
(215, 8, 5),
(215, 9, 5),
(216, 8, 5),
(216, 9, 5),
(217, 8, 5),
(217, 9, 5),
(218, 8, 5),
(218, 9, 5),
(219, 9, 5),
(220, 9, 5),
(221, 9, 5),
(222, 9, 5),
(223, 8, 5),
(223, 9, 5),
(224, 8, 5),
(224, 9, 5),
(225, 8, 5),
(225, 9, 5),
(226, 8, 5),
(226, 9, 5),
(227, 8, 5),
(227, 9, 5),
(228, 8, 5),
(229, 8, 5),
(229, 9, 5),
(230, 8, 5),
(230, 9, 5),
(231, 8, 5),
(231, 9, 5),
(232, 8, 5),
(232, 9, 5),
(233, 8, 5),
(234, 8, 5),
(234, 9, 5),
(235, 8, 5),
(236, 8, 5),
(236, 9, 5),
(237, 8, 5),
(237, 9, 5),
(238, 8, 5),
(239, 8, 5),
(239, 9, 5),
(240, 8, 5),
(240, 9, 5),
(241, 8, 5),
(241, 9, 5),
(242, 8, 5),
(242, 9, 5),
(243, 8, 5),
(243, 9, 5),
(244, 8, 5),
(244, 9, 5),
(245, 8, 5),
(245, 9, 5),
(246, 8, 5),
(246, 9, 5),
(247, 8, 5),
(247, 9, 5),
(248, 8, 5),
(248, 9, 5),
(249, 8, 5),
(249, 9, 5),
(250, 8, 5),
(250, 9, 5),
(251, 8, 5),
(251, 9, 5),
(252, 8, 5),
(252, 9, 5),
(253, 8, 5),
(253, 9, 5),
(254, 8, 5),
(254, 9, 5),
(255, 8, 5),
(255, 9, 5),
(256, 8, 5),
(256, 9, 5),
(257, 8, 5),
(257, 9, 5),
(258, 8, 5),
(258, 9, 5),
(259, 8, 5),
(259, 9, 5),
(260, 8, 5),
(260, 9, 5),
(261, 8, 5),
(261, 9, 5),
(262, 8, 5),
(262, 9, 5),
(263, 8, 5),
(263, 9, 5),
(264, 8, 5),
(264, 9, 5),
(265, 8, 5),
(265, 9, 5),
(266, 8, 5),
(266, 9, 5),
(267, 8, 5),
(267, 9, 5),
(268, 8, 5),
(268, 9, 5),
(269, 8, 5),
(269, 9, 5),
(270, 8, 5),
(270, 9, 5),
(271, 8, 5),
(271, 9, 5),
(272, 8, 5),
(272, 9, 5),
(273, 8, 5),
(273, 9, 5),
(274, 8, 5),
(274, 9, 5),
(275, 8, 5),
(275, 9, 5),
(276, 8, 5),
(276, 9, 5),
(277, 8, 5),
(277, 9, 5),
(278, 8, 5),
(278, 9, 5),
(279, 8, 5),
(279, 9, 5),
(280, 8, 5),
(280, 9, 5),
(281, 8, 5),
(282, 8, 5),
(283, 8, 5),
(283, 9, 5),
(284, 8, 5),
(284, 9, 5),
(285, 8, 5),
(285, 9, 5),
(286, 8, 5),
(286, 9, 5),
(287, 8, 5),
(287, 9, 5),
(288, 8, 5),
(288, 9, 5),
(289, 8, 5),
(289, 9, 5),
(290, 8, 5),
(290, 9, 5),
(291, 8, 5),
(291, 9, 5),
(292, 8, 5),
(292, 9, 5),
(293, 8, 5),
(293, 9, 5),
(294, 8, 5),
(294, 9, 5),
(295, 8, 5),
(295, 9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `permission_types`
--

CREATE TABLE `permission_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_types`
--

INSERT INTO `permission_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'added', NULL, NULL),
(2, 'owned', NULL, NULL),
(3, 'both', NULL, NULL),
(4, 'all', NULL, NULL),
(5, 'none', NULL, NULL),
(6, 'added', NULL, NULL),
(7, 'owned', NULL, NULL),
(8, 'both', NULL, NULL),
(9, 'all', NULL, NULL),
(10, 'none', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pinned`
--

CREATE TABLE `pinned` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `downloadable_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_files`
--

CREATE TABLE `product_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_summary` longtext COLLATE utf8mb4_unicode_ci,
  `project_admin` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8mb4_unicode_ci,
  `manual_timelog` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `client_view_task` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `completion_percent` tinyint(4) NOT NULL,
  `calculate_task_progress` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `project_budget` double(20,2) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `hours_allocated` double(8,2) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in progress',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `public` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `enable_miroboard` tinyint(1) NOT NULL DEFAULT '0',
  `miro_board_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_access` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_activity`
--

CREATE TABLE `project_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE `project_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `hourly_rate` double NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
--

CREATE TABLE `project_milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `milestone_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(16,2) NOT NULL,
  `status` enum('complete','incomplete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `invoice_created` tinyint(1) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_notes`
--

CREATE TABLE `project_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `is_client_show` tinyint(1) NOT NULL DEFAULT '0',
  `ask_password` tinyint(1) NOT NULL DEFAULT '0',
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_ratings`
--

CREATE TABLE `project_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_settings`
--

CREATE TABLE `project_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `send_reminder` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind_time` int(11) NOT NULL,
  `remind_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '["admins","members"]',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_settings`
--

INSERT INTO `project_settings` (`id`, `company_id`, `send_reminder`, `remind_time`, `remind_type`, `remind_to`, `created_at`, `updated_at`) VALUES
(3, 3, 'no', 5, 'days', '[\"admins\",\"members\"]', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `project_status_settings`
--

CREATE TABLE `project_status_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `status_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_status_settings`
--

INSERT INTO `project_status_settings` (`id`, `company_id`, `status_name`, `color`, `status`, `default_status`, `created_at`, `updated_at`) VALUES
(11, 3, 'in progress', '#00b5ff', 'active', '1', NULL, NULL),
(12, 3, 'not started', '#616e80', 'active', '0', NULL, NULL),
(13, 3, 'on hold', '#f5c308', 'active', '0', NULL, NULL),
(14, 3, 'canceled', '#d21010', 'active', '0', NULL, NULL),
(15, 3, 'finished', '#679c0d', 'active', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_templates`
--

CREATE TABLE `project_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `project_summary` mediumtext COLLATE utf8mb4_unicode_ci,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `feedback` mediumtext COLLATE utf8mb4_unicode_ci,
  `client_view_task` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `manual_timelog` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_members`
--

CREATE TABLE `project_template_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_sub_tasks`
--

CREATE TABLE `project_template_sub_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_template_task_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('incomplete','complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_tasks`
--

CREATE TABLE `project_template_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `priority` enum('low','medium','high') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `project_template_task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_task_users`
--

CREATE TABLE `project_template_task_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_template_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time_logs`
--

CREATE TABLE `project_time_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_minutes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by_user` int(10) UNSIGNED DEFAULT NULL,
  `hourly_rate` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `total_break_minutes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time_log_breaks`
--

CREATE TABLE `project_time_log_breaks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_time_log_id` int(10) UNSIGNED DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_minutes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_user_notes`
--

CREATE TABLE `project_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_note_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `invoice_convert` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('declined','accepted','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `client_comment` text COLLATE utf8mb4_unicode_ci,
  `signature_approval` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `calculate_tax` enum('after_discount','before_discount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'after_discount',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_viewed` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_items`
--

CREATE TABLE `proposal_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_item_images`
--

CREATE TABLE `proposal_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `proposal_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_signs`
--

CREATE TABLE `proposal_signs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_templates`
--

CREATE TABLE `proposal_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` double NOT NULL,
  `total` double NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `invoice_convert` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `client_comment` text COLLATE utf8mb4_unicode_ci,
  `signature_approval` tinyint(1) NOT NULL DEFAULT '1',
  `hash` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_template_items`
--

CREATE TABLE `proposal_template_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `proposal_template_id` bigint(20) UNSIGNED NOT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` tinyint(4) NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `item_summary` text COLLATE utf8mb4_unicode_ci,
  `taxes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_template_item_images`
--

CREATE TABLE `proposal_template_item_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `proposal_template_item_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent`
--

CREATE TABLE `purpose_consent` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_leads`
--

CREATE TABLE `purpose_consent_leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agree',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `additional_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_users`
--

CREATE TABLE `purpose_consent_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agree',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED NOT NULL,
  `additional_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusher_settings`
--

CREATE TABLE `pusher_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pusher_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pusher_app_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pusher_app_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pusher_cluster` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `force_tls` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `taskboard` tinyint(1) NOT NULL DEFAULT '1',
  `messages` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pusher_settings`
--

INSERT INTO `pusher_settings` (`id`, `pusher_app_id`, `pusher_app_key`, `pusher_app_secret`, `pusher_cluster`, `force_tls`, `status`, `taskboard`, `messages`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 0, 0, 1, 0, '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_settings`
--

CREATE TABLE `push_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `onesignal_app_id` text COLLATE utf8mb4_unicode_ci,
  `onesignal_rest_api_key` text COLLATE utf8mb4_unicode_ci,
  `notification_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notification_settings`
--

INSERT INTO `push_notification_settings` (`id`, `onesignal_app_id`, `onesignal_rest_api_key`, `notification_logo`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'inactive', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `endpoint` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quick_books_settings`
--

CREATE TABLE `quick_books_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `sandbox_client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sandbox_client_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realmid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync_type` enum('one_way','two_way') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_way',
  `environment` enum('Development','Production') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Production',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quick_books_settings`
--

INSERT INTO `quick_books_settings` (`id`, `company_id`, `sandbox_client_id`, `sandbox_client_secret`, `client_id`, `client_secret`, `access_token`, `refresh_token`, `realmid`, `sync_type`, `environment`, `status`, `created_at`, `updated_at`) VALUES
(3, 3, '', '', '', '', '', '', '', 'one_way', 'Production', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `hsn_sac_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_invoices`
--

CREATE TABLE `razorpay_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_subscriptions`
--

CREATE TABLE `razorpay_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests`
--

CREATE TABLE `removal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests_lead`
--

CREATE TABLE `removal_requests_lead` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(7, 3, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2023-05-25 21:34:58', '2023-05-25 21:34:58'),
(8, 3, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2023-05-25 21:34:58', '2023-05-25 21:34:58'),
(9, 3, 'client', 'Client', 'Client can see own tasks and projects.', '2023-05-25 21:34:58', '2023-05-25 21:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(4, 7),
(4, 8),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `seo_details`
--

CREATE TABLE `seo_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_details`
--

INSERT INTO `seo_details` (`id`, `page_name`, `seo_title`, `seo_keywords`, `seo_description`, `seo_author`, `language_setting_id`, `og_image`, `created_at`, `updated_at`) VALUES
(1, 'home', 'Home', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL),
(2, 'feature', 'Features', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL),
(3, 'pricing', 'Pricing', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL),
(4, 'contact', 'Contact', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL),
(5, 'terms-of-use', 'Terms of use', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL),
(6, 'privacy-policy', 'Privacy Policy', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sign_up_settings`
--

CREATE TABLE `sign_up_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slack_settings`
--

CREATE TABLE `slack_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `slack_webhook` text COLLATE utf8mb4_unicode_ci,
  `slack_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slack_settings`
--

INSERT INTO `slack_settings` (`id`, `company_id`, `slack_webhook`, `slack_logo`, `status`, `created_at`, `updated_at`) VALUES
(3, 3, NULL, NULL, 'inactive', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail_driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp',
  `mail_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp.gmail.com',
  `mail_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '587',
  `mail_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'youremail@gmail.com',
  `mail_password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'your password',
  `mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'your name',
  `mail_from_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'from@email.com',
  `mail_encryption` enum('ssl','tls','starttls') COLLATE utf8mb4_unicode_ci DEFAULT 'tls',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `mail_connection` enum('sync','database') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sync',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `verified`, `mail_connection`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'mail.techsuiteone.com', '465', 'admin@techsuiteone.com', ']e&)D&3]=o8J', 'Tech Suite One', 'admin@techsuiteone.com', 'ssl', 1, 'sync', '2023-05-25 21:22:04', '2023-05-25 21:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_settings`
--

CREATE TABLE `social_auth_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facebook_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `google_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `twitter_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `linkedin_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_auth_settings`
--

INSERT INTO `social_auth_settings` (`id`, `facebook_client_id`, `facebook_secret_id`, `facebook_status`, `google_client_id`, `google_secret_id`, `google_status`, `twitter_client_id`, `twitter_secret_id`, `twitter_status`, `linkedin_client_id`, `linkedin_secret_id`, `linkedin_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_notes`
--

CREATE TABLE `sticky_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `colour` enum('blue','yellow','red','gray','purple','green') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_setting`
--

CREATE TABLE `stripe_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webhook_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `stripe_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `razorpay_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `paypal_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL,
  `paystack_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'inactive',
  `paystack_merchant_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_payment_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'https://api.paystack.co',
  `mollie_api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mollie_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `authorize_api_login_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_transaction_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_signature_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_environment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorize_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `payfast_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `payfast_salt_passphrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stripe_setting`
--

INSERT INTO `stripe_setting` (`id`, `api_key`, `api_secret`, `webhook_key`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_status`, `razorpay_key`, `razorpay_secret`, `razorpay_webhook_secret`, `razorpay_status`, `paypal_mode`, `paystack_client_id`, `paystack_secret`, `paystack_status`, `paystack_merchant_email`, `paystack_payment_url`, `mollie_api_key`, `mollie_status`, `authorize_api_login_id`, `authorize_transaction_key`, `authorize_signature_key`, `authorize_environment`, `authorize_status`, `payfast_key`, `payfast_secret`, `payfast_status`, `payfast_salt_passphrase`, `payfast_mode`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'inactive', 'inactive', NULL, NULL, NULL, 'deactive', 'sandbox', NULL, NULL, 'inactive', NULL, 'https://api.paystack.co', '', 'inactive', NULL, NULL, NULL, NULL, 'inactive', NULL, NULL, 'inactive', NULL, 'sandbox', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tasks`
--

CREATE TABLE `sub_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` enum('incomplete','complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `assigned_to` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_task_files`
--

CREATE TABLE `sub_task_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_task_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','pending','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `support_ticket_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_files`
--

CREATE TABLE `support_ticket_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `support_ticket_reply_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_replies`
--

CREATE TABLE `support_ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_types`
--

CREATE TABLE `support_ticket_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_types`
--

INSERT INTO `support_ticket_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Question', NULL, NULL),
(2, 'Problem', NULL, NULL),
(3, 'General Query', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taskboard_columns`
--

CREATE TABLE `taskboard_columns` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taskboard_columns`
--

INSERT INTO `taskboard_columns` (`id`, `company_id`, `column_name`, `slug`, `label_color`, `priority`, `created_at`, `updated_at`) VALUES
(9, 3, 'Incomplete', 'incomplete', '#d21010', 1, NULL, NULL),
(10, 3, 'To Do', 'to_do', '#f5c308', 2, NULL, NULL),
(11, 3, 'Doing', 'doing', '#00b5ff', 3, NULL, NULL),
(12, 3, 'Completed', 'completed', '#679c0d', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('incomplete','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incomplete',
  `board_column_id` int(10) UNSIGNED DEFAULT '1',
  `column_priority` int(11) NOT NULL,
  `completed_on` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `recurring_task_id` int(10) UNSIGNED DEFAULT NULL,
  `dependent_task_id` int(10) UNSIGNED DEFAULT NULL,
  `milestone_id` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_hours` int(11) NOT NULL,
  `estimate_minutes` int(11) NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_complete` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_count` int(11) DEFAULT NULL,
  `repeat_type` enum('day','week','month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `repeat_cycles` int(11) DEFAULT NULL,
  `event_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `task_short_code`, `company_id`, `heading`, `description`, `due_date`, `start_date`, `project_id`, `task_category_id`, `priority`, `status`, `board_column_id`, `column_priority`, `completed_on`, `created_by`, `recurring_task_id`, `dependent_task_id`, `milestone_id`, `is_private`, `billable`, `estimate_hours`, `estimate_minutes`, `added_by`, `last_updated_by`, `hash`, `repeat`, `repeat_complete`, `repeat_count`, `repeat_type`, `repeat_cycles`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 3, 'Test', '', '2023-05-26', '2023-05-26', NULL, 1, 'medium', 'incomplete', 9, 0, NULL, 4, NULL, NULL, NULL, 0, 0, 0, 0, 4, 4, 'c45e87e538a830edf9f7808ce60b4027', 0, 0, NULL, 'day', NULL, NULL, '2023-05-26 02:33:02', '2023-05-26 02:33:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_category`
--

CREATE TABLE `task_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_category`
--

INSERT INTO `task_category` (`id`, `company_id`, `category_name`, `added_by`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kickoff', 4, 4, '2023-05-26 02:32:40', '2023-05-26 02:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comment_emoji`
--

CREATE TABLE `task_comment_emoji` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `comment_id` int(10) UNSIGNED DEFAULT NULL,
  `emoji_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE `task_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `sub_task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `board_column_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_history`
--

INSERT INTO `task_history` (`id`, `task_id`, `sub_task_id`, `user_id`, `details`, `board_column_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 4, 'createActivity', 9, '2023-05-26 02:33:02', '2023-05-26 02:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `task_labels`
--

CREATE TABLE `task_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `label_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_label_list`
--

CREATE TABLE `task_label_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `label_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_notes`
--

CREATE TABLE `task_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_settings`
--

CREATE TABLE `task_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `task_category` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `project` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `start_date` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `due_date` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `assigned_to` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `assigned_by` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `description` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `label` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `status` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `priority` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `make_private` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `time_estimate` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `hours_logged` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `custom_fields` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `copy_task_link` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `files` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `sub_task` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `comments` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `time_logs` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `notes` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `history` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_settings`
--

INSERT INTO `task_settings` (`id`, `company_id`, `task_category`, `project`, `start_date`, `due_date`, `assigned_to`, `assigned_by`, `description`, `label`, `status`, `priority`, `make_private`, `time_estimate`, `hours_logged`, `custom_fields`, `copy_task_link`, `files`, `sub_task`, `comments`, `time_logs`, `notes`, `history`, `created_at`, `updated_at`) VALUES
(3, 3, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `task_users`
--

CREATE TABLE `task_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_users`
--

INSERT INTO `task_users` (`id`, `task_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `company_id`, `team_name`, `parent_id`, `added_by`, `last_updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Tech', NULL, NULL, NULL, '2023-05-25 21:37:23', '2023-05-25 21:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `rating` double(8,2) DEFAULT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `comment`, `rating`, `language_setting_id`, `created_at`, `updated_at`) VALUES
(1, 'theon salvatore', 'The application is user-friendly and has made my work easier.', 5.00, 1, NULL, NULL),
(2, 'jenna gilbert', 'The application is efficient and has improved my productivity.', 4.00, 1, NULL, NULL),
(3, 'Redh gilbert', 'The application has a good design and is easy to navigate.', 3.00, 1, NULL, NULL),
(4, 'whatson angela', 'The application has made my life much easier by automating my tasks.', 2.00, 1, NULL, NULL),
(5, 'Megan Lee', 'I was skeptical at first, but after using the application for a few weeks, I\'m sold! It\'s incredibly intuitive and user-friendly.', 5.00, 1, NULL, NULL),
(6, 'Jacob Thompson', 'I\'ve tried a lot of productivity tools, but this one stands out. It has all the features I need and none of the clutter.', 4.00, 1, NULL, NULL),
(7, 'Maria Rodriguez', 'As a small business owner, this application has been a game-changer. It saves me so much time and keeps me organized.', 5.00, 1, NULL, NULL),
(8, 'Samantha Patel', 'I appreciate the attention to detail in the design of this application. It\'s clear that the developers put a lot of thought into the user experience.', 4.00, 1, NULL, NULL),
(9, 'Ethan Kim', 'Overall, I\'m happy with the application. It\'s not perfect, but it gets the job done.', 3.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `panel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_text_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#ffffff',
  `user_css` longtext COLLATE utf8mb4_unicode_ci,
  `sidebar_theme` enum('dark','light') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dark',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enable_rounded_theme` tinyint(1) NOT NULL DEFAULT '0',
  `login_background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restrict_admin_theme_change` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `company_id`, `panel`, `header_color`, `sidebar_color`, `sidebar_text_color`, `link_color`, `user_css`, `sidebar_theme`, `created_at`, `updated_at`, `enable_rounded_theme`, `login_background`, `restrict_admin_theme_change`) VALUES
(1, NULL, 'superadmin', '#00A0DF', '#292929', '#cbcbcb', '#ffffff', NULL, 'dark', '2023-05-25 21:22:04', '2023-05-27 05:48:18', 0, NULL, 0),
(10, 3, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, 'dark', NULL, '2023-05-25 23:13:34', 0, NULL, 0),
(11, 3, 'project_admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, 'dark', NULL, '2023-05-25 23:13:34', 0, NULL, 0),
(12, 3, 'employee', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, 'dark', NULL, '2023-05-25 23:13:34', 0, NULL, 0),
(13, 3, 'client', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, 'dark', NULL, '2023-05-25 23:13:34', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_number` bigint(20) DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','pending','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_agent_groups`
--

CREATE TABLE `ticket_agent_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_channels`
--

CREATE TABLE `ticket_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_channels`
--

INSERT INTO `ticket_channels` (`id`, `company_id`, `channel_name`, `created_at`, `updated_at`) VALUES
(9, 3, 'Email', NULL, NULL),
(10, 3, 'Phone', NULL, NULL),
(11, 3, 'Twitter', NULL, NULL),
(12, 3, 'Facebook', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_custom_forms`
--

CREATE TABLE `ticket_custom_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_fields_id` int(10) UNSIGNED DEFAULT NULL,
  `field_display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_order` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_custom_forms`
--

INSERT INTO `ticket_custom_forms` (`id`, `company_id`, `custom_fields_id`, `field_display_name`, `field_name`, `field_type`, `field_order`, `status`, `required`, `created_at`, `updated_at`) VALUES
(15, 3, NULL, 'Name', 'name', 'text', 1, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(16, 3, NULL, 'Email', 'email', 'text', 2, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(17, 3, NULL, 'Ticket Subject', 'ticket_subject', 'text', 3, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(18, 3, NULL, 'Ticket Description', 'ticket_description', 'textarea', 4, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(19, 3, NULL, 'Type', 'type', 'select', 5, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(20, 3, NULL, 'Priority', 'priority', 'select', 6, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(21, 3, NULL, 'Assign Group', 'assign_group', 'select', 7, 'active', 0, '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_email_settings`
--

CREATE TABLE `ticket_email_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `mail_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `sync_interval` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_email_settings`
--

INSERT INTO `ticket_email_settings` (`id`, `company_id`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `imap_host`, `imap_port`, `imap_encryption`, `status`, `verified`, `sync_interval`, `created_at`, `updated_at`) VALUES
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_files`
--

CREATE TABLE `ticket_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ticket_reply_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_groups`
--

CREATE TABLE `ticket_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `imap_message_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_message_uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imap_in_reply_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply_templates`
--

CREATE TABLE `ticket_reply_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_heading` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tag_list`
--

CREATE TABLE `ticket_tag_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `tag_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(19, 3, 'Bug', NULL, NULL),
(20, 3, 'Suggestion', NULL, NULL),
(21, 3, 'Question', NULL, NULL),
(22, 3, 'Sales', NULL, NULL),
(23, 3, 'Code', NULL, NULL),
(24, 3, 'Management', NULL, NULL),
(25, 3, 'Problem', NULL, NULL),
(26, 3, 'Incident', NULL, NULL),
(27, 3, 'Feature Request', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translate_settings`
--

CREATE TABLE `translate_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translate_settings`
--

INSERT INTO `translate_settings` (`id`, `google_key`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `tr_front_details`
--

CREATE TABLE `tr_front_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `header_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_management_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_management_detail` text COLLATE utf8mb4_unicode_ci,
  `manage_bills_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_bills_detail` text COLLATE utf8mb4_unicode_ci,
  `teamates_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teamates_detail` text COLLATE utf8mb4_unicode_ci,
  `favourite_apps_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favourite_apps_detail` text COLLATE utf8mb4_unicode_ci,
  `cta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cta_detail` text COLLATE utf8mb4_unicode_ci,
  `client_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_detail` text COLLATE utf8mb4_unicode_ci,
  `testimonial_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_detail` text COLLATE utf8mb4_unicode_ci,
  `faq_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_detail` text COLLATE utf8mb4_unicode_ci,
  `footer_copyright_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tr_front_details`
--

INSERT INTO `tr_front_details` (`id`, `language_setting_id`, `header_title`, `header_description`, `image`, `feature_title`, `feature_description`, `price_title`, `price_description`, `task_management_title`, `task_management_detail`, `manage_bills_title`, `manage_bills_detail`, `teamates_title`, `teamates_detail`, `favourite_apps_title`, `favourite_apps_detail`, `cta_title`, `cta_detail`, `client_title`, `client_detail`, `testimonial_title`, `testimonial_detail`, `faq_title`, `faq_detail`, `footer_copyright_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR, CRM, and Project Management System', 'The simplest and most powerful way to collaborate with your team.', '', 'Team Communication for the 21st Century', NULL, 'Affordable Pricing', 'Worksuite for Teams is a single workspace for your small- to medium-sized company or team.', 'Task Management', 'Manage your projects and talent in one system for empowered teams, satisfied clients, and increased profitability.', 'Manage All Bills', 'Automate billing and revenue recognition to streamline the contract-to-cash cycle.', NULL, NULL, 'Integrate with Favorite Apps', 'Our app integrates with other third-party apps for added advantage.', 'Easier Business Management', 'Our experts will show you how our app can streamline your team’s work.', 'Trusted by the World’s Best Teams', 'Over 700 people use our product.', 'Loved by Businesses and Individuals Worldwide', NULL, 'FAQs', NULL, 'Copyright © 2020. All Rights Reserved', '2023-05-25 21:22:04', '2023-05-25 21:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `unit_types`
--

CREATE TABLE `unit_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `unit_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_types`
--

INSERT INTO `unit_types` (`id`, `company_id`, `unit_type`, `default`, `created_at`, `updated_at`) VALUES
(3, 3, 'Pcs', 1, '2023-05-25 21:34:59', '2023-05-25 21:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `universal_search`
--

CREATE TABLE `universal_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `searchable_id` int(11) NOT NULL,
  `module_type` enum('ticket','invoice','notice','proposal','task','creditNote','client','employee','project','estimate','lead') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universal_search`
--

INSERT INTO `universal_search` (`id`, `company_id`, `searchable_id`, `module_type`, `title`, `route_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, NULL, 'Admin', 'employees.show', '2023-05-25 21:24:42', '2023-05-25 21:24:42'),
(3, 3, 4, NULL, 'Admin', 'employees.show', '2023-05-25 21:34:59', '2023-05-25 21:34:59'),
(4, 3, 5, 'employee', 'user', 'employees.show', '2023-05-25 21:39:12', '2023-05-25 21:39:12'),
(5, 3, 1, 'task', 'Test', 'tasks.edit', '2023-05-26 02:33:02', '2023-05-26 02:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_auth_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_phonecode` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation` enum('mr','mrs','miss','dr','sir','madam') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `login` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `onesignal_player_id` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `dark_theme` tinyint(1) NOT NULL,
  `rtl` tinyint(1) NOT NULL,
  `admin_approval` tinyint(1) NOT NULL DEFAULT '1',
  `permission_sync` tinyint(1) NOT NULL DEFAULT '1',
  `google_calendar_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customised_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `user_auth_id`, `is_superadmin`, `name`, `email`, `image`, `country_phonecode`, `mobile`, `gender`, `salutation`, `locale`, `status`, `login`, `onesignal_player_id`, `last_login`, `email_notifications`, `country_id`, `dark_theme`, `rtl`, `admin_approval`, `permission_sync`, `google_calendar_status`, `created_at`, `updated_at`, `customised_permissions`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, NULL, 1, 1, 'Super Admin', 'sadmin@techsuiteone.com', NULL, NULL, NULL, NULL, NULL, 'en', 'active', 'enable', NULL, '2023-05-27 07:34:54', 1, NULL, 0, 0, 1, 1, 1, '2023-05-25 21:24:42', '2023-05-27 07:34:54', 0, NULL, NULL, NULL, NULL),
(4, 3, 3, 0, 'Admin', 'admin@techsuiteone.com', NULL, NULL, NULL, NULL, NULL, 'en', 'active', 'enable', NULL, '2023-05-27 07:56:05', 1, NULL, 0, 0, 1, 1, 1, '2023-05-25 21:34:59', '2023-05-27 07:56:05', 0, NULL, NULL, NULL, NULL),
(5, 3, 4, 0, 'user', 'user@techsuiteone.com', NULL, 93, NULL, 'male', NULL, 'en', 'active', 'enable', NULL, '2023-05-26 06:32:37', 1, 1, 0, 0, 1, 1, 1, '2023-05-25 21:39:12', '2023-05-26 06:32:37', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

CREATE TABLE `users_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `to` int(10) UNSIGNED DEFAULT NULL,
  `message_seen` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification_sent` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_chat_files`
--

CREATE TABLE `users_chat_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `users_chat_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hashname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_auths`
--

CREATE TABLE `user_auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `two_fa_verify_via` enum('email','google_authenticator','both') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'when authenticator is email',
  `two_factor_expires_at` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_auths`
--

INSERT INTO `user_auths` (`id`, `email`, `password`, `remember_token`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed`, `two_factor_email_confirmed`, `two_fa_verify_via`, `two_factor_code`, `two_factor_expires_at`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'sadmin@techsuiteone.com', '$2y$10$oFRZYvlDA0e445Rg2izF0.1pZC4aUvdTaxjJNMCpnhxqezhFVZ/4q', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-05-25 21:24:42', '2023-05-25 21:24:42'),
(2, 'admin@example.com', '$2y$10$fr8TwNOj5SqYQ.Qh2o3HZ.elTFP7YjkpjoVvIalxVw4ph7mX3MB0m', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-05-25 21:24:42', '2023-05-25 21:24:42'),
(3, 'admin@techsuiteone.com', '$2y$10$S9k9LWdcU1MiLmdP6pELx.JRc9xS30NZ7G9WobaSgWcC25bFXVVFK', 'GXMHSi9cNQphWz0etxhRL4xEWsgoIOYy7BVE2oBx5FII8NcyLFEUM3JI24xD', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-05-25 21:28:29', '2023-05-25 21:34:59'),
(4, 'user@techsuiteone.com', '$2y$10$xcyU2KCviy7T35zOHRIwrOwbI1Oj6NWrH./8ZxuYVotpjdhfpFvLO', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2023-05-25 21:39:12', '2023-05-25 21:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_invitations`
--

CREATE TABLE `user_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `invitation_type` enum('email','link') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invitation_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `email_restriction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_leadboard_settings`
--

CREATE TABLE `user_leadboard_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `board_column_id` int(10) UNSIGNED NOT NULL,
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `permission_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `permission_type_id`, `created_at`, `updated_at`) VALUES
(591, 4, 1, 4, NULL, NULL),
(592, 4, 2, 4, NULL, NULL),
(593, 4, 3, 4, NULL, NULL),
(594, 4, 4, 4, NULL, NULL),
(595, 4, 5, 4, NULL, NULL),
(596, 4, 6, 4, NULL, NULL),
(597, 4, 7, 4, NULL, NULL),
(598, 4, 8, 4, NULL, NULL),
(599, 4, 9, 4, NULL, NULL),
(600, 4, 10, 4, NULL, NULL),
(601, 4, 11, 4, NULL, NULL),
(602, 4, 12, 4, NULL, NULL),
(603, 4, 13, 4, NULL, NULL),
(604, 4, 14, 4, NULL, NULL),
(605, 4, 15, 4, NULL, NULL),
(606, 4, 16, 4, NULL, NULL),
(607, 4, 17, 4, NULL, NULL),
(608, 4, 18, 4, NULL, NULL),
(609, 4, 19, 4, NULL, NULL),
(610, 4, 20, 4, NULL, NULL),
(611, 4, 21, 4, NULL, NULL),
(612, 4, 22, 4, NULL, NULL),
(613, 4, 23, 4, NULL, NULL),
(614, 4, 24, 4, NULL, NULL),
(615, 4, 25, 4, NULL, NULL),
(616, 4, 26, 4, NULL, NULL),
(617, 4, 27, 4, NULL, NULL),
(618, 4, 28, 4, NULL, NULL),
(619, 4, 29, 4, NULL, NULL),
(620, 4, 30, 4, NULL, NULL),
(621, 4, 31, 4, NULL, NULL),
(622, 4, 32, 4, NULL, NULL),
(623, 4, 33, 4, NULL, NULL),
(624, 4, 34, 4, NULL, NULL),
(625, 4, 35, 4, NULL, NULL),
(626, 4, 36, 4, NULL, NULL),
(627, 4, 37, 4, NULL, NULL),
(628, 4, 38, 4, NULL, NULL),
(629, 4, 39, 4, NULL, NULL),
(630, 4, 40, 4, NULL, NULL),
(631, 4, 41, 4, NULL, NULL),
(632, 4, 42, 4, NULL, NULL),
(633, 4, 43, 4, NULL, NULL),
(634, 4, 44, 4, NULL, NULL),
(635, 4, 45, 4, NULL, NULL),
(636, 4, 46, 4, NULL, NULL),
(637, 4, 47, 4, NULL, NULL),
(638, 4, 48, 4, NULL, NULL),
(639, 4, 49, 4, NULL, NULL),
(640, 4, 50, 4, NULL, NULL),
(641, 4, 51, 4, NULL, NULL),
(642, 4, 52, 4, NULL, NULL),
(643, 4, 53, 4, NULL, NULL),
(644, 4, 54, 4, NULL, NULL),
(645, 4, 55, 4, NULL, NULL),
(646, 4, 56, 4, NULL, NULL),
(647, 4, 57, 4, NULL, NULL),
(648, 4, 58, 4, NULL, NULL),
(649, 4, 59, 4, NULL, NULL),
(650, 4, 60, 4, NULL, NULL),
(651, 4, 61, 4, NULL, NULL),
(652, 4, 62, 4, NULL, NULL),
(653, 4, 63, 4, NULL, NULL),
(654, 4, 64, 4, NULL, NULL),
(655, 4, 65, 4, NULL, NULL),
(656, 4, 66, 4, NULL, NULL),
(657, 4, 67, 4, NULL, NULL),
(658, 4, 68, 4, NULL, NULL),
(659, 4, 69, 4, NULL, NULL),
(660, 4, 70, 4, NULL, NULL),
(661, 4, 71, 4, NULL, NULL),
(662, 4, 72, 4, NULL, NULL),
(663, 4, 73, 4, NULL, NULL),
(664, 4, 74, 4, NULL, NULL),
(665, 4, 75, 4, NULL, NULL),
(666, 4, 76, 4, NULL, NULL),
(667, 4, 77, 4, NULL, NULL),
(668, 4, 78, 4, NULL, NULL),
(669, 4, 79, 4, NULL, NULL),
(670, 4, 80, 4, NULL, NULL),
(671, 4, 81, 4, NULL, NULL),
(672, 4, 82, 4, NULL, NULL),
(673, 4, 83, 4, NULL, NULL),
(674, 4, 84, 4, NULL, NULL),
(675, 4, 85, 4, NULL, NULL),
(676, 4, 86, 4, NULL, NULL),
(677, 4, 87, 4, NULL, NULL),
(678, 4, 88, 4, NULL, NULL),
(679, 4, 89, 4, NULL, NULL),
(680, 4, 90, 4, NULL, NULL),
(681, 4, 91, 4, NULL, NULL),
(682, 4, 92, 4, NULL, NULL),
(683, 4, 93, 4, NULL, NULL),
(684, 4, 94, 4, NULL, NULL),
(685, 4, 95, 4, NULL, NULL),
(686, 4, 96, 4, NULL, NULL),
(687, 4, 97, 4, NULL, NULL),
(688, 4, 98, 4, NULL, NULL),
(689, 4, 99, 4, NULL, NULL),
(690, 4, 100, 4, NULL, NULL),
(691, 4, 101, 4, NULL, NULL),
(692, 4, 102, 4, NULL, NULL),
(693, 4, 103, 4, NULL, NULL),
(694, 4, 104, 4, NULL, NULL),
(695, 4, 105, 4, NULL, NULL),
(696, 4, 106, 4, NULL, NULL),
(697, 4, 107, 4, NULL, NULL),
(698, 4, 108, 4, NULL, NULL),
(699, 4, 109, 4, NULL, NULL),
(700, 4, 110, 4, NULL, NULL),
(701, 4, 111, 4, NULL, NULL),
(702, 4, 112, 4, NULL, NULL),
(703, 4, 113, 4, NULL, NULL),
(704, 4, 114, 4, NULL, NULL),
(705, 4, 115, 4, NULL, NULL),
(706, 4, 116, 4, NULL, NULL),
(707, 4, 117, 4, NULL, NULL),
(708, 4, 118, 4, NULL, NULL),
(709, 4, 119, 4, NULL, NULL),
(710, 4, 120, 4, NULL, NULL),
(711, 4, 121, 4, NULL, NULL),
(712, 4, 122, 4, NULL, NULL),
(713, 4, 123, 4, NULL, NULL),
(714, 4, 124, 4, NULL, NULL),
(715, 4, 125, 4, NULL, NULL),
(716, 4, 126, 4, NULL, NULL),
(717, 4, 127, 4, NULL, NULL),
(718, 4, 128, 4, NULL, NULL),
(719, 4, 129, 4, NULL, NULL),
(720, 4, 130, 4, NULL, NULL),
(721, 4, 131, 4, NULL, NULL),
(722, 4, 132, 4, NULL, NULL),
(723, 4, 133, 4, NULL, NULL),
(724, 4, 134, 4, NULL, NULL),
(725, 4, 135, 4, NULL, NULL),
(726, 4, 136, 4, NULL, NULL),
(727, 4, 137, 4, NULL, NULL),
(728, 4, 138, 4, NULL, NULL),
(729, 4, 139, 4, NULL, NULL),
(730, 4, 140, 4, NULL, NULL),
(731, 4, 141, 4, NULL, NULL),
(732, 4, 142, 4, NULL, NULL),
(733, 4, 143, 4, NULL, NULL),
(734, 4, 144, 4, NULL, NULL),
(735, 4, 145, 4, NULL, NULL),
(736, 4, 146, 4, NULL, NULL),
(737, 4, 147, 4, NULL, NULL),
(738, 4, 148, 4, NULL, NULL),
(739, 4, 149, 4, NULL, NULL),
(740, 4, 150, 4, NULL, NULL),
(741, 4, 151, 4, NULL, NULL),
(742, 4, 152, 4, NULL, NULL),
(743, 4, 153, 4, NULL, NULL),
(744, 4, 154, 4, NULL, NULL),
(745, 4, 155, 4, NULL, NULL),
(746, 4, 156, 4, NULL, NULL),
(747, 4, 157, 4, NULL, NULL),
(748, 4, 158, 4, NULL, NULL),
(749, 4, 159, 4, NULL, NULL),
(750, 4, 160, 4, NULL, NULL),
(751, 4, 161, 4, NULL, NULL),
(752, 4, 162, 4, NULL, NULL),
(753, 4, 163, 4, NULL, NULL),
(754, 4, 164, 4, NULL, NULL),
(755, 4, 165, 4, NULL, NULL),
(756, 4, 166, 4, NULL, NULL),
(757, 4, 167, 4, NULL, NULL),
(758, 4, 168, 4, NULL, NULL),
(759, 4, 169, 4, NULL, NULL),
(760, 4, 170, 4, NULL, NULL),
(761, 4, 171, 4, NULL, NULL),
(762, 4, 172, 4, NULL, NULL),
(763, 4, 173, 4, NULL, NULL),
(764, 4, 174, 4, NULL, NULL),
(765, 4, 175, 4, NULL, NULL),
(766, 4, 176, 4, NULL, NULL),
(767, 4, 177, 4, NULL, NULL),
(768, 4, 178, 4, NULL, NULL),
(769, 4, 179, 4, NULL, NULL),
(770, 4, 180, 4, NULL, NULL),
(771, 4, 181, 4, NULL, NULL),
(772, 4, 182, 4, NULL, NULL),
(773, 4, 183, 4, NULL, NULL),
(774, 4, 184, 4, NULL, NULL),
(775, 4, 185, 4, NULL, NULL),
(776, 4, 186, 4, NULL, NULL),
(777, 4, 187, 4, NULL, NULL),
(778, 4, 188, 4, NULL, NULL),
(779, 4, 189, 4, NULL, NULL),
(780, 4, 190, 4, NULL, NULL),
(781, 4, 191, 4, NULL, NULL),
(782, 4, 192, 4, NULL, NULL),
(783, 4, 193, 4, NULL, NULL),
(784, 4, 194, 4, NULL, NULL),
(785, 4, 195, 4, NULL, NULL),
(786, 4, 196, 4, NULL, NULL),
(787, 4, 197, 4, NULL, NULL),
(788, 4, 198, 4, NULL, NULL),
(789, 4, 199, 4, NULL, NULL),
(790, 4, 200, 4, NULL, NULL),
(791, 4, 201, 4, NULL, NULL),
(792, 4, 202, 4, NULL, NULL),
(793, 4, 203, 4, NULL, NULL),
(794, 4, 204, 4, NULL, NULL),
(795, 4, 205, 4, NULL, NULL),
(796, 4, 206, 4, NULL, NULL),
(797, 4, 207, 4, NULL, NULL),
(798, 4, 208, 4, NULL, NULL),
(799, 4, 209, 4, NULL, NULL),
(800, 4, 210, 4, NULL, NULL),
(801, 4, 211, 4, NULL, NULL),
(802, 4, 212, 4, NULL, NULL),
(803, 4, 213, 4, NULL, NULL),
(804, 4, 214, 4, NULL, NULL),
(805, 4, 215, 4, NULL, NULL),
(806, 4, 216, 4, NULL, NULL),
(807, 4, 217, 4, NULL, NULL),
(808, 4, 218, 4, NULL, NULL),
(809, 4, 219, 4, NULL, NULL),
(810, 4, 220, 4, NULL, NULL),
(811, 4, 221, 4, NULL, NULL),
(812, 4, 222, 4, NULL, NULL),
(813, 4, 223, 4, NULL, NULL),
(814, 4, 224, 4, NULL, NULL),
(815, 4, 225, 4, NULL, NULL),
(816, 4, 226, 4, NULL, NULL),
(817, 4, 227, 4, NULL, NULL),
(818, 4, 228, 4, NULL, NULL),
(819, 4, 229, 4, NULL, NULL),
(820, 4, 230, 4, NULL, NULL),
(821, 4, 231, 4, NULL, NULL),
(822, 4, 232, 4, NULL, NULL),
(823, 4, 233, 4, NULL, NULL),
(824, 4, 234, 4, NULL, NULL),
(825, 4, 235, 4, NULL, NULL),
(826, 4, 236, 4, NULL, NULL),
(827, 4, 237, 4, NULL, NULL),
(828, 4, 238, 4, NULL, NULL),
(829, 4, 239, 4, NULL, NULL),
(830, 4, 240, 4, NULL, NULL),
(831, 4, 241, 4, NULL, NULL),
(832, 4, 242, 4, NULL, NULL),
(833, 4, 243, 4, NULL, NULL),
(834, 4, 244, 4, NULL, NULL),
(835, 4, 245, 4, NULL, NULL),
(836, 4, 246, 4, NULL, NULL),
(837, 4, 247, 4, NULL, NULL),
(838, 4, 248, 4, NULL, NULL),
(839, 4, 249, 4, NULL, NULL),
(840, 4, 250, 4, NULL, NULL),
(841, 4, 251, 4, NULL, NULL),
(842, 4, 252, 4, NULL, NULL),
(843, 4, 253, 4, NULL, NULL),
(844, 4, 254, 4, NULL, NULL),
(845, 4, 255, 4, NULL, NULL),
(846, 4, 256, 4, NULL, NULL),
(847, 4, 257, 4, NULL, NULL),
(848, 4, 258, 4, NULL, NULL),
(849, 4, 259, 4, NULL, NULL),
(850, 4, 260, 4, NULL, NULL),
(851, 4, 261, 4, NULL, NULL),
(852, 4, 262, 4, NULL, NULL),
(853, 4, 263, 4, NULL, NULL),
(854, 4, 264, 4, NULL, NULL),
(855, 4, 265, 4, NULL, NULL),
(856, 4, 266, 4, NULL, NULL),
(857, 4, 267, 4, NULL, NULL),
(858, 4, 268, 4, NULL, NULL),
(859, 4, 269, 4, NULL, NULL),
(860, 4, 270, 4, NULL, NULL),
(861, 4, 271, 4, NULL, NULL),
(862, 4, 272, 4, NULL, NULL),
(863, 4, 273, 4, NULL, NULL),
(864, 4, 274, 4, NULL, NULL),
(865, 4, 275, 4, NULL, NULL),
(866, 4, 276, 4, NULL, NULL),
(867, 4, 277, 4, NULL, NULL),
(868, 4, 278, 4, NULL, NULL),
(869, 4, 279, 4, NULL, NULL),
(870, 4, 280, 4, NULL, NULL),
(871, 4, 281, 4, NULL, NULL),
(872, 4, 282, 4, NULL, NULL),
(873, 4, 283, 4, NULL, NULL),
(874, 4, 284, 4, NULL, NULL),
(875, 4, 285, 4, NULL, NULL),
(876, 4, 286, 4, NULL, NULL),
(877, 4, 287, 4, NULL, NULL),
(878, 4, 288, 4, NULL, NULL),
(879, 4, 289, 4, NULL, NULL),
(880, 4, 290, 4, NULL, NULL),
(881, 4, 291, 4, NULL, NULL),
(882, 4, 292, 4, NULL, NULL),
(883, 4, 293, 4, NULL, NULL),
(884, 4, 294, 4, NULL, NULL),
(885, 4, 295, 4, NULL, NULL),
(886, 5, 1, 5, NULL, NULL),
(887, 5, 2, 5, NULL, NULL),
(888, 5, 3, 5, NULL, NULL),
(889, 5, 4, 5, NULL, NULL),
(890, 5, 5, 5, NULL, NULL),
(891, 5, 6, 5, NULL, NULL),
(892, 5, 7, 5, NULL, NULL),
(893, 5, 8, 5, NULL, NULL),
(894, 5, 9, 5, NULL, NULL),
(895, 5, 10, 5, NULL, NULL),
(896, 5, 11, 5, NULL, NULL),
(897, 5, 12, 5, NULL, NULL),
(898, 5, 13, 5, NULL, NULL),
(899, 5, 14, 5, NULL, NULL),
(900, 5, 15, 5, NULL, NULL),
(901, 5, 16, 5, NULL, NULL),
(902, 5, 17, 5, NULL, NULL),
(903, 5, 18, 5, NULL, NULL),
(904, 5, 19, 5, NULL, NULL),
(905, 5, 20, 5, NULL, NULL),
(906, 5, 21, 5, NULL, NULL),
(907, 5, 22, 5, NULL, NULL),
(908, 5, 23, 5, NULL, NULL),
(909, 5, 24, 5, NULL, NULL),
(910, 5, 25, 5, NULL, NULL),
(911, 5, 26, 5, NULL, NULL),
(912, 5, 27, 5, NULL, NULL),
(913, 5, 28, 5, NULL, NULL),
(914, 5, 29, 5, NULL, NULL),
(915, 5, 30, 5, NULL, NULL),
(916, 5, 31, 5, NULL, NULL),
(917, 5, 32, 5, NULL, NULL),
(918, 5, 33, 5, NULL, NULL),
(919, 5, 34, 5, NULL, NULL),
(920, 5, 35, 4, NULL, NULL),
(921, 5, 36, 5, NULL, NULL),
(922, 5, 37, 5, NULL, NULL),
(923, 5, 38, 5, NULL, NULL),
(924, 5, 39, 5, NULL, NULL),
(925, 5, 40, 5, NULL, NULL),
(926, 5, 41, 5, NULL, NULL),
(927, 5, 42, 5, NULL, NULL),
(928, 5, 43, 5, NULL, NULL),
(929, 5, 44, 2, NULL, NULL),
(930, 5, 45, 5, NULL, NULL),
(931, 5, 46, 5, NULL, NULL),
(932, 5, 47, 2, NULL, NULL),
(933, 5, 48, 2, NULL, NULL),
(934, 5, 49, 2, NULL, NULL),
(935, 5, 50, 2, NULL, NULL),
(936, 5, 51, 5, NULL, NULL),
(937, 5, 52, 2, NULL, NULL),
(938, 5, 53, 5, NULL, NULL),
(939, 5, 54, 5, NULL, NULL),
(940, 5, 55, 5, NULL, NULL),
(941, 5, 56, 4, NULL, NULL),
(942, 5, 57, 4, NULL, NULL),
(943, 5, 58, 1, NULL, NULL),
(944, 5, 59, 4, NULL, NULL),
(945, 5, 60, 4, NULL, NULL),
(946, 5, 61, 1, NULL, NULL),
(947, 5, 62, 1, NULL, NULL),
(948, 5, 63, 5, NULL, NULL),
(949, 5, 64, 5, NULL, NULL),
(950, 5, 65, 5, NULL, NULL),
(951, 5, 66, 5, NULL, NULL),
(952, 5, 67, 5, NULL, NULL),
(953, 5, 68, 4, NULL, NULL),
(954, 5, 69, 5, NULL, NULL),
(955, 5, 70, 5, NULL, NULL),
(956, 5, 71, 5, NULL, NULL),
(957, 5, 72, 5, NULL, NULL),
(958, 5, 73, 5, NULL, NULL),
(959, 5, 74, 5, NULL, NULL),
(960, 5, 75, 5, NULL, NULL),
(961, 5, 76, 5, NULL, NULL),
(962, 5, 77, 4, NULL, NULL),
(963, 5, 78, 5, NULL, NULL),
(964, 5, 79, 4, NULL, NULL),
(965, 5, 80, 5, NULL, NULL),
(966, 5, 81, 5, NULL, NULL),
(967, 5, 82, 5, NULL, NULL),
(968, 5, 83, 5, NULL, NULL),
(969, 5, 84, 5, NULL, NULL),
(970, 5, 85, 4, NULL, NULL),
(971, 5, 86, 5, NULL, NULL),
(972, 5, 87, 5, NULL, NULL),
(973, 5, 88, 5, NULL, NULL),
(974, 5, 89, 5, NULL, NULL),
(975, 5, 90, 5, NULL, NULL),
(976, 5, 91, 5, NULL, NULL),
(977, 5, 92, 5, NULL, NULL),
(978, 5, 93, 5, NULL, NULL),
(979, 5, 94, 5, NULL, NULL),
(980, 5, 95, 5, NULL, NULL),
(981, 5, 96, 2, NULL, NULL),
(982, 5, 97, 5, NULL, NULL),
(983, 5, 98, 5, NULL, NULL),
(984, 5, 99, 1, NULL, NULL),
(985, 5, 100, 3, NULL, NULL),
(986, 5, 101, 1, NULL, NULL),
(987, 5, 102, 1, NULL, NULL),
(988, 5, 103, 5, NULL, NULL),
(989, 5, 104, 5, NULL, NULL),
(990, 5, 105, 5, NULL, NULL),
(991, 5, 106, 5, NULL, NULL),
(992, 5, 107, 4, NULL, NULL),
(993, 5, 108, 4, NULL, NULL),
(994, 5, 109, 1, NULL, NULL),
(995, 5, 110, 4, NULL, NULL),
(996, 5, 111, 4, NULL, NULL),
(997, 5, 112, 1, NULL, NULL),
(998, 5, 113, 1, NULL, NULL),
(999, 5, 114, 4, NULL, NULL),
(1000, 5, 115, 4, NULL, NULL),
(1001, 5, 116, 1, NULL, NULL),
(1002, 5, 117, 1, NULL, NULL),
(1003, 5, 118, 4, NULL, NULL),
(1004, 5, 119, 4, NULL, NULL),
(1005, 5, 120, 1, NULL, NULL),
(1006, 5, 121, 1, NULL, NULL),
(1007, 5, 122, 5, NULL, NULL),
(1008, 5, 123, 5, NULL, NULL),
(1009, 5, 124, 5, NULL, NULL),
(1010, 5, 125, 5, NULL, NULL),
(1011, 5, 126, 5, NULL, NULL),
(1012, 5, 127, 5, NULL, NULL),
(1013, 5, 128, 5, NULL, NULL),
(1014, 5, 129, 5, NULL, NULL),
(1015, 5, 130, 5, NULL, NULL),
(1016, 5, 131, 5, NULL, NULL),
(1017, 5, 132, 5, NULL, NULL),
(1018, 5, 133, 5, NULL, NULL),
(1019, 5, 134, 5, NULL, NULL),
(1020, 5, 135, 5, NULL, NULL),
(1021, 5, 136, 5, NULL, NULL),
(1022, 5, 137, 5, NULL, NULL),
(1023, 5, 138, 5, NULL, NULL),
(1024, 5, 139, 5, NULL, NULL),
(1025, 5, 140, 5, NULL, NULL),
(1026, 5, 141, 5, NULL, NULL),
(1027, 5, 142, 5, NULL, NULL),
(1028, 5, 143, 5, NULL, NULL),
(1029, 5, 144, 1, NULL, NULL),
(1030, 5, 145, 3, NULL, NULL),
(1031, 5, 146, 1, NULL, NULL),
(1032, 5, 147, 5, NULL, NULL),
(1033, 5, 148, 5, NULL, NULL),
(1034, 5, 149, 5, NULL, NULL),
(1035, 5, 150, 5, NULL, NULL),
(1036, 5, 151, 1, NULL, NULL),
(1037, 5, 152, 3, NULL, NULL),
(1038, 5, 153, 3, NULL, NULL),
(1039, 5, 154, 1, NULL, NULL),
(1040, 5, 155, 5, NULL, NULL),
(1041, 5, 156, 5, NULL, NULL),
(1042, 5, 157, 5, NULL, NULL),
(1043, 5, 158, 5, NULL, NULL),
(1044, 5, 159, 5, NULL, NULL),
(1045, 5, 160, 5, NULL, NULL),
(1046, 5, 161, 2, NULL, NULL),
(1047, 5, 162, 5, NULL, NULL),
(1048, 5, 163, 5, NULL, NULL),
(1049, 5, 164, 5, NULL, NULL),
(1050, 5, 165, 2, NULL, NULL),
(1051, 5, 166, 5, NULL, NULL),
(1052, 5, 167, 5, NULL, NULL),
(1053, 5, 168, 1, NULL, NULL),
(1054, 5, 169, 3, NULL, NULL),
(1055, 5, 170, 5, NULL, NULL),
(1056, 5, 171, 5, NULL, NULL),
(1057, 5, 172, 5, NULL, NULL),
(1058, 5, 173, 5, NULL, NULL),
(1059, 5, 174, 1, NULL, NULL),
(1060, 5, 175, 3, NULL, NULL),
(1061, 5, 176, 1, NULL, NULL),
(1062, 5, 177, 5, NULL, NULL),
(1063, 5, 178, 5, NULL, NULL),
(1064, 5, 179, 5, NULL, NULL),
(1065, 5, 180, 5, NULL, NULL),
(1066, 5, 181, 5, NULL, NULL),
(1067, 5, 182, 5, NULL, NULL),
(1068, 5, 183, 5, NULL, NULL),
(1069, 5, 184, 5, NULL, NULL),
(1070, 5, 185, 5, NULL, NULL),
(1071, 5, 186, 5, NULL, NULL),
(1072, 5, 187, 1, NULL, NULL),
(1073, 5, 188, 4, NULL, NULL),
(1074, 5, 189, 5, NULL, NULL),
(1075, 5, 190, 4, NULL, NULL),
(1076, 5, 191, 4, NULL, NULL),
(1077, 5, 192, 1, NULL, NULL),
(1078, 5, 193, 1, NULL, NULL),
(1079, 5, 194, 5, NULL, NULL),
(1080, 5, 195, 5, NULL, NULL),
(1081, 5, 196, 5, NULL, NULL),
(1082, 5, 197, 5, NULL, NULL),
(1083, 5, 198, 5, NULL, NULL),
(1084, 5, 199, 5, NULL, NULL),
(1085, 5, 200, 5, NULL, NULL),
(1086, 5, 201, 5, NULL, NULL),
(1087, 5, 202, 5, NULL, NULL),
(1088, 5, 203, 3, NULL, NULL),
(1089, 5, 204, 5, NULL, NULL),
(1090, 5, 205, 5, NULL, NULL),
(1091, 5, 206, 5, NULL, NULL),
(1092, 5, 207, 5, NULL, NULL),
(1093, 5, 208, 5, NULL, NULL),
(1094, 5, 209, 5, NULL, NULL),
(1095, 5, 210, 4, NULL, NULL),
(1096, 5, 211, 5, NULL, NULL),
(1097, 5, 212, 5, NULL, NULL),
(1098, 5, 213, 5, NULL, NULL),
(1099, 5, 214, 5, NULL, NULL),
(1100, 5, 215, 5, NULL, NULL),
(1101, 5, 216, 5, NULL, NULL),
(1102, 5, 217, 5, NULL, NULL),
(1103, 5, 218, 5, NULL, NULL),
(1104, 5, 219, 1, NULL, NULL),
(1105, 5, 220, 3, NULL, NULL),
(1106, 5, 221, 1, NULL, NULL),
(1107, 5, 222, 1, NULL, NULL),
(1108, 5, 223, 5, NULL, NULL),
(1109, 5, 224, 5, NULL, NULL),
(1110, 5, 225, 5, NULL, NULL),
(1111, 5, 226, 5, NULL, NULL),
(1112, 5, 227, 5, NULL, NULL),
(1113, 5, 228, 5, NULL, NULL),
(1114, 5, 229, 5, NULL, NULL),
(1115, 5, 230, 5, NULL, NULL),
(1116, 5, 231, 5, NULL, NULL),
(1117, 5, 232, 5, NULL, NULL),
(1118, 5, 233, 5, NULL, NULL),
(1119, 5, 234, 5, NULL, NULL),
(1120, 5, 235, 5, NULL, NULL),
(1121, 5, 236, 5, NULL, NULL),
(1122, 5, 237, 5, NULL, NULL),
(1123, 5, 238, 5, NULL, NULL),
(1124, 5, 239, 5, NULL, NULL),
(1125, 5, 240, 5, NULL, NULL),
(1126, 5, 241, 5, NULL, NULL),
(1127, 5, 242, 5, NULL, NULL),
(1128, 5, 243, 5, NULL, NULL),
(1129, 5, 244, 5, NULL, NULL),
(1130, 5, 245, 5, NULL, NULL),
(1131, 5, 246, 5, NULL, NULL),
(1132, 5, 247, 5, NULL, NULL),
(1133, 5, 248, 5, NULL, NULL),
(1134, 5, 249, 5, NULL, NULL),
(1135, 5, 250, 5, NULL, NULL),
(1136, 5, 251, 5, NULL, NULL),
(1137, 5, 252, 5, NULL, NULL),
(1138, 5, 253, 5, NULL, NULL),
(1139, 5, 254, 5, NULL, NULL),
(1140, 5, 255, 5, NULL, NULL),
(1141, 5, 256, 5, NULL, NULL),
(1142, 5, 257, 5, NULL, NULL),
(1143, 5, 258, 5, NULL, NULL),
(1144, 5, 259, 5, NULL, NULL),
(1145, 5, 260, 5, NULL, NULL),
(1146, 5, 261, 5, NULL, NULL),
(1147, 5, 262, 5, NULL, NULL),
(1148, 5, 263, 5, NULL, NULL),
(1149, 5, 264, 5, NULL, NULL),
(1150, 5, 265, 5, NULL, NULL),
(1151, 5, 266, 5, NULL, NULL),
(1152, 5, 267, 5, NULL, NULL),
(1153, 5, 268, 5, NULL, NULL),
(1154, 5, 269, 5, NULL, NULL),
(1155, 5, 270, 5, NULL, NULL),
(1156, 5, 271, 5, NULL, NULL),
(1157, 5, 272, 5, NULL, NULL),
(1158, 5, 273, 5, NULL, NULL),
(1159, 5, 274, 5, NULL, NULL),
(1160, 5, 275, 5, NULL, NULL),
(1161, 5, 276, 5, NULL, NULL),
(1162, 5, 277, 5, NULL, NULL),
(1163, 5, 278, 5, NULL, NULL),
(1164, 5, 279, 5, NULL, NULL),
(1165, 5, 280, 5, NULL, NULL),
(1166, 5, 281, 5, NULL, NULL),
(1167, 5, 282, 5, NULL, NULL),
(1168, 5, 283, 5, NULL, NULL),
(1169, 5, 284, 5, NULL, NULL),
(1170, 5, 285, 5, NULL, NULL),
(1171, 5, 286, 5, NULL, NULL),
(1172, 5, 287, 5, NULL, NULL),
(1173, 5, 288, 5, NULL, NULL),
(1174, 5, 289, 5, NULL, NULL),
(1175, 5, 290, 5, NULL, NULL),
(1176, 5, 291, 5, NULL, NULL),
(1177, 5, 292, 5, NULL, NULL),
(1178, 5, 293, 5, NULL, NULL),
(1179, 5, 294, 5, NULL, NULL),
(1180, 5, 295, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_taskboard_settings`
--

CREATE TABLE `user_taskboard_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `board_column_id` int(10) UNSIGNED NOT NULL,
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visa_details`
--

CREATE TABLE `visa_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `visa_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accept_estimates_company_id_foreign` (`company_id`),
  ADD KEY `accept_estimates_estimate_id_foreign` (`estimate_id`);

--
-- Indexes for table `appreciations`
--
ALTER TABLE `appreciations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appreciations_company_id_foreign` (`company_id`),
  ADD KEY `appreciations_award_id_foreign` (`award_id`),
  ADD KEY `appreciations_award_to_foreign` (`award_to`),
  ADD KEY `appreciations_added_by_foreign` (`added_by`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_company_id_foreign` (`company_id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`),
  ADD KEY `attendances_location_id_foreign` (`location_id`),
  ADD KEY `attendances_clock_in_time_index` (`clock_in_time`),
  ADD KEY `attendances_clock_out_time_index` (`clock_out_time`),
  ADD KEY `attendances_added_by_foreign` (`added_by`),
  ADD KEY `attendances_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `attendances_employee_shift_id_foreign` (`employee_shift_id`);

--
-- Indexes for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_settings_company_id_foreign` (`company_id`),
  ADD KEY `attendance_settings_default_employee_shift_foreign` (`default_employee_shift`);

--
-- Indexes for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorize_invoices_company_id_foreign` (`company_id`),
  ADD KEY `authorize_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorize_subscriptions_company_id_foreign` (`company_id`),
  ADD KEY `authorize_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id_foreign` (`company_id`),
  ADD KEY `awards_award_icon_id_foreign` (`award_icon_id`);

--
-- Indexes for table `award_icons`
--
ALTER TABLE `award_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_accounts_company_id_foreign` (`company_id`),
  ADD KEY `bank_accounts_currency_id_foreign` (`currency_id`),
  ADD KEY `bank_accounts_added_by_foreign` (`added_by`),
  ADD KEY `bank_accounts_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transactions_company_id_foreign` (`company_id`),
  ADD KEY `bank_transactions_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `bank_transactions_payment_id_foreign` (`payment_id`),
  ADD KEY `bank_transactions_invoice_id_foreign` (`invoice_id`),
  ADD KEY `bank_transactions_expense_id_foreign` (`expense_id`),
  ADD KEY `bank_transactions_added_by_foreign` (`added_by`),
  ADD KEY `bank_transactions_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contacts_company_id_foreign` (`company_id`),
  ADD KEY `client_contacts_user_id_foreign` (`user_id`),
  ADD KEY `client_contacts_added_by_foreign` (`added_by`),
  ADD KEY `client_contacts_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `client_details`
--
ALTER TABLE `client_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_details_company_id_foreign` (`company_id`),
  ADD KEY `client_details_user_id_foreign` (`user_id`),
  ADD KEY `client_details_category_id_foreign` (`category_id`),
  ADD KEY `client_details_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `client_details_added_by_foreign` (`added_by`),
  ADD KEY `client_details_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `client_details_country_id_foreign` (`country_id`);

--
-- Indexes for table `client_docs`
--
ALTER TABLE `client_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_docs_company_id_foreign` (`company_id`),
  ADD KEY `client_docs_user_id_foreign` (`user_id`),
  ADD KEY `client_docs_added_by_foreign` (`added_by`),
  ADD KEY `client_docs_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `client_notes`
--
ALTER TABLE `client_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_notes_company_id_foreign` (`company_id`),
  ADD KEY `client_notes_client_id_foreign` (`client_id`),
  ADD KEY `client_notes_member_id_foreign` (`member_id`),
  ADD KEY `client_notes_added_by_foreign` (`added_by`),
  ADD KEY `client_notes_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_sub_categories_company_id_foreign` (`company_id`),
  ADD KEY `client_sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_user_notes_company_id_foreign` (`company_id`),
  ADD KEY `client_user_notes_user_id_foreign` (`user_id`),
  ADD KEY `client_user_notes_client_note_id_foreign` (`client_note_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`),
  ADD KEY `companies_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `companies_default_task_status_foreign` (`default_task_status`),
  ADD KEY `companies_package_id_foreign` (`package_id`),
  ADD KEY `companies_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `company_addresses`
--
ALTER TABLE `company_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_addresses_company_id_foreign` (`company_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contracts_company_id_foreign` (`company_id`),
  ADD KEY `contracts_client_id_foreign` (`client_id`),
  ADD KEY `contracts_contract_type_id_foreign` (`contract_type_id`),
  ADD KEY `contracts_added_by_foreign` (`added_by`),
  ADD KEY `contracts_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `contracts_currency_id_foreign` (`currency_id`),
  ADD KEY `contracts_project_id_foreign` (`project_id`);

--
-- Indexes for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_discussions_company_id_foreign` (`company_id`),
  ADD KEY `contract_discussions_contract_id_foreign` (`contract_id`),
  ADD KEY `contract_discussions_from_foreign` (`from`),
  ADD KEY `contract_discussions_added_by_foreign` (`added_by`),
  ADD KEY `contract_discussions_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `contract_files`
--
ALTER TABLE `contract_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_files_company_id_foreign` (`company_id`),
  ADD KEY `contract_files_user_id_foreign` (`user_id`),
  ADD KEY `contract_files_contract_id_foreign` (`contract_id`),
  ADD KEY `contract_files_added_by_foreign` (`added_by`),
  ADD KEY `contract_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `contract_renews`
--
ALTER TABLE `contract_renews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_renews_company_id_foreign` (`company_id`),
  ADD KEY `contract_renews_renewed_by_foreign` (`renewed_by`),
  ADD KEY `contract_renews_contract_id_foreign` (`contract_id`),
  ADD KEY `contract_renews_added_by_foreign` (`added_by`),
  ADD KEY `contract_renews_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `contract_signs`
--
ALTER TABLE `contract_signs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_signs_contract_id_foreign` (`contract_id`),
  ADD KEY `contract_signs_company_id_foreign` (`company_id`);

--
-- Indexes for table `contract_templates`
--
ALTER TABLE `contract_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_templates_company_id_foreign` (`company_id`),
  ADD KEY `contract_templates_contract_type_id_foreign` (`contract_type_id`),
  ADD KEY `contract_templates_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_company_id_foreign` (`company_id`),
  ADD KEY `conversation_user_one_foreign` (`user_one`),
  ADD KEY `conversation_user_two_foreign` (`user_two`);

--
-- Indexes for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_reply_company_id_foreign` (`company_id`),
  ADD KEY `conversation_reply_conversation_id_foreign` (`conversation_id`),
  ADD KEY `conversation_reply_user_id_foreign` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_notes_company_id_foreign` (`company_id`),
  ADD KEY `credit_notes_project_id_foreign` (`project_id`),
  ADD KEY `credit_notes_client_id_foreign` (`client_id`),
  ADD KEY `credit_notes_currency_id_foreign` (`currency_id`),
  ADD KEY `credit_notes_added_by_foreign` (`added_by`),
  ADD KEY `credit_notes_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_note_items_credit_note_id_foreign` (`credit_note_id`),
  ADD KEY `credit_note_items_unit_id_foreign` (`unit_id`),
  ADD KEY `credit_note_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `credit_note_item_images`
--
ALTER TABLE `credit_note_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_note_item_images_credit_note_item_id_foreign` (`credit_note_item_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_company_id_foreign` (`company_id`);

--
-- Indexes for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_format_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_company_id_foreign` (`company_id`),
  ADD KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_data_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_fields_data_model_index` (`model`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_groups_company_id_foreign` (`company_id`),
  ADD KEY `custom_field_groups_model_index` (`model`);

--
-- Indexes for table `custom_link_settings`
--
ALTER TABLE `custom_link_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_link_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widgets_company_id_foreign` (`company_id`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_backup_cron_settings`
--
ALTER TABLE `database_backup_cron_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_company_id_foreign` (`company_id`),
  ADD KEY `designations_added_by_foreign` (`added_by`),
  ADD KEY `designations_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_discussion_category_id_foreign` (`discussion_category_id`),
  ADD KEY `discussions_project_id_foreign` (`project_id`),
  ADD KEY `discussions_user_id_foreign` (`user_id`),
  ADD KEY `discussions_best_answer_id_foreign` (`best_answer_id`),
  ADD KEY `discussions_last_reply_by_id_foreign` (`last_reply_by_id`),
  ADD KEY `discussions_added_by_foreign` (`added_by`),
  ADD KEY `discussions_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `discussions_company_id_foreign` (`company_id`);

--
-- Indexes for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `discussion_files`
--
ALTER TABLE `discussion_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_files_company_id_foreign` (`company_id`),
  ADD KEY `discussion_files_user_id_foreign` (`user_id`),
  ADD KEY `discussion_files_discussion_id_foreign` (`discussion_id`),
  ADD KEY `discussion_files_discussion_reply_id_foreign` (`discussion_reply_id`);

--
-- Indexes for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_replies_discussion_id_foreign` (`discussion_id`),
  ADD KEY `discussion_replies_user_id_foreign` (`user_id`),
  ADD KEY `discussion_replies_company_id_foreign` (`company_id`);

--
-- Indexes for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_notification_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emergency_contacts_company_id_foreign` (`company_id`),
  ADD KEY `emergency_contacts_user_id_foreign` (`user_id`),
  ADD KEY `emergency_contacts_added_by_foreign` (`added_by`),
  ADD KEY `emergency_contacts_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_details_employee_id_company_id_unique` (`employee_id`,`company_id`),
  ADD UNIQUE KEY `employee_details_slack_username_company_id_unique` (`slack_username`,`company_id`),
  ADD KEY `employee_details_company_id_foreign` (`company_id`),
  ADD KEY `employee_details_user_id_foreign` (`user_id`),
  ADD KEY `employee_details_department_id_foreign` (`department_id`),
  ADD KEY `employee_details_designation_id_foreign` (`designation_id`),
  ADD KEY `employee_details_added_by_foreign` (`added_by`),
  ADD KEY `employee_details_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `employee_details_reporting_to_foreign` (`reporting_to`);

--
-- Indexes for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_docs_company_id_foreign` (`company_id`),
  ADD KEY `employee_docs_user_id_foreign` (`user_id`),
  ADD KEY `employee_docs_added_by_foreign` (`added_by`),
  ADD KEY `employee_docs_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leave_quotas_user_id_foreign` (`user_id`),
  ADD KEY `employee_leave_quotas_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_shifts_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_shift_change_requests`
--
ALTER TABLE `employee_shift_change_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_shift_change_requests_company_id_foreign` (`company_id`),
  ADD KEY `employee_shift_change_requests_shift_schedule_id_foreign` (`shift_schedule_id`),
  ADD KEY `employee_shift_change_requests_employee_shift_id_foreign` (`employee_shift_id`);

--
-- Indexes for table `employee_shift_schedules`
--
ALTER TABLE `employee_shift_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_shift_schedules_user_id_foreign` (`user_id`),
  ADD KEY `employee_shift_schedules_date_index` (`date`),
  ADD KEY `employee_shift_schedules_employee_shift_id_foreign` (`employee_shift_id`),
  ADD KEY `employee_shift_schedules_added_by_foreign` (`added_by`),
  ADD KEY `employee_shift_schedules_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_skills_company_id_foreign` (`company_id`),
  ADD KEY `employee_skills_user_id_foreign` (`user_id`),
  ADD KEY `employee_skills_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_teams_company_id_foreign` (`company_id`),
  ADD KEY `employee_teams_team_id_foreign` (`team_id`),
  ADD KEY `employee_teams_user_id_foreign` (`user_id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estimates_estimate_number_company_id_unique` (`estimate_number`,`company_id`),
  ADD KEY `estimates_company_id_foreign` (`company_id`),
  ADD KEY `estimates_client_id_foreign` (`client_id`),
  ADD KEY `estimates_currency_id_foreign` (`currency_id`),
  ADD KEY `estimates_added_by_foreign` (`added_by`),
  ADD KEY `estimates_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_items_estimate_id_foreign` (`estimate_id`),
  ADD KEY `estimate_items_unit_id_foreign` (`unit_id`),
  ADD KEY `estimate_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `estimate_item_images`
--
ALTER TABLE `estimate_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_item_images_estimate_item_id_foreign` (`estimate_item_id`);

--
-- Indexes for table `estimate_templates`
--
ALTER TABLE `estimate_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_templates_company_id_foreign` (`company_id`),
  ADD KEY `estimate_templates_currency_id_foreign` (`currency_id`),
  ADD KEY `estimate_templates_added_by_foreign` (`added_by`),
  ADD KEY `estimate_templates_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `estimate_template_items`
--
ALTER TABLE `estimate_template_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_template_items_company_id_foreign` (`company_id`),
  ADD KEY `estimate_template_items_estimate_template_id_foreign` (`estimate_template_id`),
  ADD KEY `estimate_template_items_unit_id_foreign` (`unit_id`),
  ADD KEY `estimate_template_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `estimate_template_item_images`
--
ALTER TABLE `estimate_template_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_template_item_images_company_id_foreign` (`company_id`),
  ADD KEY `estimate_template_item_images_estimate_template_item_id_foreign` (`estimate_template_item_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_company_id_foreign` (`company_id`),
  ADD KEY `events_added_by_foreign` (`added_by`),
  ADD KEY `events_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_attendees_company_id_foreign` (`company_id`),
  ADD KEY `event_attendees_user_id_foreign` (`user_id`),
  ADD KEY `event_attendees_event_id_foreign` (`event_id`);

--
-- Indexes for table `event_files`
--
ALTER TABLE `event_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_files_company_id_foreign` (`company_id`),
  ADD KEY `event_files_event_id_foreign` (`event_id`),
  ADD KEY `event_files_added_by_foreign` (`added_by`),
  ADD KEY `event_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_currency_id_foreign` (`currency_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`),
  ADD KEY `expenses_expenses_recurring_id_foreign` (`expenses_recurring_id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_added_by_foreign` (`added_by`),
  ADD KEY `expenses_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `expenses_approver_id_foreign` (`approver_id`),
  ADD KEY `expenses_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `expenses_default_currency_id_foreign` (`default_currency_id`);

--
-- Indexes for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_company_id_foreign` (`company_id`),
  ADD KEY `expenses_category_added_by_foreign` (`added_by`),
  ADD KEY `expenses_category_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_roles_company_id_foreign` (`company_id`),
  ADD KEY `expenses_category_roles_expenses_category_id_foreign` (`expenses_category_id`),
  ADD KEY `expenses_category_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_recurring_company_id_foreign` (`company_id`),
  ADD KEY `expenses_recurring_category_id_foreign` (`category_id`),
  ADD KEY `expenses_recurring_currency_id_foreign` (`currency_id`),
  ADD KEY `expenses_recurring_project_id_foreign` (`project_id`),
  ADD KEY `expenses_recurring_user_id_foreign` (`user_id`),
  ADD KEY `expenses_recurring_created_by_foreign` (`created_by`),
  ADD KEY `expenses_recurring_added_by_foreign` (`added_by`),
  ADD KEY `expenses_recurring_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `expenses_recurring_bank_account_id_foreign` (`bank_account_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_files`
--
ALTER TABLE `faq_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_files_user_id_foreign` (`user_id`),
  ADD KEY `faq_files_faq_id_foreign` (`faq_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_language_setting_id_foreign` (`language_setting_id`),
  ADD KEY `features_front_feature_id_foreign` (`front_feature_id`);

--
-- Indexes for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_company_id_foreign` (`company_id`);

--
-- Indexes for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_menu_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_clients`
--
ALTER TABLE `front_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_clients_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_details`
--
ALTER TABLE `front_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_faqs_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_features`
--
ALTER TABLE `front_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_features_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_menu_buttons_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_widgets`
--
ALTER TABLE `front_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdpr_settings`
--
ALTER TABLE `gdpr_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_currencies`
--
ALTER TABLE `global_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_invoices_company_id_foreign` (`company_id`),
  ADD KEY `global_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `global_invoices_package_id_foreign` (`package_id`),
  ADD KEY `global_invoices_global_subscription_id_foreign` (`global_subscription_id`),
  ADD KEY `global_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `global_invoice_settings`
--
ALTER TABLE `global_invoice_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_payment_gateway_credentials`
--
ALTER TABLE `global_payment_gateway_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `global_settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_subscriptions_company_id_foreign` (`company_id`),
  ADD KEY `global_subscriptions_package_id_foreign` (`package_id`),
  ADD KEY `global_subscriptions_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `google_calendar_modules_company_id_foreign` (`company_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`),
  ADD KEY `holidays_date_index` (`date`),
  ADD KEY `holidays_added_by_foreign` (`added_by`),
  ADD KEY `holidays_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_company_id_unique` (`invoice_number`,`company_id`),
  ADD UNIQUE KEY `invoices_transaction_id_unique` (`transaction_id`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`),
  ADD KEY `invoices_due_date_index` (`due_date`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `invoices_estimate_id_foreign` (`estimate_id`),
  ADD KEY `invoices_parent_id_foreign` (`parent_id`),
  ADD KEY `invoices_invoice_recurring_id_foreign` (`invoice_recurring_id`),
  ADD KEY `invoices_created_by_foreign` (`created_by`),
  ADD KEY `invoices_added_by_foreign` (`added_by`),
  ADD KEY `invoices_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `invoices_company_address_id_foreign` (`company_address_id`),
  ADD KEY `invoices_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `invoices_default_currency_id_foreign` (`default_currency_id`),
  ADD KEY `payments_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_unit_id_foreign` (`unit_id`),
  ADD KEY `invoice_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `invoice_item_images`
--
ALTER TABLE `invoice_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_images_invoice_item_id_foreign` (`invoice_item_id`);

--
-- Indexes for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recurring_company_id_foreign` (`company_id`),
  ADD KEY `invoice_recurring_currency_id_foreign` (`currency_id`),
  ADD KEY `invoice_recurring_project_id_foreign` (`project_id`),
  ADD KEY `invoice_recurring_client_id_foreign` (`client_id`),
  ADD KEY `invoice_recurring_user_id_foreign` (`user_id`),
  ADD KEY `invoice_recurring_created_by_foreign` (`created_by`),
  ADD KEY `invoice_recurring_added_by_foreign` (`added_by`),
  ADD KEY `invoice_recurring_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `invoice_recurring_bank_account_id_foreign` (`bank_account_id`);

--
-- Indexes for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recurring_items_invoice_recurring_id_foreign` (`invoice_recurring_id`),
  ADD KEY `invoice_recurring_items_unit_id_foreign` (`unit_id`),
  ADD KEY `invoice_recurring_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `invoice_recurring_item_images`
--
ALTER TABLE `invoice_recurring_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recurring_item_images_invoice_recurring_item_id_foreign` (`invoice_recurring_item_id`);

--
-- Indexes for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_company_id_foreign` (`company_id`),
  ADD KEY `issues_user_id_foreign` (`user_id`),
  ADD KEY `issues_project_id_foreign` (`project_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_bases_company_id_foreign` (`company_id`),
  ADD KEY `knowledge_bases_category_id_foreign` (`category_id`);

--
-- Indexes for table `knowledge_base_files`
--
ALTER TABLE `knowledge_base_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_base_files_company_id_foreign` (`company_id`),
  ADD KEY `knowledge_base_files_knowledge_base_id_foreign` (`knowledge_base_id`),
  ADD KEY `knowledge_base_files_added_by_foreign` (`added_by`),
  ADD KEY `knowledge_base_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `language_settings`
--
ALTER TABLE `language_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_company_id_foreign` (`company_id`),
  ADD KEY `leads_agent_id_foreign` (`agent_id`),
  ADD KEY `leads_currency_id_foreign` (`currency_id`),
  ADD KEY `leads_category_id_foreign` (`category_id`),
  ADD KEY `leads_added_by_foreign` (`added_by`),
  ADD KEY `leads_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_agents`
--
ALTER TABLE `lead_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_agents_company_id_foreign` (`company_id`),
  ADD KEY `lead_agents_user_id_foreign` (`user_id`),
  ADD KEY `lead_agents_added_by_foreign` (`added_by`),
  ADD KEY `lead_agents_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_category`
--
ALTER TABLE `lead_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_category_company_id_foreign` (`company_id`),
  ADD KEY `lead_category_added_by_foreign` (`added_by`),
  ADD KEY `lead_category_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_custom_forms_company_id_foreign` (`company_id`),
  ADD KEY `lead_custom_forms_custom_fields_id_foreign` (`custom_fields_id`),
  ADD KEY `lead_custom_forms_added_by_foreign` (`added_by`),
  ADD KEY `lead_custom_forms_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_files_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_files_user_id_foreign` (`user_id`),
  ADD KEY `lead_files_added_by_foreign` (`added_by`),
  ADD KEY `lead_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_follow_up_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_follow_up_added_by_foreign` (`added_by`),
  ADD KEY `lead_follow_up_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_notes`
--
ALTER TABLE `lead_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_notes_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_notes_member_id_foreign` (`member_id`),
  ADD KEY `lead_notes_added_by_foreign` (`added_by`),
  ADD KEY `lead_notes_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_products`
--
ALTER TABLE `lead_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_products_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_sources_type_company_id_unique` (`type`,`company_id`),
  ADD KEY `lead_sources_company_id_foreign` (`company_id`),
  ADD KEY `lead_sources_added_by_foreign` (`added_by`),
  ADD KEY `lead_sources_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_status_type_company_id_unique` (`type`,`company_id`),
  ADD KEY `lead_status_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_user_notes`
--
ALTER TABLE `lead_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_user_notes_user_id_foreign` (`user_id`),
  ADD KEY `lead_user_notes_lead_note_id_foreign` (`lead_note_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_leave_date_index` (`leave_date`),
  ADD KEY `leaves_added_by_foreign` (`added_by`),
  ADD KEY `leaves_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `leaves_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `leave_files`
--
ALTER TABLE `leave_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_files_company_id_foreign` (`company_id`),
  ADD KEY `leave_files_user_id_foreign` (`user_id`),
  ADD KEY `leave_files_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_files_added_by_foreign` (`added_by`),
  ADD KEY `leave_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `leave_settings`
--
ALTER TABLE `leave_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `log_time_for`
--
ALTER TABLE `log_time_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_time_for_company_id_foreign` (`company_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_settings`
--
ALTER TABLE `menu_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_settings`
--
ALTER TABLE `message_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_settings_company_id_foreign` (`company_id`);

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
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mollie_invoices_company_id_foreign` (`company_id`),
  ADD KEY `mollie_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mollie_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_company_id_foreign` (`company_id`),
  ADD KEY `notices_department_id_foreign` (`department_id`),
  ADD KEY `notices_added_by_foreign` (`added_by`),
  ADD KEY `notices_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `notice_views`
--
ALTER TABLE `notice_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_views_company_id_foreign` (`company_id`),
  ADD KEY `notice_views_notice_id_foreign` (`notice_id`),
  ADD KEY `notice_views_user_id_foreign` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_invoices_company_id_foreign` (`company_id`),
  ADD KEY `offline_invoices_package_id_foreign` (`package_id`),
  ADD KEY `offline_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_plan_changes_company_id_foreign` (`company_id`),
  ADD KEY `offline_plan_changes_package_id_foreign` (`package_id`),
  ADD KEY `offline_plan_changes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_plan_changes_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_company_id_foreign` (`company_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_currency_id_foreign` (`currency_id`),
  ADD KEY `orders_added_by_foreign` (`added_by`),
  ADD KEY `orders_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `orders_company_address_id_foreign` (`company_address_id`);

--
-- Indexes for table `order_carts`
--
ALTER TABLE `order_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_carts_product_id_foreign` (`product_id`),
  ADD KEY `order_carts_client_id_foreign` (`client_id`),
  ADD KEY `order_carts_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `order_item_images`
--
ALTER TABLE `order_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_images_order_item_id_index` (`order_item_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_settings`
--
ALTER TABLE `package_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passport_details`
--
ALTER TABLE `passport_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passport_details_company_id_foreign` (`company_id`),
  ADD KEY `passport_details_user_id_foreign` (`user_id`),
  ADD KEY `passport_details_added_by_foreign` (`added_by`),
  ADD KEY `passport_details_country_id_foreign` (`country_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_invoices_company_id_foreign` (`company_id`),
  ADD KEY `payfast_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_plan_id_unique` (`plan_id`),
  ADD UNIQUE KEY `payments_event_id_company_id_unique` (`event_id`,`company_id`),
  ADD UNIQUE KEY `payments_transaction_id_company_id_unique` (`transaction_id`,`company_id`),
  ADD KEY `payments_company_id_foreign` (`company_id`),
  ADD KEY `payments_project_id_foreign` (`project_id`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_credit_notes_id_foreign` (`credit_notes_id`),
  ADD KEY `payments_currency_id_foreign` (`currency_id`),
  ADD KEY `payments_paid_on_index` (`paid_on`),
  ADD KEY `payments_offline_method_id_foreign` (`offline_method_id`),
  ADD KEY `payments_added_by_foreign` (`added_by`),
  ADD KEY `payments_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `payments_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `payments_default_currency_id_foreign` (`default_currency_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_company_id_foreign` (`company_id`);

--
-- Indexes for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paypal_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `paypal_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paystack_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_module_id_unique` (`name`,`module_id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_type_id_foreign` (`permission_type_id`);

--
-- Indexes for table `permission_types`
--
ALTER TABLE `permission_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinned`
--
ALTER TABLE `pinned`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pinned_company_id_foreign` (`company_id`),
  ADD KEY `pinned_project_id_foreign` (`project_id`),
  ADD KEY `pinned_task_id_foreign` (`task_id`),
  ADD KEY `pinned_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_company_id_foreign` (`company_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_added_by_foreign` (`added_by`),
  ADD KEY `products_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `product_files`
--
ALTER TABLE `product_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_files_product_id_foreign` (`product_id`),
  ADD KEY `product_files_added_by_foreign` (`added_by`),
  ADD KEY `product_files_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `product_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_category_company_id_foreign` (`company_id`),
  ADD KEY `product_sub_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_company_id_foreign` (`company_id`),
  ADD KEY `projects_project_admin_foreign` (`project_admin`),
  ADD KEY `projects_category_id_foreign` (`category_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_team_id_foreign` (`team_id`),
  ADD KEY `projects_currency_id_foreign` (`currency_id`),
  ADD KEY `projects_added_by_foreign` (`added_by`),
  ADD KEY `projects_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `projects_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_activity_project_id_foreign` (`project_id`),
  ADD KEY `project_activity_created_at_index` (`created_at`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_category_company_id_foreign` (`company_id`),
  ADD KEY `project_category_added_by_foreign` (`added_by`),
  ADD KEY `project_category_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_files_company_id_foreign` (`company_id`),
  ADD KEY `project_files_user_id_foreign` (`user_id`),
  ADD KEY `project_files_project_id_foreign` (`project_id`),
  ADD KEY `project_files_added_by_foreign` (`added_by`),
  ADD KEY `project_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_members_user_id_foreign` (`user_id`),
  ADD KEY `project_members_project_id_foreign` (`project_id`),
  ADD KEY `project_members_added_by_foreign` (`added_by`),
  ADD KEY `project_members_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_milestones_project_id_foreign` (`project_id`),
  ADD KEY `project_milestones_currency_id_foreign` (`currency_id`),
  ADD KEY `project_milestones_added_by_foreign` (`added_by`),
  ADD KEY `project_milestones_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_notes`
--
ALTER TABLE `project_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_notes_project_id_foreign` (`project_id`),
  ADD KEY `project_notes_client_id_foreign` (`client_id`),
  ADD KEY `project_notes_added_by_foreign` (`added_by`),
  ADD KEY `project_notes_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_ratings`
--
ALTER TABLE `project_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_ratings_project_id_foreign` (`project_id`),
  ADD KEY `project_ratings_user_id_foreign` (`user_id`),
  ADD KEY `project_ratings_added_by_foreign` (`added_by`),
  ADD KEY `project_ratings_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_settings`
--
ALTER TABLE `project_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_status_settings`
--
ALTER TABLE `project_status_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_status_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_templates_company_id_foreign` (`company_id`),
  ADD KEY `project_templates_category_id_foreign` (`category_id`),
  ADD KEY `project_templates_client_id_foreign` (`client_id`);

--
-- Indexes for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_members_user_id_foreign` (`user_id`),
  ADD KEY `project_template_members_project_template_id_foreign` (`project_template_id`);

--
-- Indexes for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_sub_tasks_project_template_task_id_foreign` (`project_template_task_id`);

--
-- Indexes for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_tasks_project_template_id_foreign` (`project_template_id`),
  ADD KEY `project_template_tasks_project_template_task_category_id_foreign` (`project_template_task_category_id`);

--
-- Indexes for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_task_users_project_template_task_id_foreign` (`project_template_task_id`),
  ADD KEY `project_template_task_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_time_logs_company_id_foreign` (`company_id`),
  ADD KEY `project_time_logs_project_id_foreign` (`project_id`),
  ADD KEY `project_time_logs_task_id_foreign` (`task_id`),
  ADD KEY `project_time_logs_user_id_foreign` (`user_id`),
  ADD KEY `project_time_logs_start_time_index` (`start_time`),
  ADD KEY `project_time_logs_end_time_index` (`end_time`),
  ADD KEY `project_time_logs_edited_by_user_foreign` (`edited_by_user`),
  ADD KEY `project_time_logs_approved_by_foreign` (`approved_by`),
  ADD KEY `project_time_logs_invoice_id_foreign` (`invoice_id`),
  ADD KEY `project_time_logs_added_by_foreign` (`added_by`),
  ADD KEY `project_time_logs_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_time_log_breaks`
--
ALTER TABLE `project_time_log_breaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_time_log_breaks_company_id_foreign` (`company_id`),
  ADD KEY `project_time_log_breaks_project_time_log_id_foreign` (`project_time_log_id`),
  ADD KEY `project_time_log_breaks_start_time_index` (`start_time`),
  ADD KEY `project_time_log_breaks_end_time_index` (`end_time`),
  ADD KEY `project_time_log_breaks_added_by_foreign` (`added_by`),
  ADD KEY `project_time_log_breaks_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_user_notes_user_id_foreign` (`user_id`),
  ADD KEY `project_user_notes_project_note_id_foreign` (`project_note_id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposals_company_id_foreign` (`company_id`),
  ADD KEY `proposals_lead_id_foreign` (`lead_id`),
  ADD KEY `proposals_currency_id_foreign` (`currency_id`),
  ADD KEY `proposals_added_by_foreign` (`added_by`),
  ADD KEY `proposals_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_items_proposal_id_foreign` (`proposal_id`),
  ADD KEY `proposal_items_unit_id_foreign` (`unit_id`),
  ADD KEY `proposal_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `proposal_item_images`
--
ALTER TABLE `proposal_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_item_images_proposal_item_id_foreign` (`proposal_item_id`);

--
-- Indexes for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_signs_proposal_id_foreign` (`proposal_id`);

--
-- Indexes for table `proposal_templates`
--
ALTER TABLE `proposal_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_templates_company_id_foreign` (`company_id`),
  ADD KEY `proposal_templates_currency_id_foreign` (`currency_id`),
  ADD KEY `proposal_templates_added_by_foreign` (`added_by`),
  ADD KEY `proposal_templates_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `proposal_template_items`
--
ALTER TABLE `proposal_template_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_template_items_company_id_foreign` (`company_id`),
  ADD KEY `proposal_template_items_proposal_template_id_foreign` (`proposal_template_id`),
  ADD KEY `proposal_template_items_unit_id_foreign` (`unit_id`),
  ADD KEY `proposal_template_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `proposal_template_item_images`
--
ALTER TABLE `proposal_template_item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_template_item_images_company_id_foreign` (`company_id`),
  ADD KEY `proposal_template_item_images_proposal_template_item_id_foreign` (`proposal_template_item_id`);

--
-- Indexes for table `purpose_consent`
--
ALTER TABLE `purpose_consent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose_consent_leads_lead_id_foreign` (`lead_id`),
  ADD KEY `purpose_consent_leads_purpose_consent_id_foreign` (`purpose_consent_id`),
  ADD KEY `purpose_consent_leads_updated_by_id_foreign` (`updated_by_id`);

--
-- Indexes for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose_consent_users_client_id_foreign` (`client_id`),
  ADD KEY `purpose_consent_users_purpose_consent_id_foreign` (`purpose_consent_id`),
  ADD KEY `purpose_consent_users_updated_by_id_foreign` (`updated_by_id`);

--
-- Indexes for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_company_id_unique` (`endpoint`,`company_id`),
  ADD KEY `push_subscriptions_company_id_foreign` (`company_id`),
  ADD KEY `push_subscriptions_user_id_index` (`user_id`);

--
-- Indexes for table `quick_books_settings`
--
ALTER TABLE `quick_books_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quick_books_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_company_id_foreign` (`company_id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_items_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razorpay_invoices_company_id_foreign` (`company_id`),
  ADD KEY `razorpay_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `removal_requests`
--
ALTER TABLE `removal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removal_requests_company_id_foreign` (`company_id`),
  ADD KEY `removal_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removal_requests_lead_company_id_foreign` (`company_id`),
  ADD KEY `removal_requests_lead_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_company_id_unique` (`name`,`company_id`),
  ADD KEY `roles_company_id_foreign` (`company_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `seo_details`
--
ALTER TABLE `seo_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign_up_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_company_id_foreign` (`company_id`);

--
-- Indexes for table `slack_settings`
--
ALTER TABLE `slack_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slack_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sticky_notes_company_id_foreign` (`company_id`),
  ADD KEY `sticky_notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_company_id_foreign` (`company_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_tasks_task_id_foreign` (`task_id`),
  ADD KEY `sub_tasks_assigned_to_foreign` (`assigned_to`),
  ADD KEY `sub_tasks_added_by_foreign` (`added_by`),
  ADD KEY `sub_tasks_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_task_files_user_id_foreign` (`user_id`),
  ADD KEY `sub_task_files_sub_task_id_foreign` (`sub_task_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_company_id_foreign` (`company_id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`),
  ADD KEY `support_tickets_created_by_foreign` (`created_by`),
  ADD KEY `support_tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `support_tickets_support_ticket_type_id_foreign` (`support_ticket_type_id`);

--
-- Indexes for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_files_user_id_foreign` (`user_id`),
  ADD KEY `support_ticket_files_support_ticket_reply_id_foreign` (`support_ticket_reply_id`);

--
-- Indexes for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_replies_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `support_ticket_types_type_unique` (`type`);

--
-- Indexes for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taskboard_columns_column_name_company_id_unique` (`column_name`,`company_id`),
  ADD KEY `taskboard_columns_company_id_foreign` (`company_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_company_id_foreign` (`company_id`),
  ADD KEY `tasks_due_date_index` (`due_date`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_task_category_id_foreign` (`task_category_id`),
  ADD KEY `tasks_board_column_id_foreign` (`board_column_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`),
  ADD KEY `tasks_recurring_task_id_foreign` (`recurring_task_id`),
  ADD KEY `tasks_dependent_task_id_foreign` (`dependent_task_id`),
  ADD KEY `tasks_milestone_id_foreign` (`milestone_id`),
  ADD KEY `tasks_added_by_foreign` (`added_by`),
  ADD KEY `tasks_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `tasks_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `task_category`
--
ALTER TABLE `task_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_category_company_id_foreign` (`company_id`),
  ADD KEY `task_category_added_by_foreign` (`added_by`),
  ADD KEY `task_category_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_user_id_foreign` (`user_id`),
  ADD KEY `task_comments_task_id_foreign` (`task_id`),
  ADD KEY `task_comments_added_by_foreign` (`added_by`),
  ADD KEY `task_comments_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `task_comment_emoji`
--
ALTER TABLE `task_comment_emoji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comment_emoji_user_id_foreign` (`user_id`),
  ADD KEY `task_comment_emoji_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_files_user_id_foreign` (`user_id`),
  ADD KEY `task_files_task_id_foreign` (`task_id`),
  ADD KEY `task_files_added_by_foreign` (`added_by`),
  ADD KEY `task_files_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_history_task_id_foreign` (`task_id`),
  ADD KEY `task_history_sub_task_id_foreign` (`sub_task_id`),
  ADD KEY `task_history_user_id_foreign` (`user_id`),
  ADD KEY `task_history_board_column_id_foreign` (`board_column_id`);

--
-- Indexes for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_labels_label_id_foreign` (`label_id`),
  ADD KEY `task_tags_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_label_list`
--
ALTER TABLE `task_label_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_label_list_company_id_foreign` (`company_id`),
  ADD KEY `task_label_list_project_id_foreign` (`project_id`);

--
-- Indexes for table `task_notes`
--
ALTER TABLE `task_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_notes_task_id_foreign` (`task_id`),
  ADD KEY `task_notes_added_by_foreign` (`added_by`),
  ADD KEY `task_notes_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `task_settings`
--
ALTER TABLE `task_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `task_users`
--
ALTER TABLE `task_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_users_task_id_foreign` (`task_id`),
  ADD KEY `task_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_foreign` (`company_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_company_id_foreign` (`company_id`),
  ADD KEY `teams_added_by_foreign` (`added_by`),
  ADD KEY `teams_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_company_id_foreign` (`company_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_channel_id_foreign` (`channel_id`),
  ADD KEY `tickets_type_id_foreign` (`type_id`),
  ADD KEY `tickets_country_id_foreign` (`country_id`),
  ADD KEY `tickets_added_by_foreign` (`added_by`),
  ADD KEY `tickets_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `tickets_updated_at_index` (`updated_at`),
  ADD KEY `tickets_group_id_foreign` (`group_id`);

--
-- Indexes for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_agent_groups_company_id_foreign` (`company_id`),
  ADD KEY `ticket_agent_groups_agent_id_foreign` (`agent_id`),
  ADD KEY `ticket_agent_groups_group_id_foreign` (`group_id`),
  ADD KEY `ticket_agent_groups_added_by_foreign` (`added_by`),
  ADD KEY `ticket_agent_groups_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_channels_channel_name_company_id_unique` (`channel_name`,`company_id`),
  ADD KEY `ticket_channels_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_custom_forms_company_id_foreign` (`company_id`),
  ADD KEY `ticket_custom_forms_custom_fields_id_foreign` (`custom_fields_id`);

--
-- Indexes for table `ticket_email_settings`
--
ALTER TABLE `ticket_email_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_email_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_files_user_id_foreign` (`user_id`),
  ADD KEY `ticket_files_ticket_reply_id_foreign` (`ticket_reply_id`);

--
-- Indexes for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_reply_templates_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_tags_company_id_foreign` (`company_id`),
  ADD KEY `ticket_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `ticket_tags_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_tag_list_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_types_type_company_id_unique` (`type`,`company_id`),
  ADD KEY `ticket_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `translate_settings`
--
ALTER TABLE `translate_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tr_front_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `universal_search`
--
ALTER TABLE `universal_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universal_search_company_id_foreign` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_company_id_unique` (`email`,`company_id`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_user_auth_id_foreign` (`user_auth_id`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_company_id_foreign` (`company_id`),
  ADD KEY `users_chat_user_one_foreign` (`user_one`),
  ADD KEY `users_chat_user_id_foreign` (`user_id`),
  ADD KEY `users_chat_from_foreign` (`from`),
  ADD KEY `users_chat_to_foreign` (`to`);

--
-- Indexes for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_files_company_id_foreign` (`company_id`),
  ADD KEY `users_chat_files_user_id_foreign` (`user_id`),
  ADD KEY `users_chat_files_users_chat_id_foreign` (`users_chat_id`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activities_company_id_foreign` (`company_id`),
  ADD KEY `user_activities_user_id_foreign` (`user_id`),
  ADD KEY `user_activities_created_at_index` (`created_at`);

--
-- Indexes for table `user_auths`
--
ALTER TABLE `user_auths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_auths_email_unique` (`email`),
  ADD KEY `user_auths_email_index` (`email`);

--
-- Indexes for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_invitations_company_id_foreign` (`company_id`),
  ADD KEY `user_invitations_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_leadboard_settings`
--
ALTER TABLE `user_leadboard_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_leadboard_settings_company_id_foreign` (`company_id`),
  ADD KEY `user_leadboard_settings_user_id_foreign` (`user_id`),
  ADD KEY `user_leadboard_settings_board_column_id_foreign` (`board_column_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_permissions_user_id_foreign` (`user_id`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_permissions_permission_type_id_foreign` (`permission_type_id`);

--
-- Indexes for table `user_taskboard_settings`
--
ALTER TABLE `user_taskboard_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_taskboard_settings_company_id_foreign` (`company_id`),
  ADD KEY `user_taskboard_settings_user_id_foreign` (`user_id`),
  ADD KEY `user_taskboard_settings_board_column_id_foreign` (`board_column_id`);

--
-- Indexes for table `visa_details`
--
ALTER TABLE `visa_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visa_details_company_id_foreign` (`company_id`),
  ADD KEY `visa_details_user_id_foreign` (`user_id`),
  ADD KEY `visa_details_added_by_foreign` (`added_by`),
  ADD KEY `visa_details_country_id_foreign` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appreciations`
--
ALTER TABLE `appreciations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_icons`
--
ALTER TABLE `award_icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_details`
--
ALTER TABLE `client_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_docs`
--
ALTER TABLE `client_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_notes`
--
ALTER TABLE `client_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_addresses`
--
ALTER TABLE `company_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_files`
--
ALTER TABLE `contract_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_renews`
--
ALTER TABLE `contract_renews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_signs`
--
ALTER TABLE `contract_signs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_templates`
--
ALTER TABLE `contract_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_note_item_images`
--
ALTER TABLE `credit_note_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `custom_link_settings`
--
ALTER TABLE `custom_link_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_backup_cron_settings`
--
ALTER TABLE `database_backup_cron_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discussion_files`
--
ALTER TABLE `discussion_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_docs`
--
ALTER TABLE `employee_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_shift_change_requests`
--
ALTER TABLE `employee_shift_change_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_shift_schedules`
--
ALTER TABLE `employee_shift_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_teams`
--
ALTER TABLE `employee_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_item_images`
--
ALTER TABLE `estimate_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_templates`
--
ALTER TABLE `estimate_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_template_items`
--
ALTER TABLE `estimate_template_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_template_item_images`
--
ALTER TABLE `estimate_template_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_attendees`
--
ALTER TABLE `event_attendees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_files`
--
ALTER TABLE `event_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_category`
--
ALTER TABLE `expenses_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_files`
--
ALTER TABLE `faq_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `file_storage`
--
ALTER TABLE `file_storage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `footer_menu`
--
ALTER TABLE `footer_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_clients`
--
ALTER TABLE `front_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_details`
--
ALTER TABLE `front_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_faqs`
--
ALTER TABLE `front_faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_features`
--
ALTER TABLE `front_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_widgets`
--
ALTER TABLE `front_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gdpr_settings`
--
ALTER TABLE `gdpr_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_currencies`
--
ALTER TABLE `global_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `global_invoices`
--
ALTER TABLE `global_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_invoice_settings`
--
ALTER TABLE `global_invoice_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_payment_gateway_credentials`
--
ALTER TABLE `global_payment_gateway_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_item_images`
--
ALTER TABLE `invoice_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring_item_images`
--
ALTER TABLE `invoice_recurring_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_base_files`
--
ALTER TABLE `knowledge_base_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_settings`
--
ALTER TABLE `language_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_agents`
--
ALTER TABLE `lead_agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_category`
--
ALTER TABLE `lead_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `lead_files`
--
ALTER TABLE `lead_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_notes`
--
ALTER TABLE `lead_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_products`
--
ALTER TABLE `lead_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lead_status`
--
ALTER TABLE `lead_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lead_user_notes`
--
ALTER TABLE `lead_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_files`
--
ALTER TABLE `leave_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_settings`
--
ALTER TABLE `leave_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `log_time_for`
--
ALTER TABLE `log_time_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_settings`
--
ALTER TABLE `menu_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_settings`
--
ALTER TABLE `message_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_views`
--
ALTER TABLE `notice_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_carts`
--
ALTER TABLE `order_carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item_images`
--
ALTER TABLE `order_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package_settings`
--
ALTER TABLE `package_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `passport_details`
--
ALTER TABLE `passport_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `permission_types`
--
ALTER TABLE `permission_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pinned`
--
ALTER TABLE `pinned`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_files`
--
ALTER TABLE `product_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_activity`
--
ALTER TABLE `project_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_notes`
--
ALTER TABLE `project_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_ratings`
--
ALTER TABLE `project_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_settings`
--
ALTER TABLE `project_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_status_settings`
--
ALTER TABLE `project_status_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_templates`
--
ALTER TABLE `project_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_members`
--
ALTER TABLE `project_template_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_time_log_breaks`
--
ALTER TABLE `project_time_log_breaks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_items`
--
ALTER TABLE `proposal_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_item_images`
--
ALTER TABLE `proposal_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_templates`
--
ALTER TABLE `proposal_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_template_items`
--
ALTER TABLE `proposal_template_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_template_item_images`
--
ALTER TABLE `proposal_template_item_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent`
--
ALTER TABLE `purpose_consent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quick_books_settings`
--
ALTER TABLE `quick_books_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removal_requests`
--
ALTER TABLE `removal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seo_details`
--
ALTER TABLE `seo_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slack_settings`
--
ALTER TABLE `slack_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_category`
--
ALTER TABLE `task_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comment_emoji`
--
ALTER TABLE `task_comment_emoji`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_labels`
--
ALTER TABLE `task_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_label_list`
--
ALTER TABLE `task_label_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_notes`
--
ALTER TABLE `task_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_settings`
--
ALTER TABLE `task_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task_users`
--
ALTER TABLE `task_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ticket_email_settings`
--
ALTER TABLE `ticket_email_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_files`
--
ALTER TABLE `ticket_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `translate_settings`
--
ALTER TABLE `translate_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit_types`
--
ALTER TABLE `unit_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universal_search`
--
ALTER TABLE `universal_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_chat`
--
ALTER TABLE `users_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_auths`
--
ALTER TABLE `user_auths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_invitations`
--
ALTER TABLE `user_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_leadboard_settings`
--
ALTER TABLE `user_leadboard_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1181;

--
-- AUTO_INCREMENT for table `user_taskboard_settings`
--
ALTER TABLE `user_taskboard_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visa_details`
--
ALTER TABLE `visa_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  ADD CONSTRAINT `accept_estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accept_estimates_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appreciations`
--
ALTER TABLE `appreciations`
  ADD CONSTRAINT `appreciations_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appreciations_award_id_foreign` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appreciations_award_to_foreign` FOREIGN KEY (`award_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appreciations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_employee_shift_id_foreign` FOREIGN KEY (`employee_shift_id`) REFERENCES `employee_shifts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `company_addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD CONSTRAINT `attendance_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_settings_default_employee_shift_foreign` FOREIGN KEY (`default_employee_shift`) REFERENCES `employee_shifts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  ADD CONSTRAINT `authorize_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authorize_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  ADD CONSTRAINT `authorize_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authorize_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_award_icon_id_foreign` FOREIGN KEY (`award_icon_id`) REFERENCES `award_icons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_accounts_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD CONSTRAINT `bank_transactions_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transactions_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD CONSTRAINT `client_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contacts_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_details`
--
ALTER TABLE `client_details`
  ADD CONSTRAINT `client_details_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `client_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `client_sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_docs`
--
ALTER TABLE `client_docs`
  ADD CONSTRAINT `client_docs_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_docs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_docs_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_notes`
--
ALTER TABLE `client_notes`
  ADD CONSTRAINT `client_notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_notes_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_notes_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  ADD CONSTRAINT `client_sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `client_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_sub_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  ADD CONSTRAINT `client_user_notes_client_note_id_foreign` FOREIGN KEY (`client_note_id`) REFERENCES `client_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_user_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_default_task_status_foreign` FOREIGN KEY (`default_task_status`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `companies_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `company_addresses`
--
ALTER TABLE `company_addresses`
  ADD CONSTRAINT `company_addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  ADD CONSTRAINT `contract_discussions_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contract_files`
--
ALTER TABLE `contract_files`
  ADD CONSTRAINT `contract_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_renews`
--
ALTER TABLE `contract_renews`
  ADD CONSTRAINT `contract_renews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_renewed_by_foreign` FOREIGN KEY (`renewed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_signs`
--
ALTER TABLE `contract_signs`
  ADD CONSTRAINT `contract_signs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_signs_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_templates`
--
ALTER TABLE `contract_templates`
  ADD CONSTRAINT `contract_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_templates_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_templates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD CONSTRAINT `contract_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD CONSTRAINT `conversation_reply_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_reply_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_reply_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD CONSTRAINT `credit_notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD CONSTRAINT `credit_note_items_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_note_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_note_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `credit_note_item_images`
--
ALTER TABLE `credit_note_item_images`
  ADD CONSTRAINT `credit_note_item_images_credit_note_item_id_foreign` FOREIGN KEY (`credit_note_item_id`) REFERENCES `credit_note_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  ADD CONSTRAINT `currency_format_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD CONSTRAINT `custom_fields_data_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD CONSTRAINT `custom_field_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_link_settings`
--
ALTER TABLE `custom_link_settings`
  ADD CONSTRAINT `custom_link_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD CONSTRAINT `dashboard_widgets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `designations_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_best_answer_id_foreign` FOREIGN KEY (`best_answer_id`) REFERENCES `discussion_replies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_discussion_category_id_foreign` FOREIGN KEY (`discussion_category_id`) REFERENCES `discussion_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_last_reply_by_id_foreign` FOREIGN KEY (`last_reply_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  ADD CONSTRAINT `discussion_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_files`
--
ALTER TABLE `discussion_files`
  ADD CONSTRAINT `discussion_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_discussion_reply_id_foreign` FOREIGN KEY (`discussion_reply_id`) REFERENCES `discussion_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD CONSTRAINT `discussion_replies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_replies_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  ADD CONSTRAINT `email_notification_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD CONSTRAINT `emergency_contacts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `emergency_contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emergency_contacts_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `emergency_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_reporting_to_foreign` FOREIGN KEY (`reporting_to`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD CONSTRAINT `employee_docs_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_docs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_docs_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  ADD CONSTRAINT `employee_leave_quotas_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_leave_quotas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD CONSTRAINT `employee_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_shift_change_requests`
--
ALTER TABLE `employee_shift_change_requests`
  ADD CONSTRAINT `employee_shift_change_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_shift_change_requests_employee_shift_id_foreign` FOREIGN KEY (`employee_shift_id`) REFERENCES `employee_shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_shift_change_requests_shift_schedule_id_foreign` FOREIGN KEY (`shift_schedule_id`) REFERENCES `employee_shift_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_shift_schedules`
--
ALTER TABLE `employee_shift_schedules`
  ADD CONSTRAINT `employee_shift_schedules_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_shift_schedules_employee_shift_id_foreign` FOREIGN KEY (`employee_shift_id`) REFERENCES `employee_shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_shift_schedules_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_shift_schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `employee_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_skills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD CONSTRAINT `employee_teams_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `estimate_item_images`
--
ALTER TABLE `estimate_item_images`
  ADD CONSTRAINT `estimate_item_images_estimate_item_id_foreign` FOREIGN KEY (`estimate_item_id`) REFERENCES `estimate_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimate_templates`
--
ALTER TABLE `estimate_templates`
  ADD CONSTRAINT `estimate_templates_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_templates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_templates_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `estimate_template_items`
--
ALTER TABLE `estimate_template_items`
  ADD CONSTRAINT `estimate_template_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_template_items_estimate_template_id_foreign` FOREIGN KEY (`estimate_template_id`) REFERENCES `estimate_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_template_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_template_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `estimate_template_item_images`
--
ALTER TABLE `estimate_template_item_images`
  ADD CONSTRAINT `estimate_template_item_images_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimate_template_item_images_estimate_template_item_id_foreign` FOREIGN KEY (`estimate_template_item_id`) REFERENCES `estimate_template_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD CONSTRAINT `event_attendees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_attendees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_attendees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_files`
--
ALTER TABLE `event_files`
  ADD CONSTRAINT `event_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `event_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_files_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_default_currency_id_foreign` FOREIGN KEY (`default_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_expenses_recurring_id_foreign` FOREIGN KEY (`expenses_recurring_id`) REFERENCES `expenses_recurring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD CONSTRAINT `expenses_category_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  ADD CONSTRAINT `expenses_category_roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_roles_expenses_category_id_foreign` FOREIGN KEY (`expenses_category_id`) REFERENCES `expenses_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  ADD CONSTRAINT `expenses_recurring_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_files`
--
ALTER TABLE `faq_files`
  ADD CONSTRAINT `faq_files_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faq_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_front_feature_id_foreign` FOREIGN KEY (`front_feature_id`) REFERENCES `front_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD CONSTRAINT `file_storage_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD CONSTRAINT `footer_menu_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_clients`
--
ALTER TABLE `front_clients`
  ADD CONSTRAINT `front_clients_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD CONSTRAINT `front_faqs_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_features`
--
ALTER TABLE `front_features`
  ADD CONSTRAINT `front_features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  ADD CONSTRAINT `front_menu_buttons_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD CONSTRAINT `global_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_global_subscription_id_foreign` FOREIGN KEY (`global_subscription_id`) REFERENCES `global_subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD CONSTRAINT `global_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `global_settings_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD CONSTRAINT `global_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  ADD CONSTRAINT `google_calendar_modules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `holidays_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_company_address_id_foreign` FOREIGN KEY (`company_address_id`) REFERENCES `company_addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_default_currency_id_foreign` FOREIGN KEY (`default_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_invoice_recurring_id_foreign` FOREIGN KEY (`invoice_recurring_id`) REFERENCES `invoice_recurring` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice_item_images`
--
ALTER TABLE `invoice_item_images`
  ADD CONSTRAINT `invoice_item_images_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  ADD CONSTRAINT `invoice_recurring_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  ADD CONSTRAINT `invoice_recurring_items_invoice_recurring_id_foreign` FOREIGN KEY (`invoice_recurring_id`) REFERENCES `invoice_recurring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice_recurring_item_images`
--
ALTER TABLE `invoice_recurring_item_images`
  ADD CONSTRAINT `invoice_recurring_item_images_invoice_recurring_item_id_foreign` FOREIGN KEY (`invoice_recurring_item_id`) REFERENCES `invoice_recurring_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD CONSTRAINT `invoice_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issues_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  ADD CONSTRAINT `knowledge_bases_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `knowledge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `knowledge_bases_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `knowledge_base_files`
--
ALTER TABLE `knowledge_base_files`
  ADD CONSTRAINT `knowledge_base_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `knowledge_base_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `knowledge_base_files_knowledge_base_id_foreign` FOREIGN KEY (`knowledge_base_id`) REFERENCES `knowledge_bases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `knowledge_base_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  ADD CONSTRAINT `knowledge_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `lead_agents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `lead_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_agents`
--
ALTER TABLE `lead_agents`
  ADD CONSTRAINT `lead_agents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_agents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_agents_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_agents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_category`
--
ALTER TABLE `lead_category`
  ADD CONSTRAINT `lead_category_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_category_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  ADD CONSTRAINT `lead_custom_forms_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_custom_forms_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_custom_forms_custom_fields_id_foreign` FOREIGN KEY (`custom_fields_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_custom_forms_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD CONSTRAINT `lead_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD CONSTRAINT `lead_follow_up_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_follow_up_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_follow_up_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_notes`
--
ALTER TABLE `lead_notes`
  ADD CONSTRAINT `lead_notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_notes_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_notes_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_notes_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_products`
--
ALTER TABLE `lead_products`
  ADD CONSTRAINT `lead_products_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD CONSTRAINT `lead_sources_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_sources_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_sources_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD CONSTRAINT `lead_status_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_user_notes`
--
ALTER TABLE `lead_user_notes`
  ADD CONSTRAINT `lead_user_notes_lead_note_id_foreign` FOREIGN KEY (`lead_note_id`) REFERENCES `lead_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_files`
--
ALTER TABLE `leave_files`
  ADD CONSTRAINT `leave_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_files_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_settings`
--
ALTER TABLE `leave_settings`
  ADD CONSTRAINT `leave_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_time_for`
--
ALTER TABLE `log_time_for`
  ADD CONSTRAINT `log_time_for_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_settings`
--
ALTER TABLE `message_settings`
  ADD CONSTRAINT `message_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD CONSTRAINT `module_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  ADD CONSTRAINT `mollie_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mollie_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  ADD CONSTRAINT `mollie_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `notices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notices_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notices_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notice_views`
--
ALTER TABLE `notice_views`
  ADD CONSTRAINT `notice_views_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_views_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD CONSTRAINT `offline_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD CONSTRAINT `offline_payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD CONSTRAINT `offline_plan_changes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `offline_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_company_address_id_foreign` FOREIGN KEY (`company_address_id`) REFERENCES `company_addresses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_carts`
--
ALTER TABLE `order_carts`
  ADD CONSTRAINT `order_carts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_carts_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_item_images`
--
ALTER TABLE `order_item_images`
  ADD CONSTRAINT `order_item_images_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `passport_details`
--
ALTER TABLE `passport_details`
  ADD CONSTRAINT `passport_details_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `passport_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passport_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passport_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  ADD CONSTRAINT `payfast_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payfast_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  ADD CONSTRAINT `payfast_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_credit_notes_id_foreign` FOREIGN KEY (`credit_notes_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_default_currency_id_foreign` FOREIGN KEY (`default_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD CONSTRAINT `payment_gateway_credentials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD CONSTRAINT `paypal_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paypal_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paypal_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  ADD CONSTRAINT `paystack_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paystack_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  ADD CONSTRAINT `paystack_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_permission_type_id_foreign` FOREIGN KEY (`permission_type_id`) REFERENCES `permission_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinned`
--
ALTER TABLE `pinned`
  ADD CONSTRAINT `pinned_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_files`
--
ALTER TABLE `product_files`
  ADD CONSTRAINT `product_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_files_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD CONSTRAINT `product_sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sub_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_project_admin_foreign` FOREIGN KEY (`project_admin`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_category`
--
ALTER TABLE `project_category`
  ADD CONSTRAINT `project_category_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_category_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_notes`
--
ALTER TABLE `project_notes`
  ADD CONSTRAINT `project_notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_notes_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_ratings`
--
ALTER TABLE `project_ratings`
  ADD CONSTRAINT `project_ratings_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ratings_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ratings_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_settings`
--
ALTER TABLE `project_settings`
  ADD CONSTRAINT `project_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_status_settings`
--
ALTER TABLE `project_status_settings`
  ADD CONSTRAINT `project_status_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD CONSTRAINT `project_templates_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_templates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD CONSTRAINT `project_template_members_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  ADD CONSTRAINT `project_template_sub_tasks_project_template_task_id_foreign` FOREIGN KEY (`project_template_task_id`) REFERENCES `project_template_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD CONSTRAINT `project_template_tasks_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_tasks_project_template_task_category_id_foreign` FOREIGN KEY (`project_template_task_category_id`) REFERENCES `task_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  ADD CONSTRAINT `project_template_task_users_project_template_task_id_foreign` FOREIGN KEY (`project_template_task_id`) REFERENCES `project_template_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD CONSTRAINT `project_time_logs_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_edited_by_user_foreign` FOREIGN KEY (`edited_by_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_time_log_breaks`
--
ALTER TABLE `project_time_log_breaks`
  ADD CONSTRAINT `project_time_log_breaks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_log_breaks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_log_breaks_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_log_breaks_project_time_log_id_foreign` FOREIGN KEY (`project_time_log_id`) REFERENCES `project_time_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  ADD CONSTRAINT `project_user_notes_project_note_id_foreign` FOREIGN KEY (`project_note_id`) REFERENCES `project_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `proposals_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD CONSTRAINT `proposal_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_items_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proposal_item_images`
--
ALTER TABLE `proposal_item_images`
  ADD CONSTRAINT `proposal_item_images_proposal_item_id_foreign` FOREIGN KEY (`proposal_item_id`) REFERENCES `proposal_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  ADD CONSTRAINT `proposal_signs_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_templates`
--
ALTER TABLE `proposal_templates`
  ADD CONSTRAINT `proposal_templates_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_templates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_templates_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proposal_template_items`
--
ALTER TABLE `proposal_template_items`
  ADD CONSTRAINT `proposal_template_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_template_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_template_items_proposal_template_id_foreign` FOREIGN KEY (`proposal_template_id`) REFERENCES `proposal_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_template_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `unit_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proposal_template_item_images`
--
ALTER TABLE `proposal_template_item_images`
  ADD CONSTRAINT `proposal_template_item_images_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_template_item_images_proposal_template_item_id_foreign` FOREIGN KEY (`proposal_template_item_id`) REFERENCES `proposal_template_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  ADD CONSTRAINT `purpose_consent_leads_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  ADD CONSTRAINT `purpose_consent_users_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD CONSTRAINT `push_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `push_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `quick_books_settings`
--
ALTER TABLE `quick_books_settings`
  ADD CONSTRAINT `quick_books_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD CONSTRAINT `razorpay_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `razorpay_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests`
--
ALTER TABLE `removal_requests`
  ADD CONSTRAINT `removal_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  ADD CONSTRAINT `removal_requests_lead_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_requests_lead_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seo_details`
--
ALTER TABLE `seo_details`
  ADD CONSTRAINT `seo_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  ADD CONSTRAINT `sign_up_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slack_settings`
--
ALTER TABLE `slack_settings`
  ADD CONSTRAINT `slack_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD CONSTRAINT `sticky_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sticky_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD CONSTRAINT `stripe_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stripe_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD CONSTRAINT `sub_tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_tasks_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  ADD CONSTRAINT `sub_task_files_sub_task_id_foreign` FOREIGN KEY (`sub_task_id`) REFERENCES `sub_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_support_ticket_type_id_foreign` FOREIGN KEY (`support_ticket_type_id`) REFERENCES `support_ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  ADD CONSTRAINT `support_ticket_files_support_ticket_reply_id_foreign` FOREIGN KEY (`support_ticket_reply_id`) REFERENCES `support_ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  ADD CONSTRAINT `support_ticket_replies_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  ADD CONSTRAINT `taskboard_columns_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_dependent_task_id_foreign` FOREIGN KEY (`dependent_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_milestone_id_foreign` FOREIGN KEY (`milestone_id`) REFERENCES `project_milestones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_recurring_task_id_foreign` FOREIGN KEY (`recurring_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `task_category`
--
ALTER TABLE `task_category`
  ADD CONSTRAINT `task_category_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_category_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comments_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_comment_emoji`
--
ALTER TABLE `task_comment_emoji`
  ADD CONSTRAINT `task_comment_emoji_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `task_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comment_emoji_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
  ADD CONSTRAINT `task_files_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_sub_task_id_foreign` FOREIGN KEY (`sub_task_id`) REFERENCES `sub_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD CONSTRAINT `task_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `task_label_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_tags_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_label_list`
--
ALTER TABLE `task_label_list`
  ADD CONSTRAINT `task_label_list_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_label_list_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_notes`
--
ALTER TABLE `task_notes`
  ADD CONSTRAINT `task_notes_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_notes_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_notes_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_settings`
--
ALTER TABLE `task_settings`
  ADD CONSTRAINT `task_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_users`
--
ALTER TABLE `task_users`
  ADD CONSTRAINT `task_users_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `teams_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teams_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD CONSTRAINT `theme_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `ticket_channels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ticket_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD CONSTRAINT `ticket_agent_groups_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ticket_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  ADD CONSTRAINT `ticket_channels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  ADD CONSTRAINT `ticket_custom_forms_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_custom_forms_custom_fields_id_foreign` FOREIGN KEY (`custom_fields_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_email_settings`
--
ALTER TABLE `ticket_email_settings`
  ADD CONSTRAINT `ticket_email_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD CONSTRAINT `ticket_files_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  ADD CONSTRAINT `ticket_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  ADD CONSTRAINT `ticket_reply_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `ticket_tags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `ticket_tag_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_tags_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  ADD CONSTRAINT `ticket_tag_list_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD CONSTRAINT `ticket_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  ADD CONSTRAINT `tr_front_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unit_types`
--
ALTER TABLE `unit_types`
  ADD CONSTRAINT `unit_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `universal_search`
--
ALTER TABLE `universal_search`
  ADD CONSTRAINT `universal_search_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_user_auth_id_foreign` FOREIGN KEY (`user_auth_id`) REFERENCES `user_auths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD CONSTRAINT `users_chat_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_one_foreign` FOREIGN KEY (`user_one`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  ADD CONSTRAINT `users_chat_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_files_users_chat_id_foreign` FOREIGN KEY (`users_chat_id`) REFERENCES `users_chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD CONSTRAINT `user_activities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD CONSTRAINT `user_invitations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_leadboard_settings`
--
ALTER TABLE `user_leadboard_settings`
  ADD CONSTRAINT `user_leadboard_settings_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `lead_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_leadboard_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_leadboard_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_permissions_permission_type_id_foreign` FOREIGN KEY (`permission_type_id`) REFERENCES `permission_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_taskboard_settings`
--
ALTER TABLE `user_taskboard_settings`
  ADD CONSTRAINT `user_taskboard_settings_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_taskboard_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_taskboard_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visa_details`
--
ALTER TABLE `visa_details`
  ADD CONSTRAINT `visa_details_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `visa_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visa_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visa_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
