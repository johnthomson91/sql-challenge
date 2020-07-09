INSERT INTO dept_employees_updated (emp_no, emp_title_id, birth_date, first_name, last_name,
                              sex, hire_date, dept_no)
SELECT e.emp_no, e.emp_title_id, e.birth_date,
       e.first_name, e.last_name, e.sex, e.hire_date,
       d.dept_no
FROM another_employees e,  dep_emp d
WHERE e.emp_no = d.emp_no;

select * from dep_emp;

select * from dept_employees_updated;

select * from departments;


CREATE TABLE main_table (
    emp_no INT,
    emp_title_id VARCHAR(20),
    birth_date VARCHAR(30),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR,
    hire_date VARCHAR(30),
    dept_no VARCHAR,
    dept_name VARCHAR,
    PRIMARY KEY(emp_no, dept_no)
);

INSERT INTO main_table (emp_no, emp_title_id, birth_date, first_name, last_name,
                              sex, hire_date, dept_no)
SELECT e.emp_no, e.emp_title_id, e.birth_date,
       e.first_name, e.last_name, e.sex, e.hire_date,
       d.dept_no
FROM another_employees e,  dep_emp d
WHERE e.emp_no = d.emp_no;

select * from main_table;

select * from departments;


SELECT
	departments.dept_name
FROM
	departments
INNER JOIN main_table ON departments.dept_no = main_table.dept_no;

SELECT * FROM main_table;

CREATE TABLE dept_name_updated (
    emp_no INT,
    dept_no VARCHAR(30),
    dept_name VARCHAR(255)
);

SELECT * FROM departments;

INSERT INTO dept_name_updated (emp_no, dept_no, dept_name)
SELECT d.emp_no, d.dept_no, dp.dept_name
FROM dep_emp d, departments dp
WHERE d.dept_no = dp.dept_no;

Select * from dept_name_updated;

SELECT d.*
FROM dept_emp d
INNER JOIN departments dp ON d.dept_no = dp.dept_no; 

SELECT * FROM dep_emp;

CREATE TABLE main_table3 (
    emp_no INT,
    emp_title_id VARCHAR(30),
    birth_date VARCHAR(100),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR,
    hire_date VARCHAR(100),
    dept_no VARCHAR(30),
    dept_name VARCHAR(100),
    PRIMARY KEY (emp_no, dept_no)
);
INSERT INTO main_table3 (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date, dept_no, dept_name)
SELECT e.emp_no, e.emp_title_id, e.birth_date, e.first_name,
      e.last_name, e.sex, e.hire_date, d.dept_no, d.dept_name
FROM employees e, dept_name_updated d
WHERE e.emp_no = d.emp_no;

select * from main_table3;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select emp_no, last_name, first_name, dept_name 
from main_table3;

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name 
from main_table3
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name 
from main_table3
where dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT (last_name)
FROM
	main_table3
GROUP BY
	last_name
ORDER BY count DESC;


