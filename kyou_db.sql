-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.4.3 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk kyou_db
CREATE DATABASE IF NOT EXISTS `kyou_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kyou_db`;

-- membuang struktur untuk table kyou_db.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.cache: ~2 rows (lebih kurang)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('laravel-cache-test06@gmail.com|127.0.0.1', 'i:1;', 1766298390),
	('laravel-cache-test06@gmail.com|127.0.0.1:timer', 'i:1766298390;', 1766298390);

-- membuang struktur untuk table kyou_db.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.cache_locks: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.carts: ~3 rows (lebih kurang)
INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
	(2, 4, 1, 2, '2025-12-15 06:56:07', '2025-12-15 08:59:41'),
	(25, 3, 42, 1, '2026-07-07 01:20:14', '2026-07-07 01:20:14'),
	(26, 3, 40, 1, '2026-07-07 01:20:20', '2026-07-07 01:20:20');

-- membuang struktur untuk table kyou_db.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.job_batches: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.migrations: ~20 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_12_08_143657_create_products_table', 1),
	(5, '2025_12_08_145727_create_orders_table', 1),
	(6, '2025_12_09_021149_create_carts_table', 1),
	(7, '2025_12_09_074615_create_order_items_table', 1),
	(8, '2025_12_10_041401_add_shipping_info_to_orders_table', 1),
	(9, '2025_12_10_044135_add_insurance_fee_to_orders_table', 1),
	(10, '2025_12_11_103159_add_delivery_status_to_orders_table', 1),
	(11, '2025_12_11_105255_create_reviews_table', 1),
	(12, '2025_12_11_111918_add_order_id_to_reviews_table', 1),
	(13, '2020_10_04_115514_create_moonshine_roles_table', 2),
	(14, '2020_10_05_173148_create_moonshine_tables', 2),
	(15, '2025_12_12_171032_create_notifications_table', 2),
	(16, '2025_12_16_032209_add_role_to_users_table', 3),
	(17, '2025_12_16_114854_add_category_to_products_table', 4),
	(18, '2025_12_17_133533_add_image_to_users_table', 5),
	(19, '2026_07_04_073946_create_personal_access_tokens_table', 6),
	(20, '2026_07_07_092150_add_recipient_name_to_orders_table', 7);

