-- 14.7 Converting Whole Numbers to Binary Using Oracle --
select ename, sal, trim(leading '0' from cast(sal::bit(20) as text))
  from emp;
