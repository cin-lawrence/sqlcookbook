-- 11.2 Skipping n Rows from a Table --
select ename
  from (
    select row_number() over (order by ename) rn, ename
      from emp
  ) x
where mod(rn, 2) = 1;
