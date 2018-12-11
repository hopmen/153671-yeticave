CREATE DATABASE `153671-yeticave`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE `153671-yeticave`;

CREATE TABLE categories (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL
);

CREATE TABLE lots (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  `description` TEXT DEFAULT NULL,
  `img_path` VARCHAR(255) NOT NULL,
  `price` INT UNSIGNED NOT NULL,
  `bets_step` INT UNSIGNED NOT NULL,
  `start_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `end_time` TIMESTAMP DEFAULT NULL,
  `author_id` INT UNSIGNED NOT NULL,
  `winner_id` INT UNSIGNED DEFAULT NULL
);

CREATE TABLE bets (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `price` INT UNSIGNED NOT NULL,
  `author_id` INT UNSIGNED NOT NULL,
  `lot_id` INT UNSIGNED NOT NULL
);

CREATE TABLE users (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `password` VARCHAR(255) NOT NULL,
  `avatar_path` VARCHAR(255) DEFAULT NULL,
  `contact_info` VARCHAR(255) DEFAULT NULL
);