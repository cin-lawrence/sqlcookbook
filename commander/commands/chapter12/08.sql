-- 12.8 Creating a Predefined Number of Buckets --
select ntile(4) over (order by empno) grp, empno, ename
  from emp;
