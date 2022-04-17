-- Deliverable 1: 
-- Retirement titles
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirementtitles_info
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

select * from retirementtitles_info

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO uniquetitles_info
FROM retirementtitles_info
WHERE to_date IN ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Count number of employees by titles
SELECT COUNT(title), title
INTO retiring_titles
FROM uniquetitles_info
GROUP BY title
ORDER BY count(title) desc;

-- Deliverable #2
-- Mentorship Eligibility
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;