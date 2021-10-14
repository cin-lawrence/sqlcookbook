-- 12.13 Calculating Subtotals for All Possible Expression Combinations --
select deptno, job,
  case concat(cast(grouping(deptno) as char(1)), cast(grouping(job) as char(1)))
    when '00' then 'TOTAL BY DEPT AND JOB'
    when '10' then 'TOTAL BY JOB'
    when '01' then 'TOTAL BY DEPT'
    when '11' then 'GRAND TOTAL FOR TABLE'
  end category,
  sum(sal) as sal
  from emp
group by cube(deptno, job);
