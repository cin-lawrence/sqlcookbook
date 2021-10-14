-- 14.1 Creating Cross-Tab Reports --
select
  sum(case deptno when 10 then 1 else 0 end) as dept_10,
  sum(case deptno when 20 then 1 else 0 end) as dept_20,
  sum(case deptno when 30 then 1 else 0 end) as dept_30,
  sum(case deptno when 40 then 1 else 0 end) as dept_40
  from emp;
