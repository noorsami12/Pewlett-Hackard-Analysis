--DELIVERABLE 1

SELECT e.emp_no, e.first_name, e.last_name, 
t.title, t.from_date, t.to_date 
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
	ON (e.emp_no=t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * from retiring_titles;

--DELIVERABLE TWO

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
d.from_date, d.to_date, 
t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as d ON (e.emp_no=d.emp_no)
JOIN titles as t ON (e.emp_no=t.emp_no)
WHERE (d.to_date = ('9999-01-01')) AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;

