-- select emp_no, salary, 
-- lag(salary) over w as previous_salary,
-- lead(salary) over w as next_salary,
-- salary- lag(salary) over w as diff_salary_current_previous,
-- lead(salary) over w - salary as diff_salary_next_current
-- from salaries 
-- where salary>80000 and emp_no between 10500 and 10600
-- window w as (partition by emp_no order by salary);

-- select emp_no, salary, 
-- lag(salary) over w as prev_salary,
-- lag(salary,2) over w as 1_before_previous_salary,
-- lead(salary) over w as next_salary,
-- lead(salary, 2) over w as 1_after_next_salary 
-- from salaries 
-- window w as (partition by emp_no order by salary)
-- limit 1000;


-- select s1.emp_no, s.salary, s.from_date, s.to_date
-- from salaries s 
-- join (select emp_no, min(from_date) as from_date
-- from salaries
-- group by emp_no) s1 on s.emp_no= s1.emp_no
-- where s.from_date = s1.from_date;


-- SELECT

--     de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department

-- FROM

--     (SELECT

--     de.emp_no, de.dept_no, de.from_date, de.to_date

-- FROM

--     dept_emp de

--         JOIN

-- (SELECT

-- emp_no, MAX(from_date) AS from_date

-- FROM

-- dept_emp

-- GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no

-- WHERE

--     de.to_date < '2002-01-01'

-- AND de.from_date > '2000-01-01'

-- AND de.from_date = de1.from_date) de2

-- JOIN

--     (SELECT

--     s1.emp_no, s.salary, s.from_date, s.to_date

-- FROM

--     salaries s

--     JOIN

--     (SELECT

-- emp_no, MAX(from_date) AS from_date

-- FROM

-- salaries

--     GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no

-- WHERE

--     s.to_date < '2002-01-01'

-- AND s.from_date > '2000-01-01'

-- AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no

-- JOIN

--     departments d ON d.dept_no = de2.dept_no

-- GROUP BY de2.emp_no, d.dept_name

-- WINDOW w AS (PARTITION BY de2.dept_no)

-- ORDER BY de2.emp_no, salary;

select year(d.from_date) as calendar_year,
e.gender,
count(e.emp_no) as num_of_employees
from t_employees e join 
t_dept_emp d on d.emp_no = e.emp_no
group by calendar_year, e.gender
having calendar_year>=1990;
