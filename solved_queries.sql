/* 1. List the following details of each employee: employee number, 
last name, first name, gender, and salary. */

Select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
From employees
Left Join salaries ON employees.emp_no = salaries.emp_no;

/* 2. List employees who were hired in 1986.*/

Select emp_no, first_name, last_name, hire_date from employees
Where hire_date Between '1986-01-01' AND '1986-12-31';

/* 3. List the manager of each department with the following information:
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates. */

Select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name,
employees.first_name, dept_manager.from_date, dept_manager.to_date
From employees
Inner Join dept_manager ON dept_manager.emp_no = employees.emp_no
Inner Join departments ON departments.dept_no = dept_manager.dept_no;

/* 4. List the department of each employee with the following 
information: employee number, last name, first name, and department name. */

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp ON employees.emp_no = dept_emp.emp_no
Inner Join departments ON departments.dept_no = dept_emp.dept_no;

/* 5. List all employees whose first name is "Hercules" and last names begin with "B." */

Select first_name, last_name From employees
Where first_name = 'Hercules' AND last_name Like 'B%';

/* 6. List all employees in the Sales department, including their 
employee number, last name, first name, and department name. */

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp ON employees.emp_no = dept_emp.emp_no
Inner Join departments ON dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales';

/* 7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name. */

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Inner Join dept_emp ON employees.emp_no = dept_emp.emp_no
Inner Join departments ON dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

/* 8. In descending order, list the frequency count of employee last
 names, i.e., how many employees share each last name. */

Select last_name, Count(last_name) as People
From employees
Group by last_name
Order by People Desc;
