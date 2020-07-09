--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

select * from dep_manager;

INSERT INTO dep_manager
SELECT 
    e.dept_no
    , e.emp_no
    , e.dept_name
    , e.last_name
    , e.first_name
FROM main_table3 e
;
COMMIT;