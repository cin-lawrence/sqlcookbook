-- 12.14 Identifying Rows That Are Not Subtotals --
select deptno, job, sum(sal) sal, grouping(deptno) deptno_subtotals, grouping(job) job_subtotals
  from emp
group by cube(deptno, job);
