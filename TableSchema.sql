--Table schema creation
--titles
create table titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(45)
);

--employees
create table employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10) references titles(title_id),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(2),
	hire_date DATE
);

--departments
create table departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(45)
);

--dept_emp
create table dept_emp(
	emp_no INT references employees(emp_no),
	dept_no VARCHAR(10) references departments(dept_no),
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

--dept_manager
create table dept_manager(
	dept_no VARCHAR(10) references departments(dept_no),
	emp_no INT,
	CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

--salaries
create table salaries(
	emp_no INT PRIMARY KEY references employees(emp_no),
	salary INT
);