-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 14 май 2025 в 11:06
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_2503`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
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
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add Позиция в количката', 8, 'add_cartitem'),
(30, 'Can change Позиция в количката', 8, 'change_cartitem'),
(31, 'Can delete Позиция в количката', 8, 'delete_cartitem'),
(32, 'Can view Позиция в количката', 8, 'view_cartitem'),
(33, 'Can add Количка', 9, 'add_cart'),
(34, 'Can change Количка', 9, 'change_cart'),
(35, 'Can delete Количка', 9, 'delete_cart'),
(36, 'Can view Количка', 9, 'view_cart'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$1YEcMx6JidSrk9C4q4xStP$gFZAp1U6NJfRLxdpWXKe5H6MfJ4KP0JESg660JYQtdI=', '2025-04-03 14:36:31.202246', 1, 'dzi_25', '', '', '', 1, 1, '2025-03-31 18:20:38.869975');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
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

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-04-01 17:24:51.605867', '1', 'Мъжка тениска', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-04-01 17:25:35.541789', '2', 'Мъжка тениска', 1, '[{\"added\": {}}]', 7, 1),
(3, '2025-04-01 17:26:24.621838', '3', 'Лятна рокля', 1, '[{\"added\": {}}]', 7, 1),
(4, '2025-04-01 17:26:48.372872', '4', 'Мъжка риза', 1, '[{\"added\": {}}]', 7, 1),
(5, '2025-04-01 17:27:19.306394', '5', 'Лаптоп', 1, '[{\"added\": {}}]', 7, 1),
(6, '2025-04-01 17:27:50.947232', '6', 'Компютър', 1, '[{\"added\": {}}]', 7, 1),
(7, '2025-04-01 17:28:14.410835', '7', 'Мобилен телефон', 1, '[{\"added\": {}}]', 7, 1),
(8, '2025-04-01 17:30:34.146988', '8', 'Обеци', 1, '[{\"added\": {}}]', 7, 1),
(9, '2025-04-01 17:31:02.547496', '9', 'Колие', 1, '[{\"added\": {}}]', 7, 1),
(10, '2025-04-01 17:31:49.392977', '10', 'Гривна', 1, '[{\"added\": {}}]', 7, 1),
(11, '2025-04-01 17:32:14.079613', '1', 'Мъжка тениска', 3, '', 7, 1),
(12, '2025-04-01 17:32:34.643245', '5', 'Лаптоп', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u043e\\u0432\\u0430 \\u0433\\u0440\\u0443\\u043f\\u0430\"]}}]', 7, 1),
(13, '2025-04-03 11:49:20.479867', '11', 'Мъжка риза', 1, '[{\"added\": {}}]', 7, 1),
(14, '2025-04-03 11:49:51.285419', '12', 'Дамска рокля', 1, '[{\"added\": {}}]', 7, 1),
(15, '2025-04-03 11:50:29.588303', '13', 'Мъжка риза', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'main', 'cart'),
(8, 'main', 'cartitem'),
(10, 'main', 'order'),
(11, 'main', 'orderitem'),
(7, 'main', 'product'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-03-31 18:19:51.977277'),
(2, 'auth', '0001_initial', '2025-03-31 18:19:52.402939'),
(3, 'admin', '0001_initial', '2025-03-31 18:19:52.548488'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-03-31 18:19:52.555232'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-31 18:19:52.563301'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-03-31 18:19:52.626099'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-03-31 18:19:52.669384'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-03-31 18:19:52.678385'),
(9, 'auth', '0004_alter_user_username_opts', '2025-03-31 18:19:52.683406'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-03-31 18:19:52.717469'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-03-31 18:19:52.721513'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-31 18:19:52.726527'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-03-31 18:19:52.736923'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-31 18:19:52.749069'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-03-31 18:19:52.760502'),
(16, 'auth', '0011_update_proxy_permissions', '2025-03-31 18:19:52.765796'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-31 18:19:52.777347'),
(18, 'sessions', '0001_initial', '2025-03-31 18:19:52.795909'),
(19, 'main', '0001_initial', '2025-04-01 17:07:43.590987'),
(20, 'main', '0002_alter_product_options_alter_product_description_and_more', '2025-04-01 17:24:40.385152'),
(21, 'main', '0003_cart_cartitem', '2025-04-03 14:18:19.689814'),
(22, 'main', '0004_order_orderitem', '2025-04-04 00:56:41.204236');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('366dnp8t9hsq314iqsix6riggskmxriz', 'e30:1u839l:RCnyj3RsJHxhsnbaKhPSu3xH1pyvPxs9glA8ayde7nI', '2025-04-24 20:56:49.111301'),
('akf27s7uorakrszvoh3esy9yh73yoh4m', 'e30:1u7WVb:nd1SPafswFSfiM5M7rzoWDtqr4m-tOTJuba-CqM8y-4', '2025-04-23 10:05:11.723634'),
('izkt4h8yga0hq151dgbqv15u7qcc83rp', 'e30:1uF81z:5gxSJZBFjQCT4ib82NiJRloz_XUj8Oc-czrwyb5AaEI', '2025-05-14 09:34:03.873238'),
('ld19tw2hu0v6x40j1ma2f8yphr3le0ja', 'e30:1u0MXv:zfkaWQTEt91yrWA4Ad1zBKASth8_c-WFWnjYYV3vJGY', '2025-04-03 16:01:59.349204'),
('s8s3mx4w1xsf59msu0hbfweh2gjajdyb', 'e30:1u80no:YuGnDFowoAeCi3BoFeey3IkQ7JIWOcFjKTy1om5tT6U', '2025-04-24 18:26:00.681052'),
('yjjkc9nxyde7kfx3vrah3dye7o5qjggn', 'e30:1u4bqI:LjdMEPCeDY3Sy0T2cscMAD5zt5C1ZgB1CIJMCuLc-LM', '2025-04-15 09:10:30.945409');

-- --------------------------------------------------------

--
-- Структура на таблица `main_cart`
--

DROP TABLE IF EXISTS `main_cart`;
CREATE TABLE `main_cart` (
  `id` bigint(20) NOT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_cart`
