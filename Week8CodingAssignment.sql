SELECT titles.title,
COUNT(title) "Employees Born After 1965-01-01"
FROM titles
INNER JOIN employees ON employees.emp_no = titles.emp_no
WHERE birth_date > '1965-01-01'
GROUP BY title
ORDER BY title
;

SELECT titles.title "Job Title",
CONCAT('$', FORMAT(AVG(salary), 2)) "Average Employee Salary"
FROM salaries
INNER JOIN titles ON titles.emp_no = salaries.emp_no
GROUP BY title
ORDER BY title
;

SELECT departments.dept_name "Department",
CONCAT(DATE("1990-01-01"), " - ", DATE("1992-12-31")) "Date Range",
COUNT(salaries.emp_no) "Total Number of Employees in Department in Date Range",
CONCAT('$', FORMAT(AVG(salaries.salary), 2)) "Average Annual Salary in Date Range",
CONCAT('$', FORMAT(SUM(salaries.salary), 2)) "Total Amount of All Salaries in Date Range"
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Marketing'
	AND salaries.from_date >= '1990-01-01'
    AND salaries.to_date <= '1992-12-31'
;