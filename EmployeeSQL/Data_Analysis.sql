-- List each; employee: employee number, last name, first name, sex, and salary.
SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        employees.sex,
        salaries.salary
FROM Employees
    INNER JOIN Salaries 
    ON (employees.emp_no = salaries.emp_no)

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
	last_name, 
	hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager w/ department number, department name, the manager's employee 
SELECT  depmang.dept_no,
        dep.dept_name,
        depmang.emp_no,
        emp.last_name,
        emp.first_name
FROM dept_manager AS depmang
    INNER JOIN Department AS dep
        ON (depmang.dept_no = dep.dept_no)
    INNER JOIN Employees AS emp
        ON (depmang.emp_no = emp.emp_no);


-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        dep.dept_name
FROM Employees AS emp
    INNER JOIN dept_emp AS depe
        ON (emp.emp_no = depe.emp_no)
    INNER JOIN Department AS dep
        ON (dep.dept_no = depe.dept_no)
ORDER BY emp.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'Bm%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no, 
	employees.first_name,
	employees.last_name,
	employees.hire_date ,
	dep.dept_name
FROM Employees
	INNER JOIN Dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN Department as dep
		ON (dept_emp.dept_no = dep.dept_no)	
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
SELECT employees.emp_no, 
	employees.first_name,
	employees.last_name,
	dep.dept_name
FROM Employees
	INNER JOIN Dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN Department as dep 
		ON (dept_emp.dept_no = dep.dept_no)
WHERE dept_name = 'Sales'
AND dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT (last_name)
FROM Employees
WHERE employees.last_name = employees.last_name;
