
/*
========================================================
PROJECT: EMPLOYEE DATA ANALYSIS USING MYSQL
DATABASE: employee_analysis
AUTHOR: Saurabh Ganorkar

DESCRIPTION:
Analysis of employee and department data using MySQL.

TOOLS:
MySQL
MySQL Workbench

PROJECT SECTIONS:
1. Database and Table Creation
2. Data Insertion
3. Data Exploration
4. Data Quality Analysis
5. Employee Workforce Analysis
6. Salary Analysis
7. Job Role Analysis
8. Hiring Analysis
9. Advanced Salary Analysis
10. Employee and Management Analysis
11. Final Business Analysis
12. Advanced SQL
========================================================
*/


-- ======================================================
-- SECTION 1: DATABASE AND TABLE CREATION
-- ======================================================

CREATE DATABASE IF NOT EXISTS employee_analysis;

USE employee_analysis;


-- Create Employee Table

CREATE TABLE IF NOT EXISTS emp (
    empno DECIMAL(4,0) NOT NULL,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr DECIMAL(4,0),
    hiredate DATE,
    sal DECIMAL(7,2),
    comm DECIMAL(7,2),
    deptno DECIMAL(2,0)
);


-- Create Department Table

CREATE TABLE IF NOT EXISTS dept (
    deptno DECIMAL(2,0),
    dname VARCHAR(14),
    loc VARCHAR(13)
);


-- ======================================================
-- SECTION 2: DATA INSERTION
-- ======================================================

-- Insert Department Records

INSERT INTO dept VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');


-- Insert Employee Records

INSERT INTO emp VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);


-- ======================================================
-- SECTION 3: DATA EXPLORATION
-- ======================================================

-- Query 1: Total Number of Employees

SELECT COUNT(*) AS total_employees
FROM emp;


-- Query 2: Total Number of Departments

SELECT COUNT(*) AS total_departments
FROM dept;


-- Query 3: Display Table Structures

DESCRIBE emp;

DESCRIBE dept;


-- ======================================================
-- SECTION 4: DATA QUALITY ANALYSIS
-- ======================================================

-- Query 4: Check for NULL Values

SELECT *
FROM emp
WHERE ename IS NULL
   OR job IS NULL
   OR sal IS NULL
   OR deptno IS NULL;


-- Query 5: Check Duplicate Employee IDs

SELECT empno, COUNT(*) AS occurrence
FROM emp
GROUP BY empno
HAVING COUNT(*) > 1;


-- Query 6: Check Invalid Salaries

SELECT *
FROM emp
WHERE sal <= 0;


-- Query 7: Check Invalid Department References

SELECT e.*
FROM emp e
LEFT JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno IS NULL;


-- ======================================================
-- SECTION 5: EMPLOYEE WORKFORCE ANALYSIS
-- ======================================================

-- Query 8: Employee Count by Department

SELECT
    d.dname AS Department,
    COUNT(e.empno) AS Total_Employees
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.dname;


-- Query 9: Average Salary by Department

SELECT
    d.dname AS Department,
    ROUND(AVG(e.sal), 2) AS Average_Salary
FROM dept d
INNER JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.dname
ORDER BY Average_Salary DESC;


-- Query 10: Highest-Paid Employee

SELECT
    ename AS Employee_Name,
    job AS Job_Role,
    sal AS Salary
FROM emp
ORDER BY sal DESC
LIMIT 1;


-- Query 11: Lowest-Paid Employee

SELECT
    ename AS Employee_Name,
    job AS Job_Role,
    sal AS Salary
FROM emp
ORDER BY sal ASC
LIMIT 1;


-- Query 12: Top 5 Highest-Paid Employees

SELECT
    ename AS Employee_Name,
    job AS Job_Role,
    sal AS Salary
FROM emp
ORDER BY sal DESC
LIMIT 5;


-- ======================================================
-- SECTION 6: JOB ROLE ANALYSIS
-- ======================================================

-- Query 13: Employee Count by Job Role

SELECT
    job AS Job_Role,
    COUNT(*) AS Total_Employees
FROM emp
GROUP BY job
ORDER BY Total_Employees DESC;


-- Query 14: Average Salary by Job Role

SELECT
    job AS Job_Role,
    ROUND(AVG(sal), 2) AS Average_Salary
FROM emp
GROUP BY job
ORDER BY Average_Salary DESC;


-- Query 15: Job Roles with Average Salary Above 2000

SELECT
    job AS Job_Role,
    ROUND(AVG(sal), 2) AS Average_Salary
FROM emp
GROUP BY job
HAVING AVG(sal) > 2000
ORDER BY Average_Salary DESC;


