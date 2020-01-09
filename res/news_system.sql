CREATE DATABASE `news_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `news_system`;

CREATE TABLE news(
`news_id` INT NOT NULL AUTO_INCREMENT,
`news_title` VARCHAR(100) NOT NULL,
`news_content` TEXT NOT NULL,
`news_post_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
`news_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`keywords` VARCHAR(30),
`author_id` VARCHAR(100),
`news_category` VARCHAR(30),
`view_count` INT NOT NULL DEFAULT 0,
 PRIMARY KEY (`news_id`)
);

CREATE TABLE author(
`author_id` VARCHAR(100) NOT NULL,
`author_password` VARCHAR(30) NOT NULL,
`author_name` VARCHAR(30) NOT NULL,
PRIMARY KEY(`author_id`)
);

CREATE TABLE administrator(
 `admin_id` VARCHAR(100) NOT NULL,
 `admin_password` VARCHAR(30) NOT NULL,
 PRIMARY KEY(`admin_id`)
);