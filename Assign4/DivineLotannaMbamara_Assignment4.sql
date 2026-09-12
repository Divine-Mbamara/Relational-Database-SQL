/*
============================================
Author: Divine Lotanna Mbamara     
Student Number: 200594413
Creation date: December 7, 2024
Description: This program creates, populates, and manipulates a database using SQL.
			 It uses subqueries and joins to extract relevant data.
============================================
*/

-- Q1 --
/* This query creates a database for this assignment and uses it. */
CREATE DATABASE assignment4;
USE assignment4;


-- Q2 --
/* Populated the assignment4 database using the a4_data.sql file. */
DROP TABLE IF EXISTS `airplanes`;
CREATE TABLE `airplanes` (
  `id` int DEFAULT NULL,
  `name` text,
  `paper_type` text,
  `folds` int DEFAULT NULL,
  `length` int DEFAULT NULL,
  `clothes_pins` int DEFAULT NULL,
  `team_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `airplanes` VALUES (1,'4a','Lined paper',4,24,2,4),(2,'4b','Construction paper',4,22,2,4),(3,'1','Blank paper',9,20,0,1),(4,'2','Construction paper',9,23,0,1),(5,'2','Lined paper',6,12,0,2),(6,'1','Blank paper',10,35,0,2),(7,'1','Construction paper',9,20,1,5),(8,'2','Flash card',5,10,0,5),(9,'1','Blank paper',8,10,2,3);

DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `plane_id` int DEFAULT NULL,
  `pilot_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `station` text,
  `attempt` int DEFAULT NULL,
  `in_bounds` int DEFAULT NULL,
  `duration` text,
  `distance_from_target` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `performance` VALUES (1,'2024-03-21 17:48:37',5,9,2,'5m',2,1,'4.00',10),(2,'2024-03-21 17:51:27',7,8,5,'3M',1,1,'0.71',0.46),(3,'2024-03-21 17:51:26',7,8,5,'7m',4,1,'',0.52),(4,'2024-03-21 17:52:51',8,7,5,'3M',1,1,'0.91',0.79),(5,'2024-03-21 17:52:05',5,9,2,'7m',3,1,'3',0.9),(6,'2024-03-21 17:52:55',8,7,5,'7m',1,1,'',1.3),(7,'2024-03-21 17:37:21',1,6,4,'3m',1,1,'1.87',0.582),(8,'2024-03-21 17:49:17',9,2,3,'7m',1,1,'2.50',5),(9,'2024-03-21 17:55:10',8,7,5,'5m',3,1,'',0.19),(10,'2024-03-21 17:55:36',2,5,4,'5m',2,1,'2.32',0.95),(11,'2024-03-21 17:56:05',7,8,5,'5m',3,1,'',0.52),(12,'2024-03-21 17:56:21',2,4,4,'7m',3,1,'2.5',0.61),(13,'2024-03-21 17:56:55',1,6,4,'5m',4,1,'1.75',0.96),(14,'2024-03-21 17:52:19',9,2,3,'7m',1,1,'2.23',1.2),(15,'2024-03-21 17:51:26',3,1,1,'3m',1,0,'1.96',2.1),(16,'2024-03-21 18:06:01',3,1,1,'5m',2,0,'1.21',1),(17,'2024-03-21 18:07:01',4,1,1,'3m',3,0,'1.13',1.1),(18,'2024-03-21 18:07:34',4,1,1,'3m',4,0,'1.4',0.5);

DROP TABLE IF EXISTS `pilots`;
CREATE TABLE `pilots` (
  `ID` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `height_m` float(3,2) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `arm_length_m` float(3,2) DEFAULT NULL,
  `handedness` char(1) DEFAULT NULL,
  `student_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pilots` VALUES (1,1,1.78,'M',0.60,'R',29),(2,3,1.80,'M',0.60,'R',32),(4,4,NULL,'F',0.60,'R',25),(5,4,1.73,'M',0.66,'R',36),(6,4,1.76,'M',0.62,'R',3),(7,5,1.89,'M',0.75,'R',30),(8,5,1.89,'M',0.70,'R',18),(9,2,1.75,'M',0.50,'R',13);

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `attended` int DEFAULT NULL,
  `team_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `students` VALUES (1,'Anamol','Adhikari',0,NULL),(2,'Anjan','Chaudhary',0,NULL),(3,'Anndriu','Useche Melo',1,4),(4,'Anthony','Burgic',1,2),(5,'Benjamin','Bishop',0,NULL),(6,'Bibek','Khatiwada',1,1),(7,'Cory','Platten',0,NULL),(8,'Dakshpreet','Bhamra',0,NULL),(9,'Daniel','Boyko',0,NULL),(10,'Don','Sijo',1,1),(11,'Enrique ','Babino',0,NULL),(12,'Enrique','Mena',0,NULL),(13,'Fehinti','O\'Emmanuel',1,2),(14,'Harmanpreet','Singh',1,3),(15,'Himal','Gurung',0,NULL),(16,'Jagmandeep','Dhillon',0,NULL),(17,'Jagsher','Singh',0,NULL),(18,'Jason','Hunt',1,5),(19,'Jonathan','Diaz',0,NULL),(20,'Kapil','Chaudhary',0,NULL),(21,'Kashish','Bhateja',1,3),(22,'Kashish','Chauhan',0,NULL),(23,'Komal','Ahuja',0,NULL),(24,'Muskanpreet','Kaur',0,NULL),(25,'MyLan','Nguyen',1,4),(26,'Navitan','Navitan',0,NULL),(27,'Nicholas','Colacci',0,NULL),(28,'Nicholas','Manuel',0,NULL),(29,'Nikhil','Rijal',1,1),(30,'Noah','Brown',1,5),(31,'Priyasha','Priyasha',1,3),(32,'Rahul','Sharma',1,3),(33,'Rajesh','Lamichhane',0,NULL),(34,'Rielly','Kirk',1,5),(35,'Sahitya','Neupane',1,1),(36,'Santosh','Budhathoki',1,4),(37,'Sarah','Neale',0,NULL),(38,'Shiven','Shiven',1,3),(39,'Sugam','Baral',1,1),(40,'Vinayak','Singh',0,NULL);

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `teams` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'Shrek');

-- Q3 --
/* This query retrieves all flight information (from performance table) along with the 
corresponding team name (from the teams table) using an inner join. */
SELECT p.*, t.team_name
FROM performance AS p
	INNER JOIN teams AS t
		ON p.team_id = t.id;
        
-- Q4 --
/* This query lists all pilot ID’s, their gender (from pilots table), and the name of team they 
belong to (from teams table) */
SELECT 
	p.ID, p.Gender,
	(SELECT t.team_name FROM teams AS t WHERE t.id = p.team_id) AS team_name
FROM pilots AS p;

-- Q5 --
/* This query retrieves the id, time, and distance from target for each flight, (from performance table)
 along with the first name of the pilot (from students table) by joining the performance table to the
 pilots table and pilots table to the students table.*/
SELECT p.id, p.time, p.distance_from_target, s.first_name
FROM performance AS p
	INNER JOIN pilots AS pi
		ON p.pilot_id = pi.ID
	INNER JOIN students AS s
		ON pi.student_id = s.ID;

-- Q6 --
/* This query retrieves full name of each student that attended (first_name and last_name from students
 table), as well as their team name (from teams table). */
 SELECT CONCAT(s.first_name, ' ', s.last_name) AS full_name, t.team_name
 FROM students AS s
	INNER JOIN teams AS t
		ON s.team_ID = t.id
WHERE s.attended > 0;

-- Q7 --
/* This query gets the total number of flights attempted by each team (the team_name from teams table 
and the attempt from the performance table). It combines the teams and performance table using an
inner join and groups the results by team_name */ 
SELECT t.team_name, COUNT(p.attempt) AS total_number_of_flights_attempted
FROM teams AS t
	INNER JOIN performance AS p
		ON t.id = p.team_id
GROUP BY t.team_name;

-- Q8 --
/* This query finds the average arm length of pilots in each team using the AVG function (the team_name
from teams table and arm_length_m from the pilots table). It combines the results from the teams and
pilots table using an inner join and groups the results by team_name */
SELECT t.team_name, AVG(p.arm_length_m) AS average_arm_length
FROM teams AS t
	INNER JOIN pilots AS p
		ON t.id = p.team_id
GROUP BY t.team_name;

-- Q9 --
/* This query generates a list of which airplanes belong to the team that has the most students by using
the COUNT function to find the number of students in each team, grouping the students by team-id, and 
ordering them in descending order with a limit of 1. This will make sure that the count is displayed from
highest to lowest number of students, and only the highest is selected. */
SELECT a.*
FROM airplanes AS a
WHERE a.team_id = (SELECT s.team_id FROM students AS s
					WHERE s.team_id IS NOT NULL
					GROUP BY s.team_id 
                    ORDER BY COUNT(s.ID) DESC 
                    LIMIT 1);

-- Q10 --
/* This query lists the names of students who are not pilots by checking if their IDs do not exist in the
pilots table using NOT IN. */
SELECT s.first_name, s.last_name
FROM students AS s
WHERE s.ID NOT IN (SELECT p.student_id FROM pilots AS p);