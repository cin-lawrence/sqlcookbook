create table dept_accidents (
  deptno integer,
  accident_name varchar(20)
);

insert into dept_accidents
values
  (10, 'BROKEN FOOT'),
  (10, 'FLESH WOUND'),
  (20, 'FIRE'),
  (20, 'FIRE'),
  (20, 'FLLOD'),
  (30, 'BRUISED GLUTE');

select * from dept_accidents;