-- ======================================================
-- SECTION 7: EMPLOYEE HIRING ANALYSIS
-- ======================================================

-- Query 16: Employees Hired Each Year

SELECT
    YEAR(hiredate) AS Hiring_Year,
    COUNT(*) AS Total_Hires
FROM emp
GROUP BY YEAR(hiredate)
ORDER BY Hiring_Year;


-- Query 17: Employees Hired Each Month

SELECT
    MONTHNAME(hiredate) AS Hiring_Month,
    COUNT(*) AS Total_Hires
FROM emp
GROUP BY MONTH(hiredate), MONTHNAME(hiredate)
ORDER BY MONTH(hiredate);


-- Query 18: Employees Hired After 1981

SELECT
    ename AS Employee_Name,
    hiredate AS Joining_Date,
    job AS Job_Role
FROM emp
WHERE hiredate >= '1982-01-01'
ORDER BY hiredate;


-- Query 19: Longest-Serving Employee

SELECT
    ename AS Employee_Name,
    hiredate AS Joining_Date,
    job AS Job_Role
FROM emp
ORDER BY hiredate ASC
LIMIT 1;


-- ======================================================
-- SECTION 8: ADVANCED SALARY ANALYSIS
-- ======================================================

-- Query 20: Employees Earning Above Company Average

SELECT
    ename AS Employee_Name,
    job AS Job_Role,
    sal AS Salary
FROM emp
WHERE sal > (
    SELECT AVG(sal)
    FROM emp
)
ORDER BY sal DESC;


-- Query 21: Employees Earning Above Department Average

SELECT
    e.ename AS Employee_Name,
    d.dname AS Department,
    e.sal AS Salary
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.sal > (
    SELECT AVG(e2.sal)
    FROM emp e2
    WHERE e2.deptno = e.deptno
)
ORDER BY d.dname, e.sal DESC;


-- Query 22: Department Salary Expenditure

SELECT
    d.dname AS Department,
    COALESCE(SUM(e.sal), 0) AS Total_Salary_Expenditure
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.dname
ORDER BY Total_Salary_Expenditure DESC;


-- Query 23: Salary Distribution

SELECT
    CASE
        WHEN sal > 3000 THEN 'High Salary'
        WHEN sal >= 1500 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Category,
    COUNT(*) AS Employee_Count
FROM emp
GROUP BY Salary_Category;


-- ======================================================
-- SECTION 9: EMPLOYEE AND MANAGEMENT ANALYSIS
-- ======================================================

-- Query 24: Employees Receiving Commission

SELECT
    ename AS Employee_Name,
    job AS Job_Role,
    sal AS Salary,
    comm AS Commission
FROM emp
WHERE comm IS NOT NULL
ORDER BY comm DESC;


-- Query 25: Employees and Their Managers

SELECT
    e.ename AS Employee_Name,
    e.job AS Employee_Role,
    m.ename AS Manager_Name,
    m.job AS Manager_Role
FROM emp e
LEFT JOIN emp m
ON e.mgr = m.empno
ORDER BY Manager_Name;


-- Query 26: Number of Employees Reporting to Each Manager

SELECT
    m.ename AS Manager_Name,
    COUNT(e.empno) AS Team_Size
FROM emp m
INNER JOIN emp e
ON m.empno = e.mgr
GROUP BY m.empno, m.ename
ORDER BY Team_Size DESC;


-- Query 27: Departments Without Employees

SELECT
    d.deptno,
    d.dname,
    d.loc
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno
WHERE e.empno IS NULL;


-- ======================================================
-- SECTION 10: FINAL BUSINESS ANALYSIS
-- ======================================================

-- Query 28: Overall Company Salary Statistics

SELECT
    COUNT(*) AS Total_Employees,
    ROUND(SUM(sal), 2) AS Total_Salary_Expense,
    ROUND(AVG(sal), 2) AS Average_Salary,
    MAX(sal) AS Highest_Salary,
    MIN(sal) AS Lowest_Salary
FROM emp;


-- Query 29: Department Performance Summary

SELECT
    d.dname AS Department,
    COUNT(e.empno) AS Total_Employees,
    ROUND(AVG(e.sal), 2) AS Average_Salary,
    COALESCE(SUM(e.sal), 0) AS Total_Salary_Expense
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname
ORDER BY Total_Salary_Expense DESC;


-- Query 30: Complete Employee Details

SELECT
    e.empno AS Employee_ID,
    e.ename AS Employee_Name,
    e.job AS Job_Role,
    d.dname AS Department,
    d.loc AS Location,
    e.sal AS Salary,
    e.comm AS Commission,
    m.ename AS Manager_Name,
    e.hiredate AS Joining_Date
