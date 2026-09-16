/*
	Step 1
*/
CREATE DATABASE a3planes;
USE a3planes;

/*
	Step 2
*/
CREATE TABLE students (
	ID int NOT NULL AUTO_INCREMENT,
	first_name varchar(45) DEFAULT NULL,
	last_name varchar(45) DEFAULT NULL,
	attended INT DEFAULT NULL,
	PRIMARY KEY (ID)
) ENGINE=InnoDB;

use a3planes;
/*
	Step 5
	create table teams_temp columns, member and team
*/
CREATE TABLE teams_temp(
	member varchar(45),
    team varchar(45)
);
/*
	Step 6
	insert data from team_member into insert teams_temp
*/
INSERT INTO teams_temp (member, team)
SELECT `Member 1` AS member, `Team Name` AS team FROM team_members WHERE `Member 1` IS NOT NULL
UNION
SELECT `Member 2`, `Team Name` FROM team_members WHERE `Member 2` IS NOT NULL
UNION
SELECT `Member 3`, `Team Name` FROM team_members WHERE `Member 3` IS NOT NULL
UNION
SELECT `Member 4`, `Team Name` FROM team_members WHERE `Member 4` IS NOT NULL
UNION
SELECT `Member 5`, `Team Name` FROM team_members WHERE `Member 5` IS NOT NULL;

/*Step 7
This SQL query deletes rows from the teams_temp table where the member column is empty. 
*/
DELETE FROM teams_temp
WHERE member IS NULL OR member = " ";

/*Step 8
This SQL query updates the teams_temp table by performing the following: 
	Removing the prefix 'Team ’ from the team column. 
	Removing the prefix 'Team:- ’ from the team column. 
	Trimming any leading or trailing spaces from the team column.  
*/
UPDATE teams_temp
SET team = TRIM(REPLACE(REPLACE(team, 'Team:- ', ''),'Team ', ''));

/*Step 9
This SQL query  drops the table named team_members. 
*/
DROP TABLE team_members;

/*Step 10
This SQL query deletes rows from the teams_temp table where the member column is either 
‘Anthony’ or ‘Feinit’.
*/
DELETE FROM teams_temp
WHERE member IN ('Anthony','Feinit');

/*Step 11
This SQL query creates a new table named teams with two columns: id (integer, primary key),
 and team_name (varchar 45). It populates the team_name column with distinct values from the 
 teams_temp table, ordered alphabetically. 
*/
CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(45)
);

INSERT INTO teams (team_name)
SELECT DISTINCT team
FROM teams_temp
ORDER BY team ASC;

/*Step 12
 This query adds a new column named team_name to the existing students table with data type varchar(45).
*/
ALTER TABLE students
ADD COLUMN team_name VARCHAR(45);

/*
Step 13
*/
UPDATE students
INNER JOIN teams_temp ON SUBSTRING_INDEX(teams_temp.member, ' ', 1) = students.first_name
SET students.team_name = teams_temp.team
WHERE students.attended = 1;

/*
Step 14
*/
ALTER TABLE students ADD COLUMN team_ID INT;

/*
	Step 15
*/
UPDATE students
INNER JOIN teams ON students.team_name = teams.team_name
SET students.team_ID = teams.id
WHERE students.attended = 1;

/*
	Step 16
*/
ALTER TABLE students DROP COLUMN team_name;

/*
	Step 17
*/
DROP TABLE teams_temp;

/*
	Step 18 : Photo
*/
use a3planes;
DROP TABLE PILOTS;
SELECT * FROM pilots;

/*
	Step 19: altering the table to rename the column from "Teame Number" to "team id"
*/
ALTER TABLE pilots RENAME COLUMN `Team number` TO team_id;

ALTER TABLE pilots
RENAME COLUMN `Height (in m)` TO height_m,
RENAME COLUMN `Arm length (in m)` TO arm_length_m,
RENAME COLUMN `Handedness (right|left)` TO handedness;


/*
Step 20
*/
UPDATE pilots SET team_id = REPLACE(team_id, 'Team ', ''); 

/*
	Step 21
*/
UPDATE pilots
SET team_id = NULL
WHERE team_id = '';

