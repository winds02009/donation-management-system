-- MySQL schema for the e-Donor Spring Boot app (from the team's "read me.txt").
-- Database name: speed
CREATE DATABASE IF NOT EXISTS speed;
USE speed;

CREATE TABLE edonor (
  id bigint NOT NULL AUTO_INCREMENT,
  email varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  edonorname varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY unique_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE donation (
  donation_id bigint NOT NULL AUTO_INCREMENT,
  donation_name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  donation_program varchar(255) DEFAULT NULL,
  donation_amount int DEFAULT NULL,
  PRIMARY KEY (donation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Admin account (the app treats email 'admin' as administrator). Change the password before use.
INSERT INTO edonor (email, password, edonorname) VALUES ('admin', 'CHANGE_ME', 'admin');