-- membuang struktur untuk table kyou_db.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.notifications: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(15,0) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `delivery_status` enum('pending','processing','shipping','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(15,0) NOT NULL DEFAULT '0',
  `tax_fee` decimal(15,0) NOT NULL DEFAULT '0',
  `insurance_fee` decimal(15,0) NOT NULL DEFAULT '0',
  `admin_fee` decimal(15,0) NOT NULL DEFAULT '0',
  `snap_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_product_id_foreign` (`product_id`),
  CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.orders: ~34 rows (lebih kurang)
INSERT INTO `orders` (`id`, `user_id`, `recipient_name`, `product_id`, `quantity`, `total_price`, `status`, `delivery_status`, `shipping_address`, `shipping_courier`, `shipping_cost`, `tax_fee`, `insurance_fee`, `admin_fee`, `snap_token`, `created_at`, `updated_at`) VALUES
	(2, 3, '', 3, 1, 1680500, 'Paid', 'completed', 'jalan', 'JNE Regular', 12000, 165000, 2500, 1000, '091f7300-3b19-4186-9866-55ee7881c936', '2025-12-11 04:34:20', '2025-12-11 04:34:33'),
	(3, 3, '', 3, 1, 1692500, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 165000, 2500, 1000, 'a16c13aa-1abe-40f7-828d-d6cc8202dc44', '2025-12-11 04:39:45', '2025-12-11 04:40:09'),
	(4, 3, '', 1, 1, 338300, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 30800, 2500, 1000, 'b9a24a92-d852-4b2f-9019-5f9880605462', '2025-12-11 04:43:35', '2025-12-11 04:44:35'),
	(5, 3, '', 2, 1, 527000, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 49500, 2500, 1000, 'a07cee5b-470e-4593-925d-fc93b71e7a28', '2025-12-12 09:31:34', '2025-12-12 09:31:50'),
	(6, 3, '', 2, 1, 527000, 'Paid', 'shipping', 'jalan', 'JNE YES', 24000, 49500, 2500, 1000, 'a44c1cb8-5de1-4818-b3ae-17f2fcdc6b0c', '2025-12-12 11:51:54', '2025-12-12 11:52:41'),
	(7, 3, '', 1, 1, 338300, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 30800, 2500, 1000, '3c1dc5d2-e095-46f0-b6e1-4f5135e19e21', '2025-12-12 20:36:36', '2025-12-12 20:37:54'),
	(8, 4, '', 2, 1, 527000, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 49500, 2500, 1000, 'adf60b0e-5dc5-46dc-86f1-2629ece1d252', '2025-12-12 20:38:59', '2025-12-12 20:39:49'),
	(9, 4, '', 2, 1, 527000, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 49500, 2500, 1000, 'f22394ff-d545-4a19-bb48-9b24fec28e57', '2025-12-12 20:53:00', '2025-12-12 20:54:15'),
	(10, 4, '', 3, 1, 1692500, 'Paid', 'completed', 'jlan', 'JNE YES', 24000, 165000, 2500, 1000, '72dc5cb5-614a-4fea-a2a6-2dd18e456b17', '2025-12-12 21:21:29', '2025-12-12 21:21:59'),
	(11, 4, '', 1, 1, 326300, 'Paid', 'completed', 'jalan', 'JNE Regular', 12000, 30800, 2500, 1000, '67e17aea-44f1-4fea-ae48-13d74bff1ccf', '2025-12-15 07:01:24', '2025-12-15 07:03:28'),
	(19, 3, '', 28, 1, 1692500, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 165000, 2500, 1000, 'f8c3e046-a072-4b3e-841c-b99f30a0d473', '2025-12-16 01:42:05', '2025-12-16 03:57:24'),
	(20, 3, '', 29, 1, 38600, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 1100, 2500, 1000, 'c957cd74-cd1d-4622-a478-2d02d14c1d36', '2025-12-16 04:09:53', '2025-12-17 06:02:32'),
	(21, 3, '', 28, 1, 1692500, 'Paid', 'cancelled', 'jalan', 'JNE YES', 24000, 165000, 2500, 1000, '3a867a3a-968c-4f52-9148-17a25d2213b9', '2025-12-16 04:34:36', '2025-12-19 10:32:10'),
	(24, 3, '', 29, 1, 138500, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 11000, 2500, 1000, '6581cd71-1b79-4846-8f28-d066076ed150', '2025-12-17 05:50:29', '2026-07-07 01:22:07'),
	(26, 4, '', 29, 1, 138500, 'Paid', 'shipping', 'jalan', 'JNE YES', 24000, 11000, 2500, 1000, '8d8155bf-ba4b-4932-ba5c-13d23c6561dd', '2025-12-17 06:01:36', '2025-12-17 06:02:23'),
	(27, 3, '', 29, 1, 138500, 'Paid', 'completed', 'jalan', 'JNE YES', 24000, 11000, 2500, 1000, '0121ccd2-9029-4067-a708-a42ac5352a38', '2025-12-17 06:04:39', '2025-12-17 21:48:12'),
	(30, 5, '', 29, 1, 138500, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 11000, 2500, 1000, 'b186445c-6983-4633-8c9a-8408535a76d4', '2025-12-17 21:15:30', '2025-12-17 21:16:11'),
	(31, 6, '', 31, 1, 1137500, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 110000, 2500, 1000, '9d90a884-ec57-4dce-90da-4f3df9674c5b', '2025-12-17 21:17:52', '2025-12-17 21:18:22'),
	(36, 3, '', 31, 1, 1137500, 'Paid', 'cancelled', 'jalan', 'JNE YES', 24000, 110000, 2500, 1000, 'df92753f-0c72-4a17-b592-1a00d6178a30', '2025-12-17 21:46:49', '2025-12-21 22:59:34'),
	(43, 3, '', 42, 1, 2802500, 'Paid', 'completed', 'JALAN', 'JNE YES', 24000, 275000, 2500, 1000, 'c5b5df3a-f17f-4a1c-8bb7-8a8f27e120c5', '2025-12-21 23:55:13', '2025-12-21 23:55:49'),
	(44, 3, '', 41, 1, 2113400, 'Paid', 'completed', 'jalan', 'JNE Regular', 12000, 207900, 2500, 1000, '0161d3d3-9294-40a3-9a30-54cedb0f722d', '2025-12-21 23:57:19', '2025-12-22 06:34:18'),
	(45, 3, '', 34, 1, 1859000, 'Paid', 'processing', 'JALAN PONDOK GEDE RT03/05 NO1', 'JNE YES', 24000, 181500, 2500, 1000, '8a071ac4-1a68-4cd5-9237-23b1fd6c033b', '2025-12-22 06:43:46', '2025-12-22 06:44:38'),
	(46, 3, '', 44, 1, 1406000, 'Paid', 'processing', 'JALAN', 'J&T Express', 15000, 137500, 2500, 1000, 'beebe14b-e470-42a4-9e3b-cbd32d8cec47', '2025-12-22 06:45:17', '2025-12-22 06:45:57'),
	(47, 9, '', 3, 50, 83277500, 'Paid', 'shipping', 'Jalan', 'JNE YES', 24000, 8250000, 2500, 1000, 'de6b882f-53ec-4311-a14c-e6939c70a5b0', '2025-12-22 07:26:41', '2025-12-22 07:32:07'),
	(49, 10, '', 43, 1, 22215500, 'Paid', 'completed', 'jl', 'JNE Regular', 12000, 2200000, 2500, 1000, '5b22ffdd-d345-45fc-97c3-d819e8e7485a', '2026-06-18 04:43:10', '2026-06-18 04:48:50'),
	(50, 10, '', 42, 1, 2790500, 'Paid', 'processing', 'jl', 'JNE Regular', 12000, 275000, 2500, 1000, '7db7360d-d6ab-40d5-a8a1-c38fe27ba700', '2026-06-18 04:46:18', '2026-06-18 04:47:07'),
	(53, 11, '', 41, 7, 11837900, 'Paid', 'completed', 'jalan tpa1', 'JNE YES', 24000, 1170400, 2500, 1000, '48b25e79-4b2e-44fb-a78d-3e4bc8a49d3f', '2026-06-19 11:07:56', '2026-06-19 11:10:34'),
	(54, 3, '', 42, 1, 2802500, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 275000, 2500, 1000, 'fa0140f8-abee-4dcd-85bf-f8d052765df6', '2026-07-01 21:29:15', '2026-07-01 21:30:07'),
	(55, 3, '', 44, 3, 4388900, 'Paid', 'completed', 'jalan', 'JNE Regular', 12000, 433400, 2500, 1000, 'b33e6b9a-40e5-4a3d-bee0-a0d14ffa794c', '2026-07-01 21:36:50', '2026-07-01 21:37:31'),
	(58, 3, '', 40, 1, 1692500, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 165000, 2500, 1000, 'd2900942-7013-4fd8-9860-ccaf51bfd9bd', '2026-07-04 01:54:54', '2026-07-04 01:55:04'),
	(60, 3, '', 41, 1, 2125400, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 207900, 2500, 1000, '6aaa4615-3a69-40b9-8ec3-213c9be5f93f', '2026-07-04 02:09:06', '2026-07-04 02:09:35'),
	(63, 10, '', 41, 1, 2125400, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 207900, 2500, 1000, 'ba421f18-dfad-4998-a35b-68ebebe05807', '2026-07-06 13:11:59', '2026-07-06 13:12:48'),
	(65, 3, '', 42, 1, 2790500, 'Paid', 'completed', 'jalan', 'JNE Regular', 12000, 275000, 2500, 1000, '8ecc16f6-1fa8-4400-bc51-eed878ce5d1e', '2026-07-06 22:25:33', '2026-07-06 22:27:49'),
	(68, 3, '', 37, 1, 2247500, 'Paid', 'processing', 'jalan', 'JNE YES', 24000, 220000, 2500, 1000, '2fe6760b-1a8c-434b-9286-1305ac9a6c78', '2026-07-07 01:10:05', '2026-07-07 01:10:18');

-- membuang struktur untuk table kyou_db.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.order_items: ~38 rows (lebih kurang)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
	(2, 2, 3, 1, 1500000, '2025-12-11 04:34:20', '2025-12-11 04:34:20'),
	(3, 3, 3, 1, 1500000, '2025-12-11 04:39:45', '2025-12-11 04:39:45'),
	(4, 4, 1, 1, 280000, '2025-12-11 04:43:35', '2025-12-11 04:43:35'),
	(5, 5, 2, 1, 450000, '2025-12-12 09:31:34', '2025-12-12 09:31:34'),
	(6, 6, 2, 1, 450000, '2025-12-12 11:51:54', '2025-12-12 11:51:54'),
	(7, 7, 1, 1, 280000, '2025-12-12 20:36:36', '2025-12-12 20:36:36'),
	(8, 8, 2, 1, 450000, '2025-12-12 20:38:59', '2025-12-12 20:38:59'),
	(9, 9, 2, 1, 450000, '2025-12-12 20:53:00', '2025-12-12 20:53:00'),
	(10, 10, 3, 1, 1500000, '2025-12-12 21:21:29', '2025-12-12 21:21:29'),
	(11, 11, 1, 1, 280000, '2025-12-15 07:01:24', '2025-12-15 07:01:24'),
	(19, 19, 28, 1, 1500000, '2025-12-16 01:42:05', '2025-12-16 01:42:05'),
	(20, 20, 29, 1, 10000, '2025-12-16 04:09:53', '2025-12-16 04:09:53'),
	(21, 21, 28, 1, 1500000, '2025-12-16 04:34:36', '2025-12-16 04:34:36'),
	(22, 24, 29, 1, 100000, '2025-12-17 05:50:29', '2025-12-17 05:50:29'),
	(24, 26, 29, 1, 100000, '2025-12-17 06:01:36', '2025-12-17 06:01:36'),
	(25, 27, 29, 1, 100000, '2025-12-17 06:04:39', '2025-12-17 06:04:39'),
	(26, 30, 29, 1, 100000, '2025-12-17 21:15:30', '2025-12-17 21:15:30'),
	(27, 31, 31, 1, 1000000, '2025-12-17 21:17:52', '2025-12-17 21:17:52'),
	(32, 36, 31, 1, 1000000, '2025-12-17 21:46:49', '2025-12-17 21:46:49'),
	(39, 43, 42, 1, 2500000, '2025-12-21 23:55:13', '2025-12-21 23:55:13'),
	(40, 44, 41, 1, 1890000, '2025-12-21 23:57:19', '2025-12-21 23:57:19'),
	(41, 45, 34, 1, 1650000, '2025-12-22 06:43:46', '2025-12-22 06:43:46'),
	(42, 46, 44, 1, 1250000, '2025-12-22 06:45:17', '2025-12-22 06:45:17'),
	(43, 47, 3, 50, 1500000, '2025-12-22 07:26:41', '2025-12-22 07:26:41'),
	(45, 49, 43, 1, 20000000, '2026-06-18 04:43:10', '2026-06-18 04:43:10'),
	(46, 50, 42, 1, 2500000, '2026-06-18 04:46:18', '2026-06-18 04:46:18'),
	(49, 53, 41, 1, 1890000, '2026-06-19 11:07:56', '2026-06-19 11:07:56'),
	(50, 53, 42, 1, 2500000, '2026-06-19 11:07:56', '2026-06-19 11:07:56'),
	(51, 53, 44, 5, 1250000, '2026-06-19 11:07:56', '2026-06-19 11:07:56'),
	(52, 54, 42, 1, 2500000, '2026-07-01 21:29:15', '2026-07-01 21:29:15'),
	(53, 55, 44, 1, 1250000, '2026-07-01 21:36:50', '2026-07-01 21:36:50'),
	(54, 55, 41, 1, 1890000, '2026-07-01 21:36:50', '2026-07-01 21:36:50'),
	(55, 55, 38, 1, 800000, '2026-07-01 21:36:50', '2026-07-01 21:36:50'),
	(58, 58, 40, 1, 1500000, '2026-07-04 01:54:54', '2026-07-04 01:54:54'),
	(60, 60, 41, 1, 1890000, '2026-07-04 02:09:06', '2026-07-04 02:09:06'),
	(63, 63, 41, 1, 1890000, '2026-07-06 13:11:59', '2026-07-06 13:11:59'),
	(65, 65, 42, 1, 2500000, '2026-07-06 22:25:33', '2026-07-06 22:25:33'),
	(68, 68, 37, 1, 2000000, '2026-07-07 01:10:05', '2026-07-07 01:10:05');

-- membuang struktur untuk table kyou_db.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.personal_access_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table kyou_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,0) NOT NULL,
  `stock` int NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.products: ~18 rows (lebih kurang)
INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Gundam Aerial HG', 'Deskripsi keren untuk Gundam Aerial HG', 280000, 5, 'merch', 'products/63pnmWzyHV4fuubsjwXwtkANkOmpwonH8Y94z2KJ.jpg', '2025-12-11 04:26:26', '2025-12-16 05:10:49'),
	(2, 'Miku Nakano Figure', 'Deskripsi keren untuk Miku Nakano Figure', 450000, 3, 'merch', 'products/EYNwxpZcN3ScFXQMfYGpXUz4UAIrbk1ZtvnZ5mSm.jpg', '2025-12-11 04:26:26', '2025-12-16 05:10:56'),
	(3, 'One Piece Luffy Gear 5', 'Deskripsi keren untuk One Piece Luffy Gear 5', 1500000, 50, 'merch', 'products/ZbkYJ3KjtzPtrOfoqDlOfXoGkSWHH42AhPeA5ISE.jpg', '2025-12-11 04:26:26', '2025-12-22 07:26:41'),
	(28, 'Figure Firefly', 'Figure cantik', 1500000, 0, 'merch', 'products/kM0oJkTZLzfbQTSbOYl1p88j6iz3T5vY0duLe4Cz.jpg', '2025-12-16 01:38:20', '2025-12-16 05:10:25'),
	(29, 'Poster Kimetsu no Yaiba', 'Poste', 100000, 6, 'merch', 'products/uqJ1yMQBI2c7KwSw0ShK8GinlCcZJy6rzY98FDoe.jpg', '2025-12-16 04:00:04', '2025-12-21 22:36:29'),
	(31, 'Shorekeeper', 'WUWA', 1000000, 0, 'merch', 'products/vCMLlPPWMFetw31CjEegTuiWXLIu3YlbEAvXswC5.png', '2025-12-17 11:15:11', '2025-12-17 21:46:49'),
	(33, 'Nendoroid Oguri Cap - Uma Musume Pretty Derby', 'Figure Oguri Cap', 720000, 10, 'merch', 'products/0dPDOXxpQmv0bpxTay0uZAyL0lGY5JoTx26fT7ir.webp', '2025-12-21 07:10:17', '2025-12-21 07:10:17'),
	(34, 'Figure Citlali - Genshin Impact', 'Figure Citlali Genshin Impact', 1650000, 4, 'merch', 'products/9F4pGd5TIC3b8AjE7Qr7MoPFuD56sJNMiPnVNToU.webp', '2025-12-21 07:11:29', '2025-12-22 06:43:46'),
	(35, 'Azur Lane - Keycaps', 'Keycaps', 1000000, 6, 'elektronik', 'products/17wAI37SXrCQc6v0KgD0ekH1jK6qYdBJWDwZErUo.webp', '2025-12-21 07:13:02', '2025-12-21 07:13:02'),
	(36, 'Figure - Uzumaki Naruto', 'Figure Naruto', 150000, 2, 'merch', 'products/QptGU3BMLcu9lIXn71YR3exIFH94vU32I6RHcefZ.webp', '2025-12-21 07:13:40', '2025-12-21 07:13:40'),
	(37, 'Elysia Herrscher Of Human Ego - Series Jacket', 'Jacket Honkai Impact 3', 2000000, 0, 'fashion', 'products/JpV7G1QpchahbFutwgZxRrTtgsEZoEpDuHg6qsUJ.webp', '2025-12-21 07:14:30', '2026-07-07 01:10:05'),
	(38, 'Kamen Rider Ex-Aid - Series Jacket', 'Jacket Tokusatsu', 800000, 9, 'fashion', 'products/kl4tKWbFnaK2bQggp8WjqkQtrIJ55X1cRoQI7pYX.webp', '2025-12-21 07:15:28', '2026-07-01 21:36:50'),
	(39, 'Hatsune Miku - Series Jacket', 'Jacket Hatsune Miku', 1120000, 4, 'fashion', 'products/yjtgU7DDGlUNIQjYznICbP0V0d5XHvb2U0U1OthZ.webp', '2025-12-21 07:16:23', '2025-12-21 07:16:23'),
	(40, 'Figure - Oguri Cap 20cm - Uma Musume Pretty Darby', 'Figure - Oguri Cap 20cm', 1500000, 2, 'merch', 'products/XChPNDWjecViAYypKyyPEjzfHUhm9u8OoKyRTPkx.webp', '2025-12-21 07:18:07', '2026-07-06 22:22:43'),
	(41, 'Figure - Orfevre - Uma Musume Pretty Darby', 'Figure Orfevre', 1890000, 0, 'merch', 'products/rgF3TYAS9k4Q6CYJhF3iKhC6lfmlHn19elexLMas.webp', '2025-12-21 07:19:16', '2026-07-06 13:11:59'),
	(42, 'Figure - Kitasan Black - Uma Musume Pretty Darby', 'Figure Kitasan Black', 2500000, 3, 'merch', 'products/97BuHN4hKl5cHQARmRtUb0Mhux8pNzMAcuCOMVzL.webp', '2025-12-21 07:20:02', '2026-07-06 22:54:16'),
	(43, 'Nendoroid - Tamamo Cross - Uma Musume Pretty Darby', 'nyenyenye bapakna tukang batagor', 20000000, 1, 'merch', 'products/Oj0IksZfQW12n1aDilCEodXnSUa1mUGloJ3M30j8.webp', '2025-12-21 07:20:57', '2026-06-19 11:12:40'),
	(44, 'Hololive English - Keyboard', 'Hololive English Keyboard', 1250000, 0, 'elektronik', 'products/EnkVyV3N6evIbjmPMAihRIUIK5GYkoxgLAlEc0MJ.webp', '2025-12-21 07:21:56', '2026-07-04 02:29:55');

