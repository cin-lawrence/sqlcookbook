-- 12.12 Calculating Simple Subtotals --
select coalesce(job, 'TOTAL') job, sum(sal) sal
  from emp
group by rollup(job);
