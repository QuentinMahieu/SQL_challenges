-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZpRvcy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS departments;
CREATE TABLE "departments" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
--import the data in the table
--COPY departments(dept_no, dept_name)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/departments.csv'
--DELIMITER ','
--CSV HEADER;

DROP TABLE IF EXISTS titles;
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--COPY titles(title_id, title)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/titles.csv'
--DELIMITER ','
--CSV HEADER;

DROP TABLE IF EXISTS employees;
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
--COPY employees(emp_no, emp_title_id,
--			   birth_date,first_name,last_name,sex,hire_date)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/employees.csv'
--DELIMITER ','
--CSV HEADER;

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);
--COPY dept_emp(emp_no,dept_no)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/dept_emp.csv'
--DELIMITER ','
--CSV HEADER;

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
--COPY dept_manager(dept_no,emp_no)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/dept_manager.csv'
--DELIMITER ','
--CSV HEADER;

DROP TABLE IF EXISTS salaries;
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
--COPY slaries(emp_no,salary)
--FROM '/Users/quentinmahieu/Desktop/School/Monash/Projects_Monash/9.SQL_challenge/SQL_challenges/data/salaries.csv'
--DELIMITER ','
--CSV HEADER;

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

