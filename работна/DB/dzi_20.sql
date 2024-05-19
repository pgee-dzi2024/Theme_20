-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 19 май 2024 в 13:33
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
-- База данни: `dzi_20`
--

-- --------------------------------------------------------

--
-- Структура на таблица `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
CREATE TABLE `accounts_account` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `accounts_account`
--

INSERT INTO `accounts_account` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(1, 'pbkdf2_sha256$600000$sSQ5BeqIz7p2IGRJeTGcvT$im81lqlaMZFA1YT9Q53UaRhWavAh/LUlQu8fuFC9eD0=', '2024-05-19 11:29:05.811549', 1, 'admin', '', '', 1, 1, '2024-05-18 11:36:11.111068', ''),
(2, 'pbkdf2_sha256$600000$x9hYYZ8i3kNo5ezmb9JEiU$1AfQ+9FxNW3a3pndvTYvdKx77/k3t2Qs1c9HEe2jEpI=', '2024-05-19 08:51:23.460893', 0, 'mv_client1', '', '', 0, 1, '2024-05-18 11:43:01.037938', 'abv@abv.bg');

-- --------------------------------------------------------

--
-- Структура на таблица `accounts_account_groups`
--

DROP TABLE IF EXISTS `accounts_account_groups`;
CREATE TABLE `accounts_account_groups` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `accounts_account_user_permissions`
--

DROP TABLE IF EXISTS `accounts_account_user_permissions`;
CREATE TABLE `accounts_account_user_permissions` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_account'),
(22, 'Can change user', 6, 'change_account'),
(23, 'Can delete user', 6, 'delete_account'),
(24, 'Can view user', 6, 'view_account'),
(25, 'Can add film', 7, 'add_film'),
(26, 'Can change film', 7, 'change_film'),
(27, 'Can delete film', 7, 'delete_film'),
(28, 'Can view film', 7, 'view_film'),
(29, 'Can add show', 8, 'add_show'),
(30, 'Can change show', 8, 'change_show'),
(31, 'Can delete show', 8, 'delete_show'),
(32, 'Can view show', 8, 'view_show'),
(33, 'Can add banner', 9, 'add_banner'),
(34, 'Can change banner', 9, 'change_banner'),
(35, 'Can delete banner', 9, 'delete_banner'),
(36, 'Can view banner', 9, 'view_banner'),
(37, 'Can add booking', 10, 'add_booking'),
(38, 'Can change booking', 10, 'change_booking'),
(39, 'Can delete booking', 10, 'delete_booking'),
(40, 'Can view booking', 10, 'view_booking');

-- --------------------------------------------------------

--
-- Структура на таблица `booking_booking`
--

DROP TABLE IF EXISTS `booking_booking`;
CREATE TABLE `booking_booking` (
  `id` bigint(20) NOT NULL,
  `booking_code` varchar(100) NOT NULL,
  `seat_num` varchar(25) NOT NULL,
  `num_seats` smallint(5) UNSIGNED DEFAULT NULL CHECK (`num_seats` >= 0),
  `total` int(11) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `booked_date` datetime(6) DEFAULT NULL,
  `show_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `booking_booking`
--

