-- 10.2 Finding Differences Between Rows in the Same Group or Partition --
with next_sal_tab (deptno, ename, sal, hiredate, next_sal)
as
(
  select deptno, ename, sal, hiredate, lead(sal) over (partition by deptno order by hiredate) as next_sal
    from emp
)

select deptno, ename, sal, hiredate, coalesce(cast(sal - next_sal as char(6)), 'N/A') as diff
  from next_sal_tab;
