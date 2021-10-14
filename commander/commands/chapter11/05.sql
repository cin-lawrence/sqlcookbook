-- 11.5 Selecting the Top n Records --
select ename, sal
  from (
    select ename, sal, dense_rank() over (order by sal desc) dr
      from emp
  ) x
where dr <= 5;
