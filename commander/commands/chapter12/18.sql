-- 12.18 Performing Aggregations over Different Groups/Partitions Simultaneously --
select ename, deptno, count(*) over (partition by deptno) deptno_cnt, job, count (*) over (partition by job) job_cnt, count (*) over () total
  from emp;