-- membuang struktur untuk table kyou_db.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  KEY `reviews_order_id_foreign` (`order_id`),
  CONSTRAINT `reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.reviews: ~17 rows (lebih kurang)
INSERT INTO `reviews` (`id`, `user_id`, `order_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
	(1, 3, 2, 3, 5, 'keren banget', '2025-12-11 04:34:40', '2025-12-11 04:34:40'),
	(2, 3, 3, 3, 5, 'GG banget bang', '2025-12-11 04:43:03', '2025-12-11 04:43:03'),
	(3, 3, 4, 1, 5, 'gundam GG', '2025-12-11 04:45:15', '2025-12-11 04:45:15'),
	(4, 3, 5, 2, 5, 'cantik', '2025-12-12 09:31:55', '2025-12-12 09:31:55'),
	(5, 3, 7, 1, 5, 'anjay keren sekali', '2025-12-12 20:38:03', '2025-12-12 20:38:03'),
	(6, 4, 8, 2, 5, 'waifi gwe', '2025-12-12 20:39:56', '2025-12-12 20:39:56'),
	(7, 4, 9, 2, 5, 'dendi keren', '2025-12-12 20:54:25', '2025-12-12 20:54:25'),
	(8, 4, 10, 3, 5, 'keren', '2025-12-12 21:22:03', '2025-12-12 21:22:03'),
	(9, 4, 11, 1, 5, 'keren', '2025-12-15 11:02:43', '2025-12-15 11:02:43'),
	(10, 3, 19, 28, 5, 'Waifu saya', '2025-12-16 03:57:32', '2025-12-16 03:57:32'),
	(11, 3, 20, 29, 5, 'posternya keren', '2025-12-17 06:02:39', '2025-12-17 06:02:39'),
	(14, 3, 27, 29, 5, 'Anime kesukaan dika', '2025-12-21 06:19:24', '2025-12-21 06:19:24'),
	(15, 3, 43, 42, 5, 'MY ISTRI', '2025-12-21 23:56:19', '2025-12-21 23:56:19'),
	(16, 3, 44, 41, 5, 'istri gw cantik', '2025-12-22 06:36:11', '2025-12-22 06:36:11'),
	(17, 11, 53, 41, 1, 'barang belum sampai', '2026-06-19 11:10:50', '2026-06-19 11:10:50'),
	(18, 3, 55, 44, 5, 'keren', '2026-07-01 21:37:40', '2026-07-01 21:37:40'),
	(19, 3, 65, 42, 5, 'Keren', '2026-07-06 22:28:12', '2026-07-06 22:28:12');

