-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mariadb-11.2
-- Время создания: Авг 06 2024 г., 20:20
-- Версия сервера: 11.2.2-MariaDB
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `expohack`
--

-- --------------------------------------------------------

--
-- Структура таблицы `car_dealership`
--

CREATE TABLE `car_dealership` (
  `car_dealership_id` int(11) NOT NULL,
  `car_brand` varchar(64) DEFAULT NULL,
  `car_model` varchar(64) DEFAULT NULL,
  `car_price` float DEFAULT NULL,
  `year_of_manufacture` int(11) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(128) DEFAULT NULL,
  `room_type` int(11) DEFAULT NULL,
  `stay_duration` int(11) DEFAULT NULL,
  `check_in_date` datetime DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `insurance_types`
--

CREATE TABLE `insurance_types` (
  `insurance_id` int(11) NOT NULL,
  `insurance_period` int(11) DEFAULT NULL,
  `coverage_amount` float DEFAULT NULL,
  `premium_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `interaction_metadata`
--

CREATE TABLE `interaction_metadata` (
  `interaction_metadata_id` int(11) NOT NULL,
  `source_of_request` varchar(64) DEFAULT NULL,
  `request_status` varchar(64) DEFAULT NULL,
  `communication_type` varchar(64) DEFAULT NULL,
  `sales_path` varchar(64) DEFAULT NULL,
  `additional_services` varchar(64) DEFAULT NULL,
  `sales_manager` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"manager_name": "", "manager_id": ""}' CHECK (json_valid(`sales_manager`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `leasing`
--

CREATE TABLE `leasing` (
  `leasing_id` int(11) NOT NULL,
  `initial_payment` float DEFAULT NULL,
  `monthly_payment` float DEFAULT NULL,
  `interest_rate` float DEFAULT NULL,
  `leasing_period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `logging_analytics`
--

CREATE TABLE `logging_analytics` (
  `log_id` int(11) NOT NULL,
  `action_log` varchar(256) DEFAULT NULL,
  `change_history` varchar(256) DEFAULT NULL,
  `analytic_metrics` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `partner`
--

CREATE TABLE `partner` (
  `partner_id` int(11) NOT NULL,
  `partner_name` varchar(64) DEFAULT NULL,
  `partner_address` varchar(128) DEFAULT NULL,
  `partner_contact_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"phone": "", "email": ""}' CHECK (json_valid(`partner_contact_info`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `initial_payment` float DEFAULT NULL,
  `credit_amount` float DEFAULT NULL,
  `monthly_payment` float DEFAULT NULL,
  `interest_rate` float DEFAULT NULL,
  `credit_period` int(11) DEFAULT NULL,
  `credit_issue_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_types`
--

CREATE TABLE `payment_types` (
  `payment_type_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `room_types`
--

CREATE TABLE `room_types` (
  `room_type_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `satisfaction`
--

CREATE TABLE `satisfaction` (
  `satisfaction_id` int(11) NOT NULL,
  `nps` int(11) DEFAULT NULL,
  `csat` int(11) DEFAULT NULL,
  `ces` int(11) DEFAULT NULL,
  `client_comments` text DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `survey_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car_dealership`
--
ALTER TABLE `car_dealership`
  ADD PRIMARY KEY (`car_dealership_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Индексы таблицы `insurance_types`
--
ALTER TABLE `insurance_types`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Индексы таблицы `interaction_metadata`
--
ALTER TABLE `interaction_metadata`
  ADD PRIMARY KEY (`interaction_metadata_id`);

--
-- Индексы таблицы `leasing`
--
ALTER TABLE `leasing`
  ADD PRIMARY KEY (`leasing_id`);

--
-- Индексы таблицы `logging_analytics`
--
ALTER TABLE `logging_analytics`
  ADD PRIMARY KEY (`log_id`);

--
-- Индексы таблицы `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`partner_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Индексы таблицы `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`payment_type_id`);

--
-- Индексы таблицы `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Индексы таблицы `satisfaction`
--
ALTER TABLE `satisfaction`
  ADD PRIMARY KEY (`satisfaction_id`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `car_dealership`
--
ALTER TABLE `car_dealership`
  MODIFY `car_dealership_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `insurance_types`
--
ALTER TABLE `insurance_types`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `interaction_metadata`
--
ALTER TABLE `interaction_metadata`
  MODIFY `interaction_metadata_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `leasing`
--
ALTER TABLE `leasing`
  MODIFY `leasing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logging_analytics`
--
ALTER TABLE `logging_analytics`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner`
--
ALTER TABLE `partner`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `payment_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `room_types`
--
ALTER TABLE `room_types`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `satisfaction`
--
ALTER TABLE `satisfaction`
  MODIFY `satisfaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
