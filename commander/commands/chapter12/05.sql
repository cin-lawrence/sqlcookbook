-- 12.5 Suppressing Repeating Values from a Result Set --
select
  case
    when lag(deptno) over (order by deptno) = deptno then null
    else deptno
  end DEPTNO, ename
  from emp;