-- membuang struktur untuk table kyou_db.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.sessions: ~1 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('MG95Egmhqu6GAFpB4A2VrtJWUCq7oh9CMT9RvM50', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMkdRZk1NSnF6YXJGd1JyajlMVzRnSDFIOWRaYXNEamJLTXc4S0ZpOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9lY29tbWVyY2UxLnRlc3QvcHJvZHVjdC80MyI7czo1OiJyb3V0ZSI7czoxMjoicHJvZHVjdC5zaG93Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1783419747);

-- membuang struktur untuk table kyou_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel kyou_db.users: ~10 rows (lebih kurang)
INSERT INTO `users` (`id`, `name`, `email`, `image`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Test User', 'test@example.com', NULL, 'user', '2025-12-11 04:24:05', '$2y$12$dSIIJTdtrbDYke81ARyyUeaIZQ1LmGWISmgewSlGAS/gGE4l3O3ju', 'wQHVeQKuzK', '2025-12-11 04:24:06', '2025-12-11 04:24:06'),
	(3, 'zacky', 'tes01@gmail.com', 'profiles/Rm2BmU7PEQ9O13s50MaGBIm5N9Vb6gbzATa76ixc.jpg', 'admin', NULL, '$2y$12$PPngUYXfVwNw2gedT19CduWAYVjigvGfy1ip4fn7cdih1wBfQARXi', 'YNeHJMDZMdvWPTGY0Pu5QcWYwrOzfTbKaXhec0f8ZSjakCxORtJfnLIB4Uy8', '2025-12-11 04:27:32', '2026-07-01 21:39:43'),
	(4, 'farid', 'tes02@gmail.com', 'profiles/Oi4byEWWgR3MYOdptIdVgezwzS3n9jT0ln5ahrGO.jpg', 'user', NULL, '$2y$12$LGXYJcoWHZbsCOP0tpTaOOJTI0roAluDgjFWbHdufZ43KWt5Zs912', NULL, '2025-12-11 04:47:35', '2025-12-17 06:48:56'),
	(5, 'DIKA', 'tes04@gmail.com', NULL, 'user', NULL, '$2y$12$LITBtfNILKBAdELIUq0uc.OoOvuKu6e5N/bRZugRTlqyzROVx0HxS', NULL, '2025-12-17 21:14:54', '2025-12-17 21:14:54'),
	(6, 'ABI', 'tes05@gmail.com', 'profiles/U48qxIuB1A0mwI8YcdiQoj8zBCXYfX84MT6D82oc.jpg', 'user', NULL, '$2y$12$fBCEcL3Z7xAesM6ddO8cJOdafeeTd8SkXp/ea0fWymuChxDLXgzSe', NULL, '2025-12-17 21:17:28', '2025-12-17 21:20:29'),
	(7, 'Faiz', 'tes06@gmail.com', NULL, 'user', NULL, '$2y$12$nHzEWc.DOwxYHwcEa/SsgOZKCbucz38FbRuWNLD1rFDAzXjx5MkD.', NULL, '2025-12-20 22:56:21', '2025-12-20 22:56:21'),
	(8, 'sela', 'tes07@gmail.com', NULL, 'user', NULL, '$2y$12$fexkNe16o8KIBGUM1P6ji..t/rx92e64hItrf35iBEB3kb2b9FGd6', NULL, '2025-12-22 06:28:06', '2025-12-22 06:28:06'),
	(9, 'Rindaman', 'tes08@gmail.com', NULL, 'admin', NULL, '$2y$12$wzg8IFKIl9zAYcAG/FO3uehmfPvIMp5MxTBAtoFuWzeXdbjw8USOO', NULL, '2025-12-22 06:56:33', '2025-12-22 06:56:33'),
	(10, 'zack', 'testakun01@gmail.com', NULL, 'admin', NULL, '$2y$12$5FOmo5RrgO.8hZsmHuTV7Oo2G7/jl10HfDyHpM2JDgaDLr3XEE2zm', NULL, '2026-06-18 04:32:48', '2026-06-18 04:32:48'),
	(11, 'Reza', 'reza@gmail.com', 'profiles/Nr2zmCNO3AQP2rytKe26Je257hic6ZzrsHDG4Vn6.jpg', 'user', NULL, '$2y$12$qSySCS45OLqNW836KLg.ueY9F11xC7AkPRcH/vmPWs/PvfTF6Y.ly', NULL, '2026-06-19 11:05:35', '2026-06-19 11:06:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
