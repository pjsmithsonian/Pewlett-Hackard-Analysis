SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
	INTO retirement_table
From employees AS e
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE 
e.birth_date >= '1-1-1952' AND e.birth_date <= '12-31-1955'
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_table
ORDER BY emp_no, to_date DESC;


SELECT COUNT(title) AS "Count"
	, title
	INTO retiring_titles
from unique_titles
Group by title
Order by Count DESC;


SELECT DISTINCT ON(e.emp_no) e.emp_no ,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
	INTO mentorship_table
From employees AS e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE 
e.birth_date >= '1-1-1965' AND e.birth_date <= '12-31-1965'
AND t.to_date = '1-1-9999'
ORDER BY e.emp_no;