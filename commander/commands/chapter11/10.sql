-- 11.10 Suppressing Duplicates --
select distinct job
  from emp;

select job
  from (
    select job, row_number() over (partition by job order by job) rn
      from emp
  ) x
where rn = 1;
