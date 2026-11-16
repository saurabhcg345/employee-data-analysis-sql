# Employee Data Analysis Using MySQL

## 1. Project Overview

This project focuses on analysing employee and departmental data using MySQL.

The objective is to explore employee information, analyse salary structures, understand departmental distribution, examine hiring patterns, and generate meaningful business insights to support HR decision-making.

This project demonstrates practical SQL skills through business-oriented analytical questions and queries.

## 2. Business Problem

The HR department wants to understand its workforce better and gain insights into:

- Employee distribution across departments.
- Salary distribution and expenditure.
- Highest-paid and lowest-paid employees.
- Average salaries across departments and job roles.
- Employee hiring trends.
- Employee-manager relationships.
- Department-wise workforce structure.

The goal is to transform raw employee data into meaningful business insights.

## 3. Tools and Technologies

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Documentation:** Google Docs
- **Version Control:** GitHub

## 4. Dataset Description

The project uses an employee sample dataset containing two relational tables.

### Employee Table (emp)

| Column | Description |
|---|---|
| empno | Employee ID |
| ename | Employee Name |
| job | Job Designation |
| mgr | Manager ID |
| hiredate | Joining Date |
| sal | Employee Salary |
| comm | Commission |
| deptno | Department Number |

### Department Table (dept)

| Column | Description |
|---|---|
| deptno | Department Number |
| dname | Department Name |
| loc | Department Location |

**Dataset Summary:**
- Total Employee Records: 14
- Total Department Records: 4

## 5. SQL Concepts Covered

The project demonstrates the following SQL concepts:

- SELECT, WHERE and ORDER BY
- AND, OR, IN and BETWEEN
- DISTINCT and LIKE
- Aggregate Functions
- GROUP BY and HAVING
- INNER JOIN, LEFT JOIN and RIGHT JOIN
- Self JOIN
- Subqueries and Correlated Subqueries
- CASE Statements
- Date and String Functions
- UNION and UNION ALL
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER(), RANK() and DENSE_RANK()
- Views
- Stored Procedures
- User-Defined Functions

## 6. Business Questions Addressed

The analysis explores questions such as:

1. How many employees work in the company?
2. How many employees belong to each department?
3. Which department has the highest average salary?
4. Who are the highest-paid and lowest-paid employees?
5. Who are the top five highest-paid employees?
6. What is the average salary by job role?
7. How many employees were hired each year?
8. Which employees earn above the company average?
9. Which employees earn above their department average?
10. How much salary expenditure does each department have?
11. Which employees receive commissions?
12. Who reports to whom in the organisation?
13. Which departments have no employees?
14. How are employees ranked based on salary?
15. What is the running total of employee salaries?

Additional analytical questions are included in the SQL query collection.

## 7. Project Deliverables

- SQL database and table creation scripts.
- Employee and department sample data.
- SQL analytical queries.
- Query execution results.
- Business insights and recommendations.
- Project documentation.

## 8. Key Learning Outcomes

Through this project, I developed practical experience in:

- Writing SQL queries to solve business problems.
- Retrieving and filtering relational data.
- Analysing data using aggregate functions.
- Combining multiple tables using JOINs.
- Applying subqueries and window functions.
- Creating reusable database objects.
- Translating business requirements into SQL queries.

## 9. Project Limitations

The dataset is a small historical sample containing employee records from 1980–1983. Therefore, the findings are intended for SQL learning and demonstration purposes and should not be interpreted as current workforce trends.

## 10. Conclusion

This project demonstrates the application of SQL in analysing employee and departmental data.

It provides practical experience in data exploration, data quality checks, analytical querying, and extracting business insights from relational databases.