INSERT INTO `booking_booking` (`id`, `booking_code`, `seat_num`, `num_seats`, `total`, `show_date`, `booked_date`, `show_id`, `user_id`) VALUES
(1, 'Random', 'A1,A2', 2, 40, '2024-05-20', '2024-05-19 09:13:19.267178', 2, 1),
(2, 'Random', 'A1,A2', 2, 40, '2024-05-20', '2024-05-19 09:24:23.386085', 2, 1);

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-19 09:12:33.676721', '2', 'Обливион@09:11 AM', 1, '[{\"added\": {}}]', 8, 1);

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
(6, 'accounts', 'account'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(10, 'booking', 'booking'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(9, 'staff', 'banner'),
(7, 'staff', 'film'),
(8, 'staff', 'show');

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
(1, 'contenttypes', '0001_initial', '2024-05-18 11:34:28.530576'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-18 11:34:28.604680'),
(3, 'auth', '0001_initial', '2024-05-18 11:34:29.009058'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-18 11:34:29.096026'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-18 11:34:29.103059'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-18 11:34:29.110051'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-18 11:34:29.117922'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-18 11:34:29.122583'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-18 11:34:29.128571'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-18 11:34:29.134570'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-18 11:34:29.141086'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-18 11:34:29.168600'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-18 11:34:29.176592'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-18 11:34:29.185802'),
(15, 'accounts', '0001_initial', '2024-05-18 11:34:29.623145'),
(16, 'admin', '0001_initial', '2024-05-18 11:34:29.796578'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-18 11:34:29.808069'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-18 11:34:29.815106'),
(19, 'staff', '0001_initial', '2024-05-18 11:34:29.989303'),
(20, 'booking', '0001_initial', '2024-05-18 11:34:30.159189'),
(21, 'sessions', '0001_initial', '2024-05-18 11:34:30.224693'),
(22, 'staff', '0002_alter_film_movie_genre_alter_film_movie_lang_and_more', '2024-05-18 13:05:30.532733'),
(23, 'staff', '0003_banner_photo_film_photo', '2024-05-19 08:17:00.437654'),
(24, 'staff', '0004_remove_banner_url_remove_film_url', '2024-05-19 08:35:39.994973');

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

-- --------------------------------------------------------

--
-- Структура на таблица `staff_banner`
--

DROP TABLE IF EXISTS `staff_banner`;
CREATE TABLE `staff_banner` (
  `id` bigint(20) NOT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `staff_film`
--

DROP TABLE IF EXISTS `staff_film`;
CREATE TABLE `staff_film` (
  `id` bigint(20) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `movie_genre` varchar(100) DEFAULT NULL,
  `movie_lang` varchar(100) DEFAULT NULL,
  `movie_year` int(11) DEFAULT NULL,
  `movie_plot` longtext DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `staff_film`
--

INSERT INTO `staff_film` (`id`, `movie_name`, `movie_genre`, `movie_lang`, `movie_year`, `movie_plot`, `date_added`, `photo`) VALUES
(1, 'Обливион', 'Фантастика', 'Английски', 2009, 'Действието се развива в далечното бъдеще', '2024-05-18', 'films/mv1.jpg'),
(2, 'Хари Потер', 'Фентази', 'английски', 2011, 'поредният филм от поредицата за Хари Потер', '2024-05-19', 'films/mv-it10.jpg'),
(3, 'Бруклин', 'драма', 'английски', 2020, 'действието се развива в Бруклин', '2024-05-19', 'films/series-img.jpg'),
(4, 'Защитници на галактиката', 'Фантастика', 'английски', 2017, 'Много симпатиен и добре направен филм', '2024-05-19', 'films/poster1.jpg');

-- --------------------------------------------------------

--
-- Структура на таблица `staff_show`
--

DROP TABLE IF EXISTS `staff_show`;
CREATE TABLE `staff_show` (
  `id` bigint(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL CHECK (`price` >= 0),
  `showtime` time(6) DEFAULT NULL,
  `movie_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `staff_show`
--

INSERT INTO `staff_show` (`id`, `start_date`, `end_date`, `price`, `showtime`, `movie_id`) VALUES
(2, '2024-05-16', '2024-05-31', 20, '09:11:59.000000', 1),
(3, '2024-05-24', '2024-05-30', 15, '09:15:00.000000', 2),
(4, '2024-05-24', '2024-05-30', 15, '16:00:00.000000', 2);

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `accounts_account`
--
ALTER TABLE `accounts_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индекси за таблица `accounts_account_groups`
--
ALTER TABLE `accounts_account_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_account_groups_account_id_group_id_f64165b0_uniq` (`account_id`,`group_id`),
  ADD KEY `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `accounts_account_user_permissions`
--
ALTER TABLE `accounts_account_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_account_user_pe_account_id_permission_id_9af93c14_uniq` (`account_id`,`permission_id`),
  ADD KEY `accounts_account_use_permission_id_24620205_fk_auth_perm` (`permission_id`);

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
-- Индекси за таблица `booking_booking`
--
ALTER TABLE `booking_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_booking_show_id_90e7fd93_fk_staff_show_id` (`show_id`),
  ADD KEY `booking_booking_user_id_e1eb6912_fk_accounts_account_id` (`user_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_account_id` (`user_id`);

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
-- Индекси за таблица `staff_banner`
--
ALTER TABLE `staff_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_banner_movie_id_18dd0add_fk_staff_film_id` (`movie_id`);

--
-- Индекси за таблица `staff_film`
--
ALTER TABLE `staff_film`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `staff_show`
--
ALTER TABLE `staff_show`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_show_movie_id_33c5bd66_fk_staff_film_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_account`
--
ALTER TABLE `accounts_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_account_groups`
--
ALTER TABLE `accounts_account_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_account_user_permissions`
--
ALTER TABLE `accounts_account_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `booking_booking`
--
ALTER TABLE `booking_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `staff_banner`
--
ALTER TABLE `staff_banner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_film`
--
ALTER TABLE `staff_film`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_show`
--
ALTER TABLE `staff_show`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `accounts_account_groups`
--
ALTER TABLE `accounts_account_groups`
  ADD CONSTRAINT `accounts_account_gro_account_id_52f14852_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  ADD CONSTRAINT `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `accounts_account_user_permissions`
--
ALTER TABLE `accounts_account_user_permissions`
  ADD CONSTRAINT `accounts_account_use_account_id_816f9bde_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  ADD CONSTRAINT `accounts_account_use_permission_id_24620205_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
-- Ограничения за таблица `booking_booking`
--
ALTER TABLE `booking_booking`
  ADD CONSTRAINT `booking_booking_show_id_90e7fd93_fk_staff_show_id` FOREIGN KEY (`show_id`) REFERENCES `staff_show` (`id`),
  ADD CONSTRAINT `booking_booking_user_id_e1eb6912_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Ограничения за таблица `staff_banner`
--
ALTER TABLE `staff_banner`
  ADD CONSTRAINT `staff_banner_movie_id_18dd0add_fk_staff_film_id` FOREIGN KEY (`movie_id`) REFERENCES `staff_film` (`id`);

--
-- Ограничения за таблица `staff_show`
--
ALTER TABLE `staff_show`
  ADD CONSTRAINT `staff_show_movie_id_33c5bd66_fk_staff_film_id` FOREIGN KEY (`movie_id`) REFERENCES `staff_film` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
