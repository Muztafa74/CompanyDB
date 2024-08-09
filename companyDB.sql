CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);
---------------------------------
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
---------------------------------
CREATE TABLE projects (
    project_id SERIAL,
    project_name VARCHAR(100)
);
---------------------------------
CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    project_id INTEGER,
    hours_worked INTEGER,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
---------------------------------

INSERT INTO departments (department_name) 
VALUES ('Human Resources'), ('Engineering'), ('Marketing');

---------------------------------
INSERT INTO employees (first_name, last_name, department_id) 
VALUES 
('Alice', 'Smith', 1),  
('Bob', 'Johnson', 2),  
('Charlie', 'Brown', 2), 
('Diana', 'Miller', 3);  
---------------------------------
INSERT INTO projects (project_name) 
VALUES 
('Project Apollo'),
('Project Zeus'),
('Project Hera');
---------------------------------
INSERT INTO assignments (employee_id, project_id, hours_worked) 
VALUES 
(1, 1, 10),  
(2, 2, 20),  
(3, 1, 15),  
(4, 3, 25);  
---------------------------------

INSERT INTO assignments (employee_id, project_id, hours_worked) 
VALUES 
(1, 1, 10),
(2, 2, 20),  
(3, 1, 15), 
(4, 3, 25);  
---------------------------------

SELECT e.first_name, e.last_name, d.department_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id;
---------------------------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;
--------------------------------
SELECT e.first_name, e.last_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id;
---------------------------------
SELECT e1.first_name AS Employee1, e2.first_name AS Employee2, d.department_name
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.department_id = e2.department_id
INNER JOIN departments AS d
ON e1.department_id = d.department_id
WHERE e1.employee_id <> e2.employee_id;
---------------------------------
SELECT d.department_name, e.first_name, e.last_name
FROM departments AS d
FULL OUTER JOIN employees AS e
ON d.department_id = e.department_id;
---------------------------------
SELECT e.first_name, e.last_name, p.project_name
FROM employees AS e
CROSS JOIN projects AS p;
---------------------------------
SELECT *
FROM employees
NATURAL JOIN departments;




