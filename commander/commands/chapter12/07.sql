-- 12.7 Creating Buckets of Data, of a Fixed Size --
select ceil(row_number() over (order by empno) / 5.0) grp, empno, ename
  from emp;
