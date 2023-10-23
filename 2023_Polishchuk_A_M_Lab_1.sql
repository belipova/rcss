
CREATE TABLE `address` (
  `AddressId` int NOT NULL AUTO_INCREMENT,
  `Street1` varchar(255) DEFAULT NULL,
  `CountryId` int NOT NULL,
  `City` varchar(255) DEFAULT NULL,
  `ZipCode` int DEFAULT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `AddressCountry_fk` (`CountryId`),
  CONSTRAINT `AddressCountry_fk` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `buyer` (
  `BuyerId` int NOT NULL AUTO_INCREMENT,
  `PhotoId` binary(16) DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BuyerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `color` (
  `ColorId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ColorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `country` (
  `CountryId` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dayvariant` (
  `DayVariantId` int NOT NULL AUTO_INCREMENT,
  `VariantName` varchar(50) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CustomDate` date DEFAULT NULL,
  PRIMARY KEY (`DayVariantId`),
  KEY `DayVariants_CreatedBy_fkey` (`CreatedBy`),
  KEY `DayVariants_UpdatedBy_fkey` (`UpdatedBy`),
  CONSTRAINT `DayVariants_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `DayVariants_UpdatedBy_fkey` FOREIGN KEY (`UpdatedBy`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `dayvariant` VALUES (1,'Working Days',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(2,'Weekends',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(3,'State Holidays',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL),(4,'Church Holidays',NULL,NULL,'2023-09-16 17:54:56','2023-09-16 17:54:56',NULL);

CREATE TABLE `distrybutor` (
  `DistrybutorId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DistrybutorId`),
  KEY `AddressDistrybutor_fk` (`AddressId`),
  CONSTRAINT `AddressDistrybutor_fk` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
  `EmployeeId` int NOT NULL AUTO_INCREMENT,
  `EmployeeCode` varchar(10) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StoreWorkedAtId` int DEFAULT NULL,
  `ImageId` binary(16) DEFAULT NULL,
  `HomeAddressId` int DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `Employee_CreatedBy_fkey` (`CreatedBy`),
  KEY `Employee_UpdatedBy_fkey` (`UpdatedBy`),
  KEY `employeeAddresshome_flk` (`HomeAddressId`),
  KEY `employee_storeworkatid_fk` (`StoreWorkedAtId`),
  CONSTRAINT `Employee_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `employee_storeworkatid_fk` FOREIGN KEY (`StoreWorkedAtId`) REFERENCES `store` (`StoreId`),
  CONSTRAINT `Employee_UpdatedBy_fkey` FOREIGN KEY (`UpdatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `employeeAddresshome_flk` FOREIGN KEY (`HomeAddressId`) REFERENCES `address` (`AddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `employee` VALUES (1,'ADMIN001','Admin','Super','User','1980-01-01','Admin','admin','admin_password',1,1,'2023-09-16 17:53:26','2023-09-16 17:53:26',NULL,NULL,NULL,NULL,NULL),(4,'ADMIN002','Polishchuk','Anna','Mykolaivna','2004-01-31','w','e','w',1,1,'2023-09-20 17:16:27','2023-09-20 17:16:27',1,NULL,NULL,NULL,NULL);

CREATE TABLE `image` (
  `ImageId` int NOT NULL AUTO_INCREMENT,
  `ImageGuid` binary(16) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ImageId`),
  KEY `Image_CreatedBy_fkey` (`CreatedBy`),
  CONSTRAINT `Image_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `item` (
  `ItemId` int NOT NULL AUTO_INCREMENT,
  `DateOfManufacture` date DEFAULT NULL,
  `Note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `material` (
  `MaterialId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Color` int DEFAULT NULL,
  PRIMARY KEY (`MaterialId`),
  KEY `Color_fk` (`Color`),
  CONSTRAINT `Color_fk` FOREIGN KEY (`Color`) REFERENCES `color` (`ColorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `paymenttype` (
  `PaymentTypeId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PaymentTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `paymenttype` VALUES (1,'cash'),(2,'card'),(3,'check');

CREATE TABLE `product` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `ClassificationId` int NOT NULL,
  `PriceUsd` decimal(19,4) NOT NULL,
  `Quantity` int NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ExpirationDate` timestamp NULL DEFAULT NULL,
  `DistrybutonId` int DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `ProductDistrybutor_fk` (`DistrybutonId`),
  KEY `Product_ClassificationId_fkey` (`ClassificationId`),
  KEY `Product_CreatedBy_fkey` (`CreatedBy`),
  KEY `Product_UpdatedBy_fkey` (`UpdatedBy`),
  CONSTRAINT `Product_ClassificationId_fkey` FOREIGN KEY (`ClassificationId`) REFERENCES `productclassification` (`ClassificationId`),
  CONSTRAINT `Product_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `Product_UpdatedBy_fkey` FOREIGN KEY (`UpdatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `ProductDistrybutor_fk` FOREIGN KEY (`DistrybutonId`) REFERENCES `distrybutor` (`DistrybutorId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product` VALUES (1,'Ceramic Sink',1,100.0000,25,1,1,'2023-09-16 17:57:58','2023-09-16 17:57:58',NULL,NULL),(2,'Door handle',4,20.0000,100,4,4,'2023-09-20 17:33:59','2023-09-20 17:33:59',NULL,NULL);

CREATE TABLE `productclassification` (
  `ClassificationId` int NOT NULL AUTO_INCREMENT,
  `ClassificationName` varchar(255) NOT NULL,
  PRIMARY KEY (`ClassificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `productclassification` VALUES (1,'Sanitary Ware'),(2,'Pipes'),(3,'Windows'),(4,'Doors'),(5,'Ceramic Tiles'),(6,'Silicate Bricks'),(7,'Facade Bricks'),(8,'Fire-Resistant Bricks');

CREATE TABLE `productitem` (
  `ProductItemId` int NOT NULL AUTO_INCREMENT,
  `ItemId` int NOT NULL,
  PRIMARY KEY (`ProductItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `producttransaction` (
  `TransactionId` int NOT NULL AUTO_INCREMENT,
  `TransactionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TransactionTypeId` int NOT NULL,
  `StoreId` int NOT NULL,
  `EmployeePerformedTransaction` int NOT NULL,
  `Note` text,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Price` decimal(19,4) NOT NULL,
  `BuyerId` int DEFAULT NULL,
  PRIMARY KEY (`TransactionId`),
  KEY `ProductTransaction_Buyer_fk` (`BuyerId`),
  KEY `ProductTransaction_CreatedBy_fkey` (`CreatedBy`),
  KEY `ProductTransaction_EmployeePerformedTransaction_fkey` (`EmployeePerformedTransaction`),
  KEY `ProductTransaction_StoreId_fkey` (`StoreId`),
  KEY `ProductTransaction_TransactionTypeId_fkey` (`TransactionTypeId`),
  KEY `ProductTransaction_UpdatedBy_fkey` (`UpdatedBy`),
  CONSTRAINT `ProductTransaction_Buyer_fk` FOREIGN KEY (`BuyerId`) REFERENCES `buyer` (`BuyerId`),
  CONSTRAINT `ProductTransaction_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `ProductTransaction_EmployeePerformedTransaction_fkey` FOREIGN KEY (`EmployeePerformedTransaction`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `ProductTransaction_StoreId_fkey` FOREIGN KEY (`StoreId`) REFERENCES `store` (`StoreId`),
  CONSTRAINT `ProductTransaction_TransactionTypeId_fkey` FOREIGN KEY (`TransactionTypeId`) REFERENCES `transactiontype` (`TransactionTypeId`),
  CONSTRAINT `ProductTransaction_UpdatedBy_fkey` FOREIGN KEY (`UpdatedBy`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `producttransactioninfo` (
  `ProductTransactionInfoId` int NOT NULL AUTO_INCREMENT,
  `TransactionId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `PricePerItem` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ProductTransactionInfoId`),
  KEY `ProductTransactionItemProduct_fk` (`ProductId`),
  KEY `ProductTransactionItemTransaction_fk` (`TransactionId`),
  CONSTRAINT `ProductTransactionItemProduct_fk` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `ProductTransactionItemTransaction_fk` FOREIGN KEY (`TransactionId`) REFERENCES `producttransaction` (`TransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `receipt` (
  `ReceiptId` int NOT NULL AUTO_INCREMENT,
  `Path` varchar(255) DEFAULT NULL,
  `TransactionId` int DEFAULT NULL,
  PRIMARY KEY (`ReceiptId`),
  KEY `ReceiptTransaction_fk` (`TransactionId`),
  CONSTRAINT `ReceiptTransaction_fk` FOREIGN KEY (`TransactionId`) REFERENCES `producttransaction` (`TransactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `store` (
  `StoreId` int NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(255) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LogoId` binary(16) DEFAULT NULL,
  `CountryId` int DEFAULT NULL,
  `AddressId` int DEFAULT NULL,
  PRIMARY KEY (`StoreId`),
  KEY `StoreAddress_fk` (`AddressId`),
  KEY `StoreCountry_fk` (`CountryId`),
  CONSTRAINT `StoreAddress_fk` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`),
  CONSTRAINT `StoreCountry_fk` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `store` VALUES (1,'BuidMarket','0973242447',4,4,'2023-09-20 17:27:29','2023-09-20 17:27:29',NULL,NULL,NULL),(2,'BudMaterial','0688321330',1,1,'2023-09-20 17:29:18','2023-09-20 17:29:18',NULL,NULL,NULL);

CREATE TABLE `storehour` (
  `StoreHoursId` int NOT NULL AUTO_INCREMENT,
  `StoreId` int NOT NULL,
  `DayVariantId` int NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StoreHoursId`),
  KEY `StoreHours_CreatedBy_fkey` (`CreatedBy`),
  KEY `StoreHours_DayVariantId_fkey` (`DayVariantId`),
  KEY `StoreHours_StoreId_fkey` (`StoreId`),
  KEY `StoreHours_UpdatedBy_fkey` (`UpdatedBy`),
  CONSTRAINT `StoreHours_CreatedBy_fkey` FOREIGN KEY (`CreatedBy`) REFERENCES `employee` (`EmployeeId`),
  CONSTRAINT `StoreHours_DayVariantId_fkey` FOREIGN KEY (`DayVariantId`) REFERENCES `dayvariant` (`DayVariantId`),
  CONSTRAINT `StoreHours_StoreId_fkey` FOREIGN KEY (`StoreId`) REFERENCES `store` (`StoreId`),
  CONSTRAINT `StoreHours_UpdatedBy_fkey` FOREIGN KEY (`UpdatedBy`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `storehour` VALUES (1,1,1,'07:00:00','18:00:00',4,4,'2023-09-20 17:40:41','2023-09-20 17:40:41'),(2,2,2,'09:00:00','16:00:00',1,1,'2023-09-20 17:40:41','2023-09-20 17:40:41');

CREATE TABLE `transactiontype` (
  `TransactionTypeId` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`TransactionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `transactiontype` VALUES (1,'Sale'),(2,'Purchase');

