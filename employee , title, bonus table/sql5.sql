use monika;
show tables;

/*employee table create*/
create table employee(employee_id int not null primary key auto_increment, first_name char(30), last_name char(30), salary int(20),joining_date datetime, department char(30));

/*insert data in employee table*/
insert into employee(employee_id, first_name, last_name, salary,joining_date, department) values(001,'monika','arora','100000','2009-02-14 00.00.00','HR');
insert into employee values(002,'niharika','verma','80000','2019-06-11 09.00.00','HR');
insert into employee values(003,'vishal','singhal','30000','2011-02-14 09.00.00','admin');
insert into employee values(004,'amitabh','singh','500000','2014-02-9 09.00.00','admin');
insert into employee values(005,'vivek','bhati','500000','2020-06-23 09.00.00','HR');
insert into employee values(006,'vipul','diwan','200000','2020-06-11 09.00.00','account');
insert into employee values(007,'satish','kumar','75000','2015-01-10 09.00.00','account');
insert into employee values(008,'geetika','chauhan','90000','2011-04-20 09.00.00','admin');
insert into employee values(009,'tanvi','singh','100000','2019-01-11 09.00.00','account');
insert into employee values(010,'priyanka','kumari','200000','2019-09-1 09.00.00','admin');
select * from employee;

/*bonus table create*/
create table bonus(employee_ref_id int, bonus_amount int(20), bonus_date datetime, foreign key(employee_ref_id) references employee(employee_id) on delete cascade);
/*insert data in bonus table*/
insert into bonus values(001,5000,'2012-12-30');
insert into bonus values(002,3000,'2022-12-30');
insert into bonus values(003,4000,'2015-12-30');
insert into bonus values(004,3000,'2016-12-30');
insert into bonus values(005,2000,'2022-12-30');
insert into bonus values(006,4000,'2022-12-30');
insert into bonus values(007,3000,'2018-12-30');
insert into bonus values(008,3500,'2015-12-30');
insert into bonus values(009,4500,'2022-12-30');
insert into bonus values(0010,4500,'2022-12-30');
select * from bonus;

/*title table create*/
create table title(employee_ref_id int,employee_title char(40), affected_date datetime, foreign key(employee_ref_id) references employee(employee_id) on delete cascade);
/*insert data in title table*/
insert into title values(001,'asst.manager','2013-1-1');
insert into title values(002,'executive','2023-1-1');
insert into title values(003,'executive','2016-1-1');
insert into title values(004,'manager','2017-1-1');
insert into title values(005,'manager','2023-1-1');
insert into title values(006,'lead','2023-1-1');
insert into title values(007,'executive','2019-1-1');
insert into title values(008,'lead','2020-1-1');
insert into title values(009,'manager','2023-1-1');
insert into title values(0010,'executive','2023-1-1');
select * from title;

/*Q-1. Write an SQL query to fetch “FIRST_NAME” from  Employee table using the alias name as  <EMPLOYEE_NAME>. */
select first_name as "employee_name" from employee;

/*Q-2. Write an SQL query to fetch “FIRST_NAME” from  EMPLOYEE table in upper case. */
select upper(first_name) from employee;

/*Q-3. Write an SQL query to fetch unique values of  DEPARTMENT from EMPLOYEE table. */
select distinct department from employee;

/*Q-4. Write an SQL query to print the first three characters  of FIRST_NAME from EMPLOYEE table. */
select substring(first_name,1,3) from employee;

/*Q-5. Write an SQL query to find the position of the  alphabet (‘a’) in the first name column ‘Amitabh’ from  EMPLOYEE table. */
select instr( first_name, 'a'),first_name from employee where first_name='amitabh';

/*Q-6. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after removing white spaces from the right side. */
Select rtrim(first_name) from employee;

/*Q-7. Write an SQL query to print the DEPARTMENT from  EMPLOYEE table after removing white spaces from the  left side. */
Select ltrim(department) from employee;

/*Q-8. Write an SQL query that fetches the unique values of  DEPARTMENT from EMPLOYEE table and prints its  length. */
select distinct department, length(department) as departmentNameLength from employee;

/*Q-9. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after replacing ‘a’ with ‘A’. Ans. */
select replace(first_name, 'a', 'A') from employee;

/*Q-10. Write an SQL query to print the FIRST_NAME and  LAST_NAME from EMPLOYEE table into a single column COMPLETE_NAME. A space char should separate them. */
Select concat(first_name, ' ', last_name) as 'complete_name' from employee;

/*Q-11. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending. */
select * from employee order by first_name asc;

/*Q-12. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending and DEPARTMENT Descending. */
select * from employee order by first_name asc, department desc;

/*Q-13. Write an SQL query to print details for EMPLOYEEs  with the first name as “Vipul” and “Satish” from  EMPLOYEE table. */
select * from employee where first_name in ('Vipul', 'Satish');

/*Q-14. Write an SQL query to print details of EMPLOYEEs  excluding first names, “Vipul” and “Satish” from  EMPLOYEE table. */
select * from employee where first_name  not in ('Vipul', 'Satish');

/*Q-15. Write an SQL query to print details of EMPLOYEEs  with DEPARTMENT name as “Admin”. */
select * from employee where department='admin';

/*Q-16. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME contains ‘a’. */
select * from employee where first_name LIKE "%a%";

/*Q-17. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘a’. */
select * from employee where first_name LIKE "%a";

/*Q-18. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘h’ and  contains six alphabets. */
select * from employee where first_name LIKE "_____h";

/*Q-19. Write an SQL query to print details of the  EMPLOYEEs whose SALARY lies between 100000 and  500000. */
select * from employee where salary between 100000 and 500000;

/*Q-20. Write an SQL query to print details of the  EMPLOYEEs who have joined in Feb’2014. */
select * from employee where year(joining_date) = '2014' and month(joining_date)='2' ;

/*Q-21. Write an SQL query to fetch the count of employees  working in the department ‘Admin’*/
select count(*)from employee where department='admin';

/*Q-22. Write an SQL query to fetch EMPLOYEE names with  salaries >= 50000 and <= 100000.*/
select first_name , last_name, salary from employee where salary >= 50000 and salary<= 100000;

/*Q-23. Write an SQL query to fetch the no. of EMPLOYEEs  for each department in the descending order. */
select department, count(employee_id) no_of_employee from employee group by department order by no_of_employee desc;

/*Q-24. Write an SQL query to print details of the  EMPLOYEEs who are also Managers.*/
select distinct employee.first_name, title.employee_title from employee  inner join title  on employee.employee_id = title.employee_ref_id
and title.employee_title ='Manager';

/*Q-25. Write an SQL query to fetch duplicate records having  matching data in some fields of a table. */
select *, count(*) from title group by employee_title, affected_date having count(*) > 1;

/*Q-26. Write an SQL query to show only odd rows from a  table.*/
select * from employee where mod(employee_id, 2) <> 0;

/*Q-27. Write an SQL query to show only even rows from a  table. */
select * from employee where mod(employee_id, 2) = 0;

/*Q-28. Write an SQL query to show the current date and  time. */
select current_date();

/*Q-29. Write an SQL query to show the top n (say 10)  records of a table.*/
SELECT * FROM employee ORDER BY Salary DESC LIMIT 10;

/*Q-30. Write an SQL query to fetch three max salaries from  a table.*/
select distinct salary  from employee a  where 3 >= (select count(distinct salary)from employee b where b.salary >= a.salary) order by a.salary desc;



