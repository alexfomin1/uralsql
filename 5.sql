-- a) Список сотрудников, кто имеет вторую по величине зарплату в своём отделе

SELECT MAX(SALARY), ID, FULL_NAME 
FROM EMPLOYEE 
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE);

-- b) Список отделов, в которых работают не более трех сотрудников

SELECT DISTINCT(DEPARTMENT_ID)
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 3;

-- c) Список сотрудников, которые не имеют начальника, работающего в том же отделе, что и сотрудник

SELECT a.FULL_NAME
FROM employee a
LEFT JOIN employee b 
ON b.id = a.chief_id AND b.department_id = a.department_id
WHERE b.id is null;

-- d) Список отделов, в которых сотрудники получают максимальную суммарную зарплату


-- e) Список всех сотрудников, чья зарплата больше, чем зарплата начальника;

SELECT a.FULL_NAME
FROM   employee a, employee b
WHERE  b.id = a.chief_id
AND    a.salary > b.salary;
