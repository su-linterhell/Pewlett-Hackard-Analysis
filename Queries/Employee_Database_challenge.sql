SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	ti.title, 
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles;

SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name,
	ti.title, 
	ti.from_date,
	ti.to_date
INTO unique_titles
FROM employees as e
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM unique_titles;

SELECT DISTINCT COUNT (emp_no), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (emp_no) DESC;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e 
JOIN titles as ti
ON e.emp_no = ti.emp_no
JOIN dept_emp as de 
ON e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT * FROM mentorship_eligibilty;

