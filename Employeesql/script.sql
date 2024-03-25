-- DROP DATABASE IF EXISTS `sql_factory`;
-- CREATE DATABASE `sql_factory`; 
-- USE `sql_factory`;

-- SET NAMES utf8 ;
-- SET character_set_client = utf8mb4;

-- -- Table 1: departments
-- CREATE TABLE `departments` (
--     `dept_no` VARCHAR(4) PRIMARY KEY,
--     `dept_name` VARCHAR(50) UNIQUE
-- );

-- CREATE TABLE `employees` (
--     `emp_no` INT PRIMARY KEY,
--     `emp_title_id` VARCHAR(5),
--     `birth_date` DATE,
--     `first_name` VARCHAR(50),
--     `last_name` VARCHAR(50),
--     `sex` CHAR(1),
--     `hire_date` DATE,
--     UNIQUE (`emp_title_id`, `birth_date`, `first_name`, `last_name`, `sex`, `hire_date`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  COLLATE=utf8mb4_0900_ai_ci;

-- CREATE TABLE `dept_emp` (
--     `emp_no` INT,
--     `dept_no` VARCHAR(4),
--     PRIMARY KEY (`emp_no`, `dept_no`),
--     FOREIGN KEY (`emp_no`) REFERENCES `employees`(`emp_no`),
--     FOREIGN KEY (`dept_no`) REFERENCES `departments`(`dept_no`)
-- );

-- CREATE TABLE `dept_manager` (
--     `dept_no` VARCHAR(4),
--     `emp_no` INT,
--     PRIMARY KEY (`dept_no`, `emp_no`),
--     FOREIGN KEY (`dept_no`) REFERENCES `departments`(`dept_no`) ON DELETE RESTRICT ON UPDATE CASCADE,
--     FOREIGN KEY (`emp_no`) REFERENCES `employees`(`emp_no`) ON DELETE RESTRICT ON UPDATE CASCADE
-- );

-- CREATE TABLE `salaries` (
--     `emp_no` INT PRIMARY KEY,
--     `salary` INT,
--     KEY `fk_emp_no_idx` (`emp_no`),
--     CONSTRAINT `fk_emp` FOREIGN KEY (`emp_no`) REFERENCES `employees`(`emp_no`) ON DELETE RESTRICT ON UPDATE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  COLLATE=utf8mb4_0900_ai_ci;

-- CREATE TABLE `titles` (
--     `title_id` VARCHAR(5) PRIMARY KEY,
--     `title` VARCHAR(50) UNIQUE
-- );
 
-- LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\departments.txt'
-- INTO TABLE departments
-- FIELDS TERMINATED BY '\t'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- show variables like "secure_file_priv"; 
-- show variables like "local_infile";
-- set global local_infile = 1;

-- SELECT,FROM,WHERE,ORDER bY,GROUP BY
-- Analysis 1
-- SELECT emp_no,last_name,first_name,sex,salary
-- FROM employees
-- INNER JOIN salaries
-- USING (emp_no);

-- Analysis 2
-- SELECT first_name, last_name, hire_date FROM employees
-- WHERE hire_date >= "1986-01-01";

-- Analysis 3
-- SELECT dept_no, dept_name,emp_no,last_name, first_name
-- FROM dept_manager
-- INNER JOIN departments
-- USING (dept_no)
-- INNER JOIN employees
-- USING(emp_no);

-- Analysis 4
-- SELECT emp_no, last_name, first_name, dept_name
-- FROM dept_emp
-- INNER JOIN employees
-- USING (emp_no)
-- INNER JOIN departments
-- USING(dept_no);

-- Analysis 5
-- SELECT first_name, last_name, sex
-- FROM employees
-- WHERE first_name = "Hercules" AND last_name LIKE "B%";

-- Analysis 6
-- SELECT emp_no, last_name, first_name
-- FROM dept_emp
-- INNER JOIN employees
-- USING (emp_no)
-- INNER JOIN departments
-- USING(dept_no)
-- WHERE dept_name = "Sales";

-- Analysis 7
-- SELECT emp_no, last_name, first_name, dept_name
-- FROM dept_emp
-- INNER JOIN employees
-- USING (emp_no)
-- INNER JOIN departments
-- USING(dept_no)
-- WHERE dept_name IN ("Sales", "Development");

-- Analysis 8
-- SELECT last_name, COUNT(last_name) 
-- FROM employees
-- GROUP BY last_name
-- ORDER BY COUNT(last_name) desc;