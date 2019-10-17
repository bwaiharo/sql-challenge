-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_names,e.first_name,e.gender,s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;

-- 2) List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name , dm.emp_no, e.last_names,e.first_name,dm.from_date, dm.to_date 
FROM (
	(dept_manager AS dm
	 INNER JOIN employees AS e ON dm.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = dm.dept_no);

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_names,e.first_name, d.dept_name
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no);
	 
-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_names LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_names,e.first_name, d.dept_name
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no)
WHERE d.dept_name = 'Sales' ; 

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_names,e.first_name, d.dept_name
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no)
WHERE d.dept_name = 'Development'
OR d.dept_name = 'Sales' ;

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(emp_no) AS last_name_count,last_names
FROM employees
GROUP BY last_names
ORDER BY last_names 

--9) "Search your ID number."  employee ID number is 499942
SELECT de.emp_no, e.last_names,e.first_name, d.dept_name, e.gender, e.hire_date
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no)
WHERE e.emp_no = 499942
