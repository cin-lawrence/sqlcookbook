-- 12.11 Returning Non-GROUP BY Columns --
select deptno, ename, job, sal,
  case
    when sal = max_by_dept then 'TOP SAL IN DEPT'
    when sal = min_by_dept then 'LOW SAL IN DEPT'
  end dept_status,
  case
    when sal = max_by_job then 'TOP SAL IN JOB'
    when sal = min_by_job then 'LOW SAL IN JOB'
  end job_status
  from (
    select deptno, ename, job, sal,
      max(sal) over (partition by deptno) max_by_dept,
      max(sal) over (partition by job) max_by_job,
      min(sal) over (partition by deptno) min_by_dept,
      min(sal) over (partition by job) min_by_job
      from emp
  ) emp_sals
where sal in (max_by_dept, max_by_job, min_by_dept, min_by_job);

