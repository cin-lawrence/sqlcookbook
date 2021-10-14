-- 14.12 Calculating Percent Relative to Total --
select job, count(*) num_emps, sum(sal) * 100 / sum_sal
  from emp, (select sum(sal) sum_sal from emp) y
group by job, sum_sal;
