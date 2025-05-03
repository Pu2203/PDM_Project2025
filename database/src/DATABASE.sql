CREATE DATABASE IF NOT EXISTS digitalbuspass;
USE digitalbuspass;

CREATE TABLE `belongto` (
  `stop_id` int NOT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`route_id`,`stop_id`),
  KEY `stop_id` (`stop_id`),
  CONSTRAINT `belongto_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE,
  CONSTRAINT `belongto_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stop` (`stop_id`) ON DELETE CASCADE
);

CREATE TABLE `bus` (
  `bus_id` int NOT NULL,
  `license_plate` varchar(20) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` int NOT NULL,
  `capacity` int NOT NULL,
  `bus_status` varchar(50) NOT NULL,
  PRIMARY KEY (`bus_id`),
  UNIQUE KEY `license_plate` (`license_plate`),
  UNIQUE KEY `model` (`model`)
);

CREATE TABLE `buspass` (
  `pass_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `pass_type` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `QRCode` varchar(255) DEFAULT NULL,
  `pass_status` varchar(50) NOT NULL,
  `status_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  PRIMARY KEY (`pass_id`),
  UNIQUE KEY `QRCode` (`QRCode`),
  KEY `user_id` (`user_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `buspass_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `buspass_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE
);

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `total_items` int NOT NULL,
  `total_amount` float NOT NULL,
  `quantity_available` int NOT NULL,
  `cart_status` varchar(50) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
);

CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE,
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON DELETE CASCADE
);

CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `transaction_reference` varchar(100) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `buspass` (`pass_id`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE
);

CREATE TABLE `realtimelocation` (
  `location_id` int NOT NULL,
  `trip_id` int DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `direction` varchar(50) NOT NULL,
  `occupancy` int NOT NULL,
  `speed` float NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `realtimelocation_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON DELETE CASCADE
);

CREATE TABLE `route` (
  `route_id` int NOT NULL,
  `route_number` varchar(20) DEFAULT NULL,
  `route_name` varchar(100) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `distance` float NOT NULL,
  `operating_hours` varchar(50) NOT NULL,
  `route_status` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `route_number` (`route_number`)
);

CREATE TABLE `route_stop` (
  `route_stop_id` int NOT NULL,
  `route_id` int DEFAULT NULL,
  `stop_id` int DEFAULT NULL,
  `sequence_number` int NOT NULL,
  `direction` varchar(50) NOT NULL,
  `estimated_time` time NOT NULL,
  `distance_from_start` float NOT NULL,
  PRIMARY KEY (`route_stop_id`),
  KEY `route_id` (`route_id`),
  KEY `stop_id` (`stop_id`),
  CONSTRAINT `route_stop_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE,
  CONSTRAINT `route_stop_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stop` (`stop_id`) ON DELETE CASCADE
);

CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `route_id` int DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `frequency` varchar(50) NOT NULL,
  `day_type` varchar(50) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE
);

CREATE TABLE `stop` (
  `stop_id` int NOT NULL,
  `stop_name` varchar(100) NOT NULL,
  `stop_status` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `stop_latitude` float NOT NULL,
  `stop_longitude` float NOT NULL,
  PRIMARY KEY (`stop_id`)
);

CREATE TABLE `trip` (
  `trip_id` int NOT NULL,
  `route_id` int DEFAULT NULL,
  `bus_id` int DEFAULT NULL,
  `direction` varchar(50) NOT NULL,
  `trip_status` varchar(50) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `route_id` (`route_id`),
  KEY `bus_id` (`bus_id`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE,
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`) ON DELETE CASCADE
);

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `account_type` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_general_ci DEFAULT NULL,
  `user_phonenumber` varchar(15) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_password` (`user_password`),
  UNIQUE KEY `user_phonenumber` (`user_phonenumber`),
  UNIQUE KEY `gender` (`gender`),
  UNIQUE KEY `DoB` (`DoB`)
);









