-- query all the table to see what's in it
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
-- I limited the results to 10 to avoid a long query
SELECT emp_no, last_name, first_name, sex,
	(SELECT salary 
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no)
FROM employees
limit 10;

-- List first name, last name, and hire date for employees 
-- who were hired in 1986
SELECT first_name,last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
INNER JOIN departments AS d ON
m.dept_no = d.dept_no
INNER JOIN employees AS e ON
m.emp_no = e.emp_no;

-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON
e.emp_no = de.emp_no
JOIN departments d ON
d.dept_no = de.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their 
-- employee number,last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON
e.emp_no = de.emp_no
JOIN departments d ON
d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales','Development');

-- In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(1) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;
