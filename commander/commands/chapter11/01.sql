-- 11.1 Paginating Through a Result Set --
select sal
  from (
    select row_number() over (order by sal) as rn, sal
      from emp
  ) x
where rn between 1 and 5;
