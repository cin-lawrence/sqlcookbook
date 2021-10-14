-- 11.9 Ranking Results --
select dense_rank() over (order by sal) rnk, sal
  from emp;
