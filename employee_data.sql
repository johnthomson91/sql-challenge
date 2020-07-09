INSERT INTO another_employees(emp_no, emp_title_id, birth_date, first_name, last_name,
                              sex, hire_date, salary)
SELECT e.emp_no, e.emp_title_id, e.birth_date,
       e.first_name, e.last_name, e.sex, e.hire_date,
       s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;

select * from another_employees;
--List the following details of each employee: employee number, last name, 
--first name, sex, and salary.

select emp_no, last_name, first_name, sex, salary from another_employees;

--- List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
	from another_employees
	where hire_date like '%1986%';
	
-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."

select first_name, last_name, sex
	from another_employees
	where first_name = 'Hercules' and last_name LIKE 'B%';