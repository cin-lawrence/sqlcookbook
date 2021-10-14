create table emp_commission (
  deptno INTEGER NOT NULL,
  empno INTEGER NOT NULL,
  ename VARCHAR(32) NOT NULL,
  comm INTEGER
)

insert into emp_commission
values
  (10, 7782, 'CLARK', null),
  (10, 7839, 'KING', null),
  (10, 7934, 'MILLER', null)
