--EmployeeSQL:
--Analysis

--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no, last_name, first_name, sex, salary
FROM employees.employee
JOIN salary.salaries ON employees.employee.emp_no = salary.salaries.emp_no

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees.employee 
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT department.dept_no, department.dept_name, department_manager.emp_no, employee.last_name, employee.first_name
FROM departments.department
JOIN departments.department_manager
ON department.dept_no = department_manager.dept_no
JOIN employees.employee
ON department_manager.emp_no = employee.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT department_employees.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM departments.department_employees
JOIN employees.employee
ON department_employees.emp_no = employee.emp_no
JOIN departments.department
ON department_employees.dept_no = departments.department.dept_no

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employee.first_name, employee.last_name, employee.sex
FROM employees.employee
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

--6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT department.dept_name, employee.last_name, employee.first_name, employee.emp_no
FROM departments.department_employees
JOIN employees.employee
ON department_employees.emp_no = employee.emp_no
JOIN departments.department
ON department_employees.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT department.dept_name, employee.last_name, employee.first_name, employee.emp_no
FROM departments.department_employees
JOIN employees.employee
ON department_employees.emp_no = employee.emp_no
JOIN departments.department
ON department_employees.dept_no = department.dept_no
WHERE department.dept_name = 'Sales' 
OR department.dept_name = 'Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT employee.last_name,
COUNT(last_name) AS "frequency"
FROM employees.employee
GROUP BY employee.last_name
ORDER BY
COUNT(last_name) DESC;