FROM emp e
LEFT JOIN dept d
ON e.deptno = d.deptno
LEFT JOIN emp m
ON e.mgr = m.empno
ORDER BY d.dname, e.ename;


-- ======================================================
-- SECTION 11: ADVANCED SQL ANALYSIS
-- ======================================================

-- Query 31: Highest Salary in Each Department

SELECT
    d.dname AS Department,
    MAX(e.sal) AS Highest_Salary
FROM dept d
INNER JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.dname
ORDER BY Highest_Salary DESC;


-- Query 32: Highest-Paid Employee in Each Department

SELECT
    e.ename,
    e.deptno,
    e.sal
FROM emp e
WHERE e.sal = (
    SELECT MAX(e2.sal)
    FROM emp e2
    WHERE e2.deptno = e.deptno
);


-- Query 33: Second-Highest Distinct Salary

SELECT MAX(sal) AS Second_Highest_Salary
FROM emp
WHERE sal < (
    SELECT MAX(sal)
    FROM emp
);


-- Query 34: Employees Earning Second-Highest Salary

SELECT
    ename,
    sal
FROM emp
WHERE sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE sal < (
        SELECT MAX(sal)
        FROM emp
    )
);


-- Query 35: Employees Earning Above Average Salary
-- Within Their Job Role

SELECT
    e.ename,
    e.job,
    e.sal
FROM emp e
WHERE e.sal > (
    SELECT AVG(e2.sal)
    FROM emp e2
    WHERE e2.job = e.job
);


-- Query 36: Department Salary Ranking

SELECT
    d.dname,
    SUM(e.sal) AS Total_Salary,
    DENSE_RANK() OVER (
        ORDER BY SUM(e.sal) DESC
    ) AS Salary_Rank
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname;


-- Query 37: Employee Salary Ranking

SELECT
    ename,
    sal,
    RANK() OVER (
        ORDER BY sal DESC
    ) AS Salary_Rank
FROM emp;


-- Query 38: Department-Wise Employee Salary Ranking

SELECT
    ename,
    deptno,
    sal,
    DENSE_RANK() OVER (
        PARTITION BY deptno
        ORDER BY sal DESC
    ) AS Department_Rank
FROM emp;


-- Query 39: Running Total of Employee Salaries

SELECT
    ename,
    sal,
    SUM(sal) OVER (
        ORDER BY empno
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS Running_Total
FROM emp;


-- Query 40: Salary Difference from Company Average

SELECT
    ename,
    sal,
    ROUND(
        sal - AVG(sal) OVER (),
        2
    ) AS Salary_Difference
FROM emp;


-- Query 41: Employees Hired in the Same Year

SELECT
    ename,
    hiredate,
    COUNT(*) OVER (
        PARTITION BY YEAR(hiredate)
    ) AS Employees_Hired_That_Year
FROM emp;


-- Query 42: Create a Reusable Employee View

CREATE OR REPLACE VIEW Employee_Report AS
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.dname,
    d.loc
FROM emp e
LEFT JOIN dept d
ON e.deptno = d.deptno;


-- Execute the View

SELECT * FROM Employee_Report;


-- Query 43: Create a Stored Procedure

DROP PROCEDURE IF EXISTS GetEmployeesByDept;

DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT *
    FROM emp
    WHERE deptno = dept_id;
END //

DELIMITER ;


-- Execute the Stored Procedure

CALL GetEmployeesByDept(20);


-- Query 44: Create a Salary Calculation Function

DROP FUNCTION IF EXISTS CalculateAnnualSalary;

DELIMITER //

CREATE FUNCTION CalculateAnnualSalary(
    monthly_salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;


-- Execute the Function

SELECT
    ename,
    CalculateAnnualSalary(sal) AS Annual_Salary
FROM emp;


-- Query 45: Department Summary Using a CTE

WITH Department_Summary AS (
    SELECT
        deptno,
        COUNT(*) AS Total_Employees,
        AVG(sal) AS Average_Salary
    FROM emp
    GROUP BY deptno
)

SELECT
    d.dname,
    COALESCE(ds.Total_Employees, 0) AS Total_Employees,
    ROUND(ds.Average_Salary, 2) AS Average_Salary
FROM dept d
LEFT JOIN Department_Summary ds
ON d.deptno = ds.deptno;


-- ======================================================
-- END OF PROJECT
-- EMPLOYEE DATA ANALYSIS USING MYSQL
-- TOTAL ANALYTICAL QUERIES: 45
-- ======================================================
