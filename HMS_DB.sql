CREATE TABLE `beds` (
  `ID_Room` int NOT NULL,
  `ID_Bed` int NOT NULL,
  `Bed_Status` varchar(50) DEFAULT NULL,
  `Bed_number` int DEFAULT NULL,
  PRIMARY KEY (`ID_Bed`),
  KEY `ID_Room` (`ID_Room`),
  CONSTRAINT `beds_ibfk_1` FOREIGN KEY (`ID_Room`) REFERENCES `rooms` (`ID_Room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `departments` (
  `ID_Department` int NOT NULL,
  `Department_Name` varchar(100) DEFAULT NULL,
  `Is_Clinic` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `diagnosis` (
  `ID_Diagnosis` int NOT NULL,
  `Diagnosis_Name` varchar(200) DEFAULT NULL,
  `Medicine_Patient` varchar(200) DEFAULT NULL,
  `Diagnosis_Date` datetime DEFAULT NULL,
  `ID_Patient` int DEFAULT NULL,
  `ID_Employee` int DEFAULT NULL,
  PRIMARY KEY (`ID_Diagnosis`),
  KEY `ID_Patient` (`ID_Patient`),
  KEY `ID_Employee` (`ID_Employee`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`ID_Patient`) REFERENCES `patients` (`ID_Patient`),
  CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`ID_Employee`) REFERENCES `employees` (`ID_Employee`),
  CONSTRAINT `diagnosis_ibfk_3` FOREIGN KEY (`ID_Employee`) REFERENCES `employees` (`ID_Employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `diseases` (
  `ID_Disease` int NOT NULL,
  `Disease_Name` varchar(200) DEFAULT NULL,
  `ID_Department` int DEFAULT NULL,
  PRIMARY KEY (`ID_Disease`),
  KEY `ID_Department` (`ID_Department`),
  CONSTRAINT `diseases_ibfk_1` FOREIGN KEY (`ID_Department`) REFERENCES `departments` (`ID_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employees` (
  `ID_Employee` int NOT NULL,
  `Employee_Name` varchar(100) DEFAULT NULL,
  `Employee_Sex` bit(1) DEFAULT NULL,
  `Employee_Age` int DEFAULT NULL,
  `ID_Nationality` varchar(50) DEFAULT NULL,
  `Employee_Address` varchar(50) DEFAULT NULL,
  `Employee_Phon_Number1` int DEFAULT NULL,
  `Employee_Phon_Number2` int DEFAULT NULL,
  `Employee_SSN` int DEFAULT NULL,
  `date_of_employment` datetime DEFAULT NULL,
  `Is_Adoctor` bit(1) DEFAULT NULL,
  `Employee_State` varchar(50) DEFAULT NULL,
  `ID_Years` int DEFAULT NULL,
  `ID_Qualification` int DEFAULT NULL,
  `ID_JOB` int DEFAULT NULL,
  PRIMARY KEY (`ID_Employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employees_job` (
  `ID_Employee` int DEFAULT NULL,
  `ID_JOB` int DEFAULT NULL,
  `ID_Department` int DEFAULT NULL,
  KEY `ID_Employee` (`ID_Employee`),
  KEY `ID_Department` (`ID_Department`),
  CONSTRAINT `employees_job_ibfk_1` FOREIGN KEY (`ID_Employee`) REFERENCES `employees` (`ID_Employee`),
  CONSTRAINT `employees_job_ibfk_2` FOREIGN KEY (`ID_Department`) REFERENCES `departments` (`ID_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `laboratory_section` (
  `ID_Laboratory` int NOT NULL,
  `Laboratory_Name` varchar(200) DEFAULT NULL,
  `ID_Department` int DEFAULT NULL,
  PRIMARY KEY (`ID_Laboratory`),
  KEY `ID_Department` (`ID_Department`),
  CONSTRAINT `laboratory_section_ibfk_1` FOREIGN KEY (`ID_Department`) REFERENCES `departments` (`ID_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nationality` (
  `ID_Nationality` int NOT NULL,
  `Nationality_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Nationality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `patients` (
  `ID_Patient` int NOT NULL,
  `Patient_Name` varchar(50) DEFAULT NULL,
  `Patient_Sex` bit(1) DEFAULT NULL,
  `Patient_Age` int DEFAULT NULL,
  `Enter_date` datetime DEFAULT NULL,
  `ID_Years` int DEFAULT NULL,
  `Notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Patient`),
  KEY `ID_Years` (`ID_Years`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`ID_Years`) REFERENCES `years` (`ID_Years`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `qualifications` (
  `ID_Qualification` int NOT NULL,
  `Qualification_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Qualification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rooms` (
  `ID_Room` int NOT NULL,
  `Room_Type` varchar(50) DEFAULT NULL,
  `Room_Department` bit(1) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Price_Room` float DEFAULT NULL,
  PRIMARY KEY (`ID_Room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `rooms_accommodation` (
  `ID_Pat_Room` int NOT NULL,
  `ID_Room` int DEFAULT NULL,
  `ID_Bed` int DEFAULT NULL,
  `Enter_Date` datetime DEFAULT NULL,
  `Exite_Date` datetime DEFAULT NULL,
  `Companion_Name` varchar(50) DEFAULT NULL,
  `Companion_Phone` int DEFAULT NULL,
  `ID_Patient` int DEFAULT NULL,
  PRIMARY KEY (`ID_Pat_Room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `years` (
  `ID_Years` int NOT NULL,
  `Years_Name` varchar(100) DEFAULT NULL,
  `Current_Year` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Years`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