--

INSERT INTO `main_cart` (`id`, `session_id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, NULL, '2025-04-03 14:24:17.450131', '2025-04-03 14:24:17.450131', 1),
(2, 'aj289cq2mn74bhj7t0bdxp9lyh9y2c75', '2025-04-03 14:29:14.278822', '2025-04-03 14:29:14.278822', NULL),
(3, '8snmg5q9lzfeuymqkj2tsxu2om1d90ea', '2025-04-03 14:30:46.540272', '2025-04-03 14:30:46.540272', NULL),
(4, 'ld19tw2hu0v6x40j1ma2f8yphr3le0ja', '2025-04-03 14:38:25.772506', '2025-04-03 14:38:25.772506', NULL),
(5, 'yjjkc9nxyde7kfx3vrah3dye7o5qjggn', '2025-04-15 08:12:49.112762', '2025-04-15 08:12:49.112762', NULL),
(6, 'akf27s7uorakrszvoh3esy9yh73yoh4m', '2025-04-23 09:35:11.604638', '2025-04-23 09:35:11.604638', NULL),
(7, 's8s3mx4w1xsf59msu0hbfweh2gjajdyb', '2025-04-24 17:46:25.399189', '2025-04-24 17:46:25.399189', NULL),
(8, '366dnp8t9hsq314iqsix6riggskmxriz', '2025-04-24 19:25:40.244447', '2025-04-24 19:25:40.244447', NULL),
(9, 'izkt4h8yga0hq151dgbqv15u7qcc83rp', '2025-05-14 09:04:03.863236', '2025-05-14 09:04:03.863236', NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `main_cartitem`
--

DROP TABLE IF EXISTS `main_cartitem`;
CREATE TABLE `main_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_cartitem`
--

INSERT INTO `main_cartitem` (`id`, `quantity`, `cart_id`, `product_id`) VALUES
(1, 1, 1, 11),
(2, 1, 1, 3),
(3, 1, 2, 6),
(4, 1, 2, 10),
(5, 1, 2, 12),
(6, 3, 4, 3),
(8, 1, 5, 2),
(9, 1, 7, 12),
(10, 1, 8, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `main_order`
--

DROP TABLE IF EXISTS `main_order`;
CREATE TABLE `main_order` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `main_orderitem`
--

DROP TABLE IF EXISTS `main_orderitem`;
CREATE TABLE `main_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `main_product`
--

DROP TABLE IF EXISTS `main_product`;
CREATE TABLE `main_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `group` smallint(5) UNSIGNED NOT NULL CHECK (`group` >= 0),
  `product_image` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_product`
--

INSERT INTO `main_product` (`id`, `name`, `group`, `product_image`, `price`, `description`) VALUES
(2, 'Мъжка тениска', 1, 'product_image/tshirt-img_WcloFZY.png', 25.32, '100% памук'),
(3, 'Лятна рокля', 1, 'product_image/women-clothes-img.png', 99.99, ''),
(4, 'Мъжка риза', 1, 'product_image/dress-shirt-img.png', 55.44, ''),
(5, 'Лаптоп', 2, 'product_image/laptop-img.png', 999.00, ''),
(6, 'Компютър', 2, 'product_image/computer-img.png', 678.99, ''),
(7, 'Мобилен телефон', 2, 'product_image/mobile-img.png', 345.23, ''),
(8, 'Обеци', 3, 'product_image/jhumka-img.png', 123.45, 'чисто злато'),
(9, 'Колие', 3, 'product_image/neklesh-img.png', 1234.22, ''),
(10, 'Гривна', 3, 'product_image/kangan-img.png', 218.88, ''),
(11, 'Мъжка риза', 1, 'product_image/p2.png', 25.25, ''),
(12, 'Дамска рокля', 1, 'product_image/p5.png', 88.88, ''),
(13, 'Мъжка риза', 1, 'product_image/p11.png', 33.33, '');

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `main_cart`
--
ALTER TABLE `main_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индекси за таблица `main_cartitem`
--
ALTER TABLE `main_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_cartitem_cart_id_8357cf81_fk_main_cart_id` (`cart_id`),
  ADD KEY `main_cartitem_product_id_777783fc_fk_main_product_id` (`product_id`);

--
-- Индекси за таблица `main_order`
--
ALTER TABLE `main_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_order_user_id_f3a58861_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `main_orderitem`
--
ALTER TABLE `main_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_orderitem_order_id_72ea9725_fk_main_order_id` (`order_id`),
  ADD KEY `main_orderitem_product_id_b90dba64_fk_main_product_id` (`product_id`);

--
-- Индекси за таблица `main_product`
--
ALTER TABLE `main_product`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `main_cart`
--
ALTER TABLE `main_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `main_cartitem`
--
ALTER TABLE `main_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `main_order`
--
ALTER TABLE `main_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_orderitem`
--
ALTER TABLE `main_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_product`
--
ALTER TABLE `main_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `main_cart`
--
ALTER TABLE `main_cart`
  ADD CONSTRAINT `main_cart_user_id_53cf8b47_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `main_cartitem`
--
ALTER TABLE `main_cartitem`
  ADD CONSTRAINT `main_cartitem_cart_id_8357cf81_fk_main_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `main_cart` (`id`),
  ADD CONSTRAINT `main_cartitem_product_id_777783fc_fk_main_product_id` FOREIGN KEY (`product_id`) REFERENCES `main_product` (`id`);

--
-- Ограничения за таблица `main_order`
--
ALTER TABLE `main_order`
  ADD CONSTRAINT `main_order_user_id_f3a58861_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `main_orderitem`
--
ALTER TABLE `main_orderitem`
  ADD CONSTRAINT `main_orderitem_order_id_72ea9725_fk_main_order_id` FOREIGN KEY (`order_id`) REFERENCES `main_order` (`id`),
  ADD CONSTRAINT `main_orderitem_product_id_b90dba64_fk_main_product_id` FOREIGN KEY (`product_id`) REFERENCES `main_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