/*
	Step 22
*/
UPDATE pilots
SET height_m = REPLACE(REPLACE(Height_m, 'm', ''), 'c', '');

/*
	Step 23
*/
UPDATE pilots
SET height_m = height_m / 100
WHERE height_m > 100;

/*
	Step 24
*/
UPDATE pilots
SET gender = CASE
  WHEN gender LIKE 'm%' THEN 'M'
  WHEN gender LIKE 'f%' THEN 'F'
  ELSE NULL
END;

/*
BURAK
STEP 25
*/
UPDATE pilots
SET arm_length_m = REPLACE(REPLACE(arm_length_m, 'm', ''), 'c', '');

/*
STEP 26
*/
UPDATE arm_length_m 
SET arm_length_m = arm_length_m / 100
WHERE arm_length_m > 3;

/*
STEP 27
*/
UPDATE pilots 
SET handedness = CASE
	WHEN handedness LIKE 'R%' then 'R'
    WHEN handedness LIKE 'L%' then 'L'
    ELSE NULL
END;

/*
	STEP 28
*/
ALTER TABLE pilots ADD COLUMN student_id INT;

/*
	STEP 29
*/
UPDATE pilots
INNER JOIN students ON SUBSTRING_INDEX(pilots.name, ' ', 1) = students.first_name
SET pilots.student_id = students.ID;

/*
	STEP 30
*/
DELETE FROM pilots WHERE ID = 3;

/*
	STEP 31
*/
UPDATE pilots
SET team_id = 4, height_m = NULL
WHERE ID = 4;


/* STEP 32 */ 

ALTER TABLE pilots 
MODIFY COLUMN team_id INT,
MODIFY COLUMN height_m FLOAT(4,2),
MODIFY COLUMN gender CHAR(1),
MODIFY COLUMN arm_length_m FLOAT(4,2),
MODIFY COLUMN handedness CHAR(1);


/* STEP 33 */

USE a3planes;
SELECT * FROM airplanes;

/* STEP 34 */

ALTER TABLE airplanes 
ADD COLUMN image LONGBLOB;

select * from airplanes;

/* STEP 35 */

SHOW VARIABLES LIKE 'secure_file_priv';

/* STEP 36 */

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Uploads/Plane1.png')
WHERE id = 1;


/* STEP 37 */

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane1.png')
WHERE id = 1;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane2.png')
WHERE id = 2;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane3.jpg')
WHERE id = 3;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane4.jpeg')
WHERE id = 4;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane5.jpg')
WHERE id = 5;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane6.jpg')
WHERE id = 6;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane7.jpg')
WHERE id = 7;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane8.jpg')
WHERE id = 8;

UPDATE airplanes
SET image = LOAD_FILE('/Users/aslihanbaltaalay/Downloads/Data/Plane9.jpg')
WHERE id = 9;

/* STEP 38 */

-- Use the database
USE a3planes;

-- Add Primary Key Constraints
ALTER TABLE students 
ADD CONSTRAINT pk_students PRIMARY KEY (ID);

ALTER TABLE teams 
ADD CONSTRAINT pk_teams PRIMARY KEY (id);

ALTER TABLE pilots 
ADD CONSTRAINT pk_pilots PRIMARY KEY (ID);

ALTER TABLE airplanes 
ADD CONSTRAINT pk_airplanes PRIMARY KEY (id);

-- Add Foreign Key Constraints
-- Students table: Foreign key to teams table
ALTER TABLE students 
ADD CONSTRAINT fk_students_teams FOREIGN KEY (team_ID) REFERENCES teams(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Pilots table: Foreign key to teams and students tables
ALTER TABLE pilots 
ADD CONSTRAINT fk_pilots_teams FOREIGN KEY (team_id) REFERENCES teams(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE pilots 
ADD CONSTRAINT fk_pilots_students FOREIGN KEY (student_id) REFERENCES students(ID)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Airplanes table: Foreign key to teams table
ALTER TABLE airplanes 
ADD CONSTRAINT fk_airplanes_teams FOREIGN KEY (team_id) REFERENCES teams(id)
ON DELETE SET NULL
ON UPDATE CASCADE;


