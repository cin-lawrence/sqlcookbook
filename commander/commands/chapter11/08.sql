-- 11.8 Shifting Row Values --
select ename, sal, coalesce(lead(sal) over (order by sal), min(sal) over ()) as forward, coalesce(lead(sal) over (order by sal desc), max(sal) over ()) as rewind
  from emp;
