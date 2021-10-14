insert into emp (empno, ename, deptno, sal, hiredate)
values
  (1, 'ant', 10, 1000, to_date('17-NOV-2006')),
  (2, 'joe', 10, 1500, to_date('17-NOV-2006')),
  (3, 'jim', 10, 1600, to_date('17-NOV-2006')),
  (5, 'jon', 10, 1700, to_date('17-NOV-2006'));


select deptno, ename, sal, hiredate, lpad(coalesce(cast(sal - next_sal as char(6)), 'N/A'), 10) diff
  from (
    select deptno, ename, sal, hiredate, lead(sal, cast(cnt - rn + 1 as integer)) over (partition by deptno order by hiredate) next_sal
      from (
        select deptno, ename, sal, hiredate, count(*) over (partition by deptno, hiredate) cnt, row_number() over (partition by deptno, hiredate order by sal) rn
          from emp
        where deptno = 10
      ) x
  ) y;
