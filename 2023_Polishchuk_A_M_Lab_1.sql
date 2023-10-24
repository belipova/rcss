CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  'title' varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street1` varchar(255) DEFAULT NULL,
  `country_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_country_fk` (`country_id`),
  KEY `address_city_fk` (`city_id`),
  CONSTRAINT `address_country_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `address_city_fk` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `buyer` (
  `buyer_id` int NOT NULL AUTO_INCREMENT,
  `photo_id` binary(16) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `day_variant` (
  `day_variant_id` int NOT NULL AUTO_INCREMENT,
  `variant_name` varchar(50) NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `custom_date` date DEFAULT NULL,
  PRIMARY KEY (`day_variant_id`),
  KEY `day_variants_created_by_fkey` (`created_by`),
  KEY `day_variants_updated_by_fkey` (`updated_by`),
  CONSTRAINT `day_variants_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `day_variants_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `distributor` (
  `distributor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`distributor_id`),
  KEY `address_distributor_fk` (`address_id`),
  CONSTRAINT `address_distributor_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(10) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `store_worked_at_id` int DEFAULT NULL,
  `image_id` binary(16) DEFAULT NULL,
  `home_address_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `employee_created_by_fkey` (`created_by`),
  KEY `employee_updated_by_fkey` (`updated_by`),
  KEY `employee_address_home_fkey` (`home_address_id`),
  KEY `employee_store_work_at_id_fk` (`store_worked_at_id`),
  CONSTRAINT `employee_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `employee_store_work_at_id_fk` FOREIGN KEY (`store_worked_at_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `employee_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `employee_address_home_fkey` FOREIGN KEY (`home_address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_guid` binary(16) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `image_created_by_fkey` (`created_by`),
  CONSTRAINT `image_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `date_of_manufacture` date DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `color_fk` (`color_id`),
  CONSTRAINT `color_fk` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `payment_type` (
  `payment_type_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `classification_id` int NOT NULL,
  `price_usd` decimal(19,4) NOT NULL,
  `quantity` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `distributor_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_distributor_fk` (`distributor_id`),
  KEY `product_classification_id_fkey` (`classification_id`),
  KEY `product_created_by_fkey` (`created_by`),
  KEY `product_updated_by_fkey` (`updated_by`),
  CONSTRAINT `product_classification_id_fkey` FOREIGN KEY (`classification_id`) REFERENCES `product_classification` (`classification_id`),
  CONSTRAINT `product_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `product_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `product_distributor_fk` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_classification` (
  `classification_id` int NOT NULL AUTO_INCREMENT,
  `classification_name` varchar(255) NOT NULL,
  PRIMARY KEY (`classification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_item` (
  `product_item_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  PRIMARY KEY (`product_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_type_id` int NOT NULL,
  `store_id` int NOT NULL,
  `employee_performed_transaction` int NOT NULL,
  `note` text,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(19,4) NOT NULL,
  `buyer_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `product_transaction_buyer_fk` (`buyer_id`),
  KEY `product_transaction_created_by_fkey` (`created_by`),
  KEY `product_transaction_employee_performed_transaction_fkey` (`employee_performed_transaction`),
  KEY `product_transaction_store_id_fkey` (`store_id`),
  KEY `product_transaction_transaction_type_id_fkey` (`transaction_type_id`),
  KEY `product_transaction_updated_by_fkey` (`updated_by`),
  CONSTRAINT `product_transaction_buyer_fk` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  CONSTRAINT `product_transaction_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `product_transaction_employee_performed_transaction_fkey` FOREIGN KEY (`employee_performed_transaction`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `product_transaction_store_id_fkey` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `product_transaction_transaction_type_id_fkey` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`),
  CONSTRAINT `product_transaction_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product_transaction_info` (
  `product_transaction_info_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price_per_item` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`product_transaction_info_id`),
  KEY `product_transaction_item_product_fk` (`product_id`),
  KEY `product_transaction_item_transaction_fk` (`transaction_id`),
  CONSTRAINT `product_transaction_item_product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_transaction_item_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `product_transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `receipt` (
  `receipt_id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `receipt_transaction_fk` (`transaction_id`),
  CONSTRAINT `receipt_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `product_transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logo_id` binary(16) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `store_address_fk` (`address_id`),
  KEY `store_country_fk` (`country_id`),
  CONSTRAINT `store_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `store_country_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `store_hour` (
  `store_hour_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `day_variant_id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_hour_id`),
  KEY `store_hour_created_by_fkey` (`created_by`),
  KEY `store_hour_day_variant_id_fkey` (`day_variant_id`),
  KEY `store_hour_store_id_fkey` (`store_id`),
  KEY `store_hour_updated_by_fkey` (`updated_by`),
  CONSTRAINT `store_hour_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `store_hour_day_variant_id_fkey` FOREIGN KEY (`day_variant_id`) REFERENCES `day_variant` (`day_variant_id`),
  CONSTRAINT `store_hour_store_id_fkey` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `store_hour_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transaction_type` (
  `transaction_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `day_variant` VALUES (1,'Working Days',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(2,'Weekends',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(3,'State Holidays',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(4,'Church Holidays',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL);
INSERT INTO `employee` VALUES (1,'ADMIN001','Admin','Super','User','1980-01-01','Admin','admin','admin_password',1,1,'2023-09-16 17:53:26','2023-09-16 17:53:26',NULL,NULL,NULL,NULL,NULL),(4,'ADMIN002','Polishchuk','Anna','Mykolaivna','2004-01-31','w','e','w',1,1,'2023-09-20 17:16:27','2023-09-20 17:16:27',1,NULL,NULL,NULL,NULL);
INSERT INTO `payment_type` VALUES (1,'cash'),(2,'card'),(3,'check');
INSERT INTO `product` VALUES (1,'Ceramic Sink',1,100.0000,25,1,1,'2023-09-16 17:57:58','2023-09-16 17:57:58',NULL,NULL),(2,'Door handle',4,20.0000,100,4,4,'2023-09-20 17:33:59','2023-09-20 17:33:59',NULL,NULL);
INSERT INTO `product_classification` VALUES (1,'Sanitary Ware'),(2,'Pipes'),(3,'Windows'),(4,'Doors'),(5,'Ceramic Tiles'),(6,'Silicate Bricks'),(7,'Facade Bricks'),(8,'Fire-Resistant Bricks');
INSERT INTO `store` VALUES (1,'BuidMarket','0973242447',4,4,'2023-09-20 17:27:29','2023-09-20 17:27:29',NULL,NULL,NULL),(2,'BudMaterial','0688321330',1,1,'2023-09-20 17:29:18','2023-09-20 17:29:18',NULL,NULL,NULL);
INSERT INTO `store_hour` VALUES (1,1,1,'07:00:00','18:00:00',4,4,'2023-09-20 17:40:41','2023-09-20 17:40:41'),(2,2,2,'09:00:00','16:00:00',1,1,'2023-09-20 17:40:41','2023-09-20 17:40:41');
INSERT INTO `transaction_type` VALUES (1,'Sale'),(2,'Purchase');
