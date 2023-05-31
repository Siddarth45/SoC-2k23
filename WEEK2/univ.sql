--ques 1
/*select name from student
UNION
select name from instructor;*/

/*ques 2
select distinct course.course_id,title,ID from course inner join teaches on course.course_id=teaches.course_id;*/

/*ques 3
select ID,name,salary from instructor where salary<75000;*/

/*ques 4
select dept_name,count(name) from instructor group by dept_name;*/

/*ques 5
select prereq.course_id,title,prereq_id from course inner join prereq on course.course_id=prereq.course_id;*/

/*ques 6
select name,instructor.dept_name,salary,budget from instructor inner join department on instructor.dept_name=department.dept_name where salary>.1*budget;*/

/*ques 7
SELECT DISTINCT d1.dept_name
FROM department d1
INNER JOIN department d2 ON d1.building = d2.building
WHERE d1.dept_name <> d2.dept_name;*/

/*ques 8
create table if not exists total_income as select dept_name,count(name) as student_count from student group by dept_name;
ALTER TABLE total_income
ADD COLUMN if not exists fees INTEGER;
UPDATE total_income
SET fees=student_count*5000;
select * from total_income;*/

/*ques 9
create table if not exists usefull_teachers as select ID from teaches union select i_id from advisor;
select ID from instructor 
Except
select id from usefull_teachers;*/

/*ques 10
create table if not exists reg as select ID,takes.course_id,dept_name from takes inner join course on takes.course_id=course.course_id;
select distinct id from reg where dept_name in('Comp. Sci.','Biology');*/

/*ques 11
select ID,name from student where tot_cred>30;*/

/*ques 12
select ID,name,instructor.dept_name,building from instructor inner join department on instructor.dept_name=department.dept_name;*/

/*ques 13
SELECT ID, COUNT(DISTINCT course_id)
FROM takes
GROUP BY ID;*/

/*ques 14
select ID from takes where course_id= 'CS-101'
intersect
select ID from takes where course_id= 'CS-190';

/*ques 15
select count(ID) from takes where course_id in(select course_id from teaches where ID='22222');*/





