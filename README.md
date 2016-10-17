# README

Bonus 1: Write a SQL query that returns a sorted list of the departments and the number of support requests per each department (doesn't have to be inside your Rails app). (10%)

Ans:
select department,count(*) from messages group by messages.department order by department
