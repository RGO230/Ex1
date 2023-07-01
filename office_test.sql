-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2023 г., 20:38
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `office_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_06_28_111122_create_employees_table', 1),
(12, '2023_06_28_111123_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paid_status` enum('wait_for_payment','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'wait_for_payment',
  `hours` int NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `sum` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Clyde Adams', 'vbogisich@example.org', '2023-07-01 10:51:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hwkyE05ln8', '2023-07-01 10:51:49', '2023-07-01 10:51:49'),
(2, 'Josiane Lueilwitz', 'metz.vern@example.com', '2023-07-01 10:51:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L0dzjLd8bO', '2023-07-01 10:51:50', '2023-07-01 10:51:50'),
(3, 'Prof. Rusty Grimes DVM', 'darrell68@example.net', '2023-07-01 10:51:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iejGp9nJMD', '2023-07-01 10:51:50', '2023-07-01 10:51:50'),
(4, 'Kavon Heller', 'imarks@example.org', '2023-07-01 10:51:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'duEh8vK4VI', '2023-07-01 10:51:50', '2023-07-01 10:51:50'),
(5, 'Sigrid Weber', 'amalia23@example.com', '2023-07-01 10:52:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eUZqk11aOQ', '2023-07-01 10:52:35', '2023-07-01 10:52:35'),
(6, 'Prof. Alexandrine Trantow Sr.', 'shirley31@example.com', '2023-07-01 10:52:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qIH80hcrDr', '2023-07-01 10:52:35', '2023-07-01 10:52:35'),
(7, 'Prof. Mitchel Hauck Sr.', 'cgoodwin@example.com', '2023-07-01 10:52:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OKJI2HpfXX', '2023-07-01 10:52:36', '2023-07-01 10:52:36'),
(8, 'Prof. Jarret Pagac', 'franecki.ollie@example.org', '2023-07-01 10:52:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cdDaSrTpx4', '2023-07-01 10:52:36', '2023-07-01 10:52:36'),
(9, 'Cristian Parker', 'oconnell.brando@example.net', '2023-07-01 10:56:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Na9AdoDAeK', '2023-07-01 10:56:35', '2023-07-01 10:56:35'),
(10, 'Rosemarie Okuneva IV', 'dcrooks@example.com', '2023-07-01 10:56:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CkVzTPs0J1', '2023-07-01 10:56:38', '2023-07-01 10:56:38'),
(11, 'Marilyne Kertzmann PhD', 'birdie.flatley@example.com', '2023-07-01 10:56:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gKiQTewrgE', '2023-07-01 10:56:38', '2023-07-01 10:56:38'),
(12, 'Isaias Schoen', 'cassie.legros@example.com', '2023-07-01 10:56:39', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0RhTc5nRh0', '2023-07-01 10:56:39', '2023-07-01 10:56:39'),
(13, 'Prof. Aaron Lesch', 'osbaldo21@example.net', '2023-07-01 10:58:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'a68bjJ4vyJ', '2023-07-01 10:58:31', '2023-07-01 10:58:31'),
(14, 'Ms. Jacklyn Kassulke IV', 'royce57@example.com', '2023-07-01 10:58:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LVxyQWcAnH', '2023-07-01 10:58:31', '2023-07-01 10:58:31'),
(15, 'Willa Kuhlman', 'everardo.mitchell@example.com', '2023-07-01 10:58:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IQyrB2Q5ft', '2023-07-01 10:58:31', '2023-07-01 10:58:31'),
(16, 'Miss Henriette Bahringer II', 'ron.donnelly@example.net', '2023-07-01 10:58:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ezvtF3UHGg', '2023-07-01 10:58:31', '2023-07-01 10:58:31'),
(17, 'Delaney Labadie I', 'justice.mohr@example.com', '2023-07-01 11:01:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PILoe1fLS3', '2023-07-01 11:01:31', '2023-07-01 11:01:31'),
(18, 'Leora Hahn MD', 'magdalena67@example.net', '2023-07-01 11:01:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jHnnUdOJoJ', '2023-07-01 11:01:31', '2023-07-01 11:01:31'),
(19, 'Sister Glover', 'garland51@example.com', '2023-07-01 11:01:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eT9Wca36uZ', '2023-07-01 11:01:32', '2023-07-01 11:01:32'),
(20, 'Dale Douglas PhD', 'keira.greenfelder@example.net', '2023-07-01 11:01:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'O5veMCPF8G', '2023-07-01 11:01:32', '2023-07-01 11:01:32'),
(21, 'Edgardo Ullrich', 'dane00@example.org', '2023-07-01 11:10:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thZqfGW5zg', '2023-07-01 11:10:20', '2023-07-01 11:10:20'),
(22, 'Brycen Auer', 'judson78@example.com', '2023-07-01 11:10:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eKfqBLbDnQ', '2023-07-01 11:10:20', '2023-07-01 11:10:20'),
(23, 'Dessie Pouros', 'uwill@example.net', '2023-07-01 11:10:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yIZHBNBvPJ', '2023-07-01 11:10:20', '2023-07-01 11:10:20'),
(24, 'Benton Haley', 'pjohns@example.net', '2023-07-01 11:10:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nZNTNCXD30', '2023-07-01 11:10:20', '2023-07-01 11:10:20'),
(25, 'Dr. Deshawn Batz MD', 'filiberto22@example.com', '2023-07-01 11:24:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lHpuncfk5I', '2023-07-01 11:24:26', '2023-07-01 11:24:26'),
(26, 'Ms. Jaquelin Crooks Sr.', 'lpurdy@example.net', '2023-07-01 11:24:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fNJGij2NCJ', '2023-07-01 11:24:27', '2023-07-01 11:24:27'),
(27, 'Reynold Schmidt', 'americo.bergstrom@example.com', '2023-07-01 11:24:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eIiHTikQ6P', '2023-07-01 11:24:27', '2023-07-01 11:24:27'),
(28, 'Brigitte Fadel', 'hans56@example.net', '2023-07-01 12:58:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6OaOMyr8Zg', '2023-07-01 12:58:26', '2023-07-01 12:58:26'),
(29, 'Krystina Ledner', 'marty.king@example.net', '2023-07-01 12:58:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TYmYTJGKbw', '2023-07-01 12:58:26', '2023-07-01 12:58:26'),
(30, 'Pinkie Johnston DDS', 'wmitchell@example.net', '2023-07-01 12:58:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dSeBOz482W', '2023-07-01 12:58:26', '2023-07-01 12:58:26'),
(31, 'Jason Leannon', 'ahackett@example.net', '2023-07-01 13:07:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'srEmJGTy25', '2023-07-01 13:07:13', '2023-07-01 13:07:13'),
(32, 'Derick Kemmer Sr.', 'jaron.krajcik@example.com', '2023-07-01 13:07:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Not6Pb8zwv', '2023-07-01 13:07:14', '2023-07-01 13:07:14'),
(33, 'Dr. Irma Yundt', 'tanya.buckridge@example.net', '2023-07-01 13:07:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Yh1qt4nfQ5', '2023-07-01 13:07:14', '2023-07-01 13:07:14'),
(34, 'Prof. Brielle Haley', 'grayson.toy@example.com', '2023-07-01 13:10:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mQfU39uuDp', '2023-07-01 13:10:42', '2023-07-01 13:10:42'),
(35, 'Ms. Madeline Blanda MD', 'guillermo.waters@example.net', '2023-07-01 13:10:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pSi81a5Tg2', '2023-07-01 13:10:42', '2023-07-01 13:10:42'),
(36, 'Kasandra Kub', 'carissa81@example.com', '2023-07-01 13:10:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jGSZlpAaLk', '2023-07-01 13:10:42', '2023-07-01 13:10:42'),
(37, 'Viola Casper Jr.', 'moore.hulda@example.net', '2023-07-01 13:10:43', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BF0cmxhUiM', '2023-07-01 13:10:43', '2023-07-01 13:10:43'),
(38, 'Johanna Moore', 'radams@example.org', '2023-07-01 13:11:28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'F50Nm4ozKg', '2023-07-01 13:11:28', '2023-07-01 13:11:28'),
(39, 'Mr. Clovis Gutmann', 'heaney.selina@example.com', '2023-07-01 13:11:28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '57tC8mW1uN', '2023-07-01 13:11:28', '2023-07-01 13:11:28'),
(40, 'Leann Roob', 'connelly.kole@example.net', '2023-07-01 13:11:28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YwjEEJC7OK', '2023-07-01 13:11:28', '2023-07-01 13:11:28'),
(41, 'Immanuel Ullrich V', 'hane.loma@example.org', '2023-07-01 13:11:28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QyceIjF9YS', '2023-07-01 13:11:28', '2023-07-01 13:11:28'),
(42, 'Ebba Ullrich Jr.', 'jewel51@example.com', '2023-07-01 13:16:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KNhBqVmbxA', '2023-07-01 13:16:35', '2023-07-01 13:16:35'),
(43, 'Tyreek Homenick', 'deckow.brendan@example.org', '2023-07-01 13:16:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JaM7TisUm4', '2023-07-01 13:16:35', '2023-07-01 13:16:35'),
(44, 'Velva Schroeder', 'dameon.yundt@example.net', '2023-07-01 13:16:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MpSjgDFkac', '2023-07-01 13:16:35', '2023-07-01 13:16:35'),
(45, 'Nola Erdman', 'dpurdy@example.net', '2023-07-01 13:16:35', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Gs2Gtog6hd', '2023-07-01 13:16:35', '2023-07-01 13:16:35'),
(46, 'Isabell Strosin DVM', 'kmuller@example.net', '2023-07-01 13:16:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'elE43vQTtu', '2023-07-01 13:16:55', '2023-07-01 13:16:55'),
(47, 'Lempi Emard', 'hackett.kenny@example.com', '2023-07-01 13:16:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ew2A9lWys7', '2023-07-01 13:16:55', '2023-07-01 13:16:55'),
(48, 'Evie Greenfelder DVM', 'issac71@example.net', '2023-07-01 13:16:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'p6xfWXPkKu', '2023-07-01 13:16:55', '2023-07-01 13:16:55'),
(49, 'Jarvis Yost V', 'taufderhar@example.org', '2023-07-01 13:16:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1M6i1Gz58N', '2023-07-01 13:16:55', '2023-07-01 13:16:55'),
(50, 'Quinten Anderson III', 'hamill.leann@example.com', '2023-07-01 13:18:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lkYh3wDsLd', '2023-07-01 13:18:13', '2023-07-01 13:18:13'),
(51, 'Mr. Donnie Breitenberg', 'jayce.oberbrunner@example.net', '2023-07-01 13:18:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'htEaXUCyQp', '2023-07-01 13:18:13', '2023-07-01 13:18:13'),
(52, 'Ruby Hartmann II', 'kertzmann.bernhard@example.com', '2023-07-01 13:18:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FTwBDez3HA', '2023-07-01 13:18:13', '2023-07-01 13:18:13'),
(53, 'Jovany Larson', 'dicki.maddison@example.com', '2023-07-01 13:18:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ls4GrD3zgv', '2023-07-01 13:18:13', '2023-07-01 13:18:13'),
(54, 'Mrs. Shanie Daniel IV', 'thompson.eda@example.net', '2023-07-01 13:18:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PS512Vqi3c', '2023-07-01 13:18:36', '2023-07-01 13:18:36'),
(55, 'Dr. Cooper Hoeger V', 'junius.dare@example.org', '2023-07-01 13:18:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wfXyp9WwXd', '2023-07-01 13:18:36', '2023-07-01 13:18:36'),
(56, 'Dr. Reta Beier I', 'bartell.colleen@example.org', '2023-07-01 13:18:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Wzcq6TD5bn', '2023-07-01 13:18:36', '2023-07-01 13:18:36'),
(57, 'Prof. Domenick Spencer MD', 'andreanne.oconner@example.org', '2023-07-01 13:18:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QOBzIRpknS', '2023-07-01 13:18:36', '2023-07-01 13:18:36'),
(58, 'Lorena Zboncak Sr.', 'crona.unique@example.org', '2023-07-01 13:20:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LTu0yNG2mc', '2023-07-01 13:20:14', '2023-07-01 13:20:14'),
(59, 'Mr. Arne Skiles IV', 'ccartwright@example.org', '2023-07-01 13:20:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'u1x0cFB1ff', '2023-07-01 13:20:14', '2023-07-01 13:20:14'),
(60, 'Prof. Rigoberto Pfeffer IV', 'price.muller@example.net', '2023-07-01 13:20:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GIS73Fd03f', '2023-07-01 13:20:14', '2023-07-01 13:20:14'),
(61, 'Dr. Kade Mayert', 'bosco.theresa@example.org', '2023-07-01 13:20:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RusaHv6gYK', '2023-07-01 13:20:14', '2023-07-01 13:20:14'),
(62, 'Alta Parisian', 'helga06@example.com', '2023-07-01 13:21:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rj1JR2uDXE', '2023-07-01 13:21:04', '2023-07-01 13:21:04'),
(63, 'Dr. Gussie Torp DDS', 'matteo.heidenreich@example.com', '2023-07-01 13:21:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YogdQSPql1', '2023-07-01 13:21:04', '2023-07-01 13:21:04'),
(64, 'Blanca D\'Amore', 'jaqueline.collier@example.com', '2023-07-01 13:21:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ohKfhkIcil', '2023-07-01 13:21:04', '2023-07-01 13:21:04'),
(65, 'Mrs. Francesca Quigley V', 'madilyn92@example.net', '2023-07-01 13:21:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cFm5jUPjXh', '2023-07-01 13:21:04', '2023-07-01 13:21:04'),
(66, 'Dr. Narciso Boehm Jr.', 'pmcglynn@example.org', '2023-07-01 13:21:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KbTYXFIobh', '2023-07-01 13:21:04', '2023-07-01 13:21:04'),
(67, 'Mr. Corbin Beer', 'pzieme@example.net', '2023-07-01 13:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XJStcIx7zF', '2023-07-01 13:22:04', '2023-07-01 13:22:04'),
(68, 'Winnifred Ratke', 'cremin.ismael@example.com', '2023-07-01 13:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hFMtpQCaW5', '2023-07-01 13:22:04', '2023-07-01 13:22:04'),
(69, 'Ada Lockman', 'lschumm@example.net', '2023-07-01 13:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DSgeoO2UZr', '2023-07-01 13:22:04', '2023-07-01 13:22:04'),
(70, 'Ms. Mia Bosco', 'wisozk.chauncey@example.net', '2023-07-01 13:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Qlx9AUc2lA', '2023-07-01 13:22:04', '2023-07-01 13:22:04'),
(71, 'Eldon Sanford', 'rippin.kip@example.com', '2023-07-01 13:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XlvGSTh07t', '2023-07-01 13:22:04', '2023-07-01 13:22:04'),
(72, 'Lolita Balistreri', 'schultz.lauren@example.org', '2023-07-01 13:26:22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0sM7XfjGxC', '2023-07-01 13:26:22', '2023-07-01 13:26:22'),
(73, 'Rebeka Rutherford', 'nikolas68@example.net', '2023-07-01 13:26:22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xJ8D6lWEi4', '2023-07-01 13:26:22', '2023-07-01 13:26:22'),
(74, 'Fabian Rice', 'peter.carter@example.net', '2023-07-01 13:26:22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ysv7fhmj92', '2023-07-01 13:26:22', '2023-07-01 13:26:22'),
(75, 'Burley VonRueden', 'schmidt.saul@example.net', '2023-07-01 13:26:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9f4qZJfLC1', '2023-07-01 13:26:23', '2023-07-01 13:26:23'),
(76, 'Renee Klein DVM', 'uhaley@example.com', '2023-07-01 13:28:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fqOTtfI87w', '2023-07-01 13:28:36', '2023-07-01 13:28:36'),
(77, 'Skylar Jenkins', 'vita.heaney@example.net', '2023-07-01 13:28:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HNUvliW5cz', '2023-07-01 13:28:36', '2023-07-01 13:28:36'),
(78, 'Miguel Kemmer', 'pietro.moore@example.org', '2023-07-01 13:28:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LnD2sisX2p', '2023-07-01 13:28:37', '2023-07-01 13:28:37'),
(79, 'Glenda Durgan', 'ngibson@example.net', '2023-07-01 13:28:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '67SnGBeKwm', '2023-07-01 13:28:37', '2023-07-01 13:28:37'),
(80, 'Nestor Waters', 'nelda01@example.org', '2023-07-01 13:33:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nf4kGP1OAR', '2023-07-01 13:33:12', '2023-07-01 13:33:12'),
(81, 'Vern Daniel', 'maximilian59@example.com', '2023-07-01 13:33:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fXMfxGSSIE', '2023-07-01 13:33:12', '2023-07-01 13:33:12'),
(82, 'Miss Amalia Christiansen PhD', 'aufderhar.miles@example.net', '2023-07-01 13:33:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9pin17jboF', '2023-07-01 13:33:12', '2023-07-01 13:33:12'),
(83, 'Rosalyn Ebert', 'dach.kailyn@example.org', '2023-07-01 13:33:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fjketIm8G5', '2023-07-01 13:33:12', '2023-07-01 13:33:12'),
(84, 'Conrad Mitchell MD', 'ozella53@example.com', '2023-07-01 13:34:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SWKi7RMSx9', '2023-07-01 13:34:14', '2023-07-01 13:34:14'),
(85, 'Christine Stracke', 'maria.wolff@example.org', '2023-07-01 13:34:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GFRf7N24lw', '2023-07-01 13:34:15', '2023-07-01 13:34:15'),
(86, 'Jules Mills', 'seth.prosacco@example.net', '2023-07-01 13:34:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8qInzoh0qI', '2023-07-01 13:34:15', '2023-07-01 13:34:15'),
(87, 'Fernando Nitzsche', 'adah87@example.com', '2023-07-01 13:34:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'I0sA40dI9T', '2023-07-01 13:34:15', '2023-07-01 13:34:15'),
(88, 'Daphney Gutkowski V', 'mohr.orland@example.com', '2023-07-01 13:40:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eec7g6gFDs', '2023-07-01 13:40:00', '2023-07-01 13:40:00'),
(89, 'Francesco Ziemann', 'ratke.harold@example.net', '2023-07-01 13:40:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tDykjKjzD3', '2023-07-01 13:40:00', '2023-07-01 13:40:00'),
(90, 'Prof. Issac Kshlerin', 'dfriesen@example.net', '2023-07-01 13:40:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hhHnpdlnIC', '2023-07-01 13:40:00', '2023-07-01 13:40:00'),
(91, 'Prof. Bethel Murazik I', 'eulalia.mosciski@example.org', '2023-07-01 13:40:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ppcoSKgTvO', '2023-07-01 13:40:53', '2023-07-01 13:40:53'),
(92, 'Reed Feeney', 'kkirlin@example.com', '2023-07-01 13:40:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AyTFLARQp9', '2023-07-01 13:40:53', '2023-07-01 13:40:53'),
(93, 'Matilda Pouros Jr.', 'josiah.parisian@example.org', '2023-07-01 13:40:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kRFR9wfvfn', '2023-07-01 13:40:53', '2023-07-01 13:40:53'),
(94, 'Matteo Parker', 'mreynolds@example.com', '2023-07-01 13:41:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3nQECdig8k', '2023-07-01 13:41:19', '2023-07-01 13:41:19'),
(95, 'Prof. Gunner Fay', 'nreichert@example.net', '2023-07-01 13:41:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4zdp3WtZRg', '2023-07-01 13:41:19', '2023-07-01 13:41:19'),
(96, 'Shana Feest', 'ijenkins@example.net', '2023-07-01 13:41:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4kHxrdZjHB', '2023-07-01 13:41:20', '2023-07-01 13:41:20'),
(97, 'Yasmin Deckow', 'bergstrom.natasha@example.com', '2023-07-01 13:41:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Z3lJFv34E8', '2023-07-01 13:41:20', '2023-07-01 13:41:20'),
(98, 'Norma Anderson', 'glover.floyd@example.com', '2023-07-01 13:47:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0gWkbTr0AL', '2023-07-01 13:47:40', '2023-07-01 13:47:40'),
(99, 'Ms. Amira West', 'vrogahn@example.net', '2023-07-01 13:47:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mqdhWZkBVo', '2023-07-01 13:47:40', '2023-07-01 13:47:40'),
(100, 'Prof. Heaven Pouros', 'rohan.steve@example.com', '2023-07-01 13:47:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nL5mTvvfBi', '2023-07-01 13:47:40', '2023-07-01 13:47:40'),
(101, 'Maybell Macejkovic', 'ullrich.elza@example.org', '2023-07-01 13:47:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'a58yyB1OuJ', '2023-07-01 13:47:41', '2023-07-01 13:47:41'),
(102, 'Dr. Wendy Walter II', 'lane10@example.org', '2023-07-01 13:47:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yGNanH2X4n', '2023-07-01 13:47:41', '2023-07-01 13:47:41'),
(103, 'Friedrich Mraz', 'ratke.queenie@example.org', '2023-07-01 13:58:46', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kVcQi4k3jP', '2023-07-01 13:58:46', '2023-07-01 13:58:46'),
(104, 'Prof. Alejandrin Mills', 'ltowne@example.org', '2023-07-01 13:58:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HDQMHYnCBu', '2023-07-01 13:58:47', '2023-07-01 13:58:47'),
(105, 'Lempi Barrows', 'mccullough.yessenia@example.org', '2023-07-01 13:58:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'D2OTZvaH2x', '2023-07-01 13:58:47', '2023-07-01 13:58:47'),
(106, 'Lonzo Windler', 'sim56@example.com', '2023-07-01 13:58:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OpTvDTA7vJ', '2023-07-01 13:58:47', '2023-07-01 13:58:47'),
(107, 'Alvina Franecki', 'borer.blaze@example.net', '2023-07-01 13:58:47', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JO8pMEcMXn', '2023-07-01 13:58:47', '2023-07-01 13:58:47'),
(108, 'Abel Cormier IV', 'bud71@example.com', '2023-07-01 13:59:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dcNXEXMSrr', '2023-07-01 13:59:17', '2023-07-01 13:59:17'),
(109, 'Vallie Pacocha', 'jermey60@example.org', '2023-07-01 13:59:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tovCKtEQRT', '2023-07-01 13:59:17', '2023-07-01 13:59:17'),
(110, 'Ms. Marguerite Ratke Sr.', 'curt.reichert@example.org', '2023-07-01 13:59:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LE8dA8uH4F', '2023-07-01 13:59:17', '2023-07-01 13:59:17'),
(111, 'Mr. Ted Kshlerin', 'tkilback@example.org', '2023-07-01 13:59:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZRTWuVXieJ', '2023-07-01 13:59:17', '2023-07-01 13:59:17'),
(112, 'Niko Hartmann', 'alisha23@example.org', '2023-07-01 13:59:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OYFpBjGkMg', '2023-07-01 13:59:18', '2023-07-01 13:59:18'),
(113, 'Glennie Luettgen', 'kenyatta.mueller@example.net', '2023-07-01 14:01:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gOe0ePlc3j', '2023-07-01 14:01:54', '2023-07-01 14:01:54'),
(114, 'Mr. Raven Turner', 'heaney.ana@example.org', '2023-07-01 14:01:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'o8mP06TbSv', '2023-07-01 14:01:55', '2023-07-01 14:01:55'),
(115, 'Mr. Armani Rodriguez Sr.', 'reynolds.elta@example.net', '2023-07-01 14:01:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xnBwks7z3W', '2023-07-01 14:01:55', '2023-07-01 14:01:55'),
(116, 'Laurence Morissette', 'mwintheiser@example.com', '2023-07-01 14:01:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YDXvlu6NHv', '2023-07-01 14:01:55', '2023-07-01 14:01:55'),
(117, 'Hortense Kohler', 'vgoyette@example.org', '2023-07-01 14:01:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'E9vSAChEss', '2023-07-01 14:01:55', '2023-07-01 14:01:55'),
(118, 'Mr. Cruz Skiles II', 'kmarvin@example.net', '2023-07-01 14:04:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GQ24lCgmpG', '2023-07-01 14:04:36', '2023-07-01 14:04:36'),
(119, 'Donna O\'Reilly', 'cornelius50@example.org', '2023-07-01 14:04:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iSv2FWVKMH', '2023-07-01 14:04:36', '2023-07-01 14:04:36'),
(120, 'Ms. Harmony Bashirian III', 'mckenzie.asha@example.com', '2023-07-01 14:04:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bXHXjFEg9x', '2023-07-01 14:04:37', '2023-07-01 14:04:37'),
(121, 'Kamille Greenholt', 'stanton.graham@example.net', '2023-07-01 14:04:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zl72qrfylV', '2023-07-01 14:04:37', '2023-07-01 14:04:37'),
(122, 'Lourdes Murray', 'hdach@example.com', '2023-07-01 14:04:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jBpe3u7hsy', '2023-07-01 14:04:37', '2023-07-01 14:04:37'),
(123, 'Raul Wehner', 'ratke.elwyn@example.com', '2023-07-01 14:05:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FZTbY80vhl', '2023-07-01 14:05:04', '2023-07-01 14:05:04'),
(124, 'Dr. Ozella Lehner', 'king.clotilde@example.org', '2023-07-01 14:05:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'peeT0g6NpG', '2023-07-01 14:05:04', '2023-07-01 14:05:04'),
(125, 'Freida Muller PhD', 'eschultz@example.com', '2023-07-01 14:05:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YsjFvWIrdM', '2023-07-01 14:05:04', '2023-07-01 14:05:04'),
(126, 'Vicky Okuneva PhD', 'crooks.estevan@example.net', '2023-07-01 14:05:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6gmrrwxA2j', '2023-07-01 14:05:04', '2023-07-01 14:05:04'),
(127, 'Ms. Pink Torphy DVM', 'hills.cordie@example.com', '2023-07-01 14:05:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uBEVTVH7mS', '2023-07-01 14:05:05', '2023-07-01 14:05:05'),
(128, 'Tia Bode', 'giles91@example.com', '2023-07-01 14:11:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Q9N5u6Q3Hw', '2023-07-01 14:11:53', '2023-07-01 14:11:53'),
(129, 'Miss Bianka Bergnaum DDS', 'alphonso78@example.net', '2023-07-01 14:11:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6lae2CgDhB', '2023-07-01 14:11:53', '2023-07-01 14:11:53'),
(130, 'Maxie Stehr', 'xhills@example.org', '2023-07-01 14:11:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '43ySG6hKoo', '2023-07-01 14:11:53', '2023-07-01 14:11:53'),
(131, 'Jackie Abbott MD', 'gail.denesik@example.net', '2023-07-01 14:11:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gwVr8oTO3C', '2023-07-01 14:11:53', '2023-07-01 14:11:53'),
(132, 'Brooke Casper', 'zboncak.veda@example.org', '2023-07-01 14:11:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mQ5KCKj5dM', '2023-07-01 14:11:54', '2023-07-01 14:11:54'),
(133, 'Prof. Deshaun Goldner', 'rahul91@example.org', '2023-07-01 14:14:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RgBdjHINyr', '2023-07-01 14:14:51', '2023-07-01 14:14:51'),
(134, 'Rachelle Balistreri', 'ihagenes@example.net', '2023-07-01 14:14:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SiHoIv5eKB', '2023-07-01 14:14:51', '2023-07-01 14:14:51'),
(135, 'Reggie Turcotte', 'ritchie.verner@example.com', '2023-07-01 14:14:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rdLxwtSOvG', '2023-07-01 14:14:51', '2023-07-01 14:14:51'),
(136, 'Dr. Ray McGlynn PhD', 'abernathy.kelly@example.com', '2023-07-01 14:14:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'm9Za0tWSXo', '2023-07-01 14:14:51', '2023-07-01 14:14:51'),
(137, 'Nicola Schinner', 'ramon.stamm@example.org', '2023-07-01 14:14:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hGEwpnhHIi', '2023-07-01 14:14:51', '2023-07-01 14:14:51');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_employee_id_foreign` (`employee_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
