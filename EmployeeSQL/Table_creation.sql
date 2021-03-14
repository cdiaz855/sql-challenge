DROP TABLE IF EXISTS Titles;
CREATE TABLE Titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
	emp_no INT NOT NULL, 
	emp_title VARCHAR NOT NULL,   
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title) REFERENCES Titles (title_id)
);

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

DROP TABLE IF EXISTS Dept_emp;
CREATE TABLE Dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Department(dept_no)
);

DROP TABLE IF EXISTS Dept_manager;
CREATE TABLE Dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);
