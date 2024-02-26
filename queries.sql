-- 1.) List all employees of the Engineering department that make more than $100,000 salary.
SELECT DISTINCT first_name, last_name, dept_name, salary FROM employees  NATURAL JOIN salaries  NATURAL JOIN departments  WHERE dept_no = 'd001' and dept_name = 'Engineering' and salary > 100000.00 and to_date = '9999-01-01';

-- 2.) List the salary of the most recently hired employee.
SELECT e.first_name, e.last_name, s.salary, e.hire_date FROM employees e INNER JOIN salaries s ON e.emp_no = s.emp_no WHERE e.hire_date = (SELECT MAX(hire_date) FROM employees);

-- 3.) List all employees of the Engineering department. 
SELECT DISTINCT first_name, last_name, dept_name FROM employees NATURAL JOIN departments WHERE dept_no = 'd001' and dept_name = 'Engineering'; 

-- 4.) List the highest paid employee at the company in the present.
SELECT DISTINCT e.first_name, e.last_name, s.salary FROM employees e INNER JOIN salaries s ON e.emp_no = s.emp_no ORDER BY s.salary DESC LIMIT 1;

-- 5.)List the current salary of all employees that are managers.
SELECT e.first_name, e.last_name, s.salary as salary, dm.dept_no FROM employees e INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no INNER JOIN salaries s ON e.emp_no = s.emp_no GROUP BY e.first_name, e.last_name, s.salary, dm.dept_no ORDER BY dm.dept_no ASC;

-- 6.)List all employees and the department in which they currently work ordered by department name.
SELECT e.first_name, e.last_name, d.dept_name FROM employees e INNER JOIN dept_emp de ON e.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date = '9999-01-01' ORDER BY d.dept_name;

-- 7.) The total number of female employees.
SELECT COUNT(*) as 'Female Employees' FROM employees WHERE gender = 'F';

-- 8.) The total number of employees by department number.
SELECT dept_no, COUNT(*) as 'Number of Employees' FROM employees NATURAL JOIN dept_emp GROUP BY dept_no ORDER BY dept_no; 

-- 9.) List all Analysts. 
SELECT DISTINCT first_name, last_name, title FROM employees NATURAL JOIN titles WHERE title = 'Analyst';

-- 10.) list all employees older than 50 years old along with their title, ordered by age.
SELECT DISTINCT e.first_name, e.last_name, e.age, t.title FROM employees e INNER JOIN titles t ON e.emp_no = t.emp_no WHERE e.age > 50 GROUP BY e.first_name, e.last_name, e.age, t.title ORDER BY e.age ASC;


