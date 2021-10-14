-- 11.6 Finding Records with the Highest and Lowest Values --
select ename
  from (
    select ename, sal, min(sal) over () min_sal, max(sal) over () max_sal
      from emp
  ) x
where sal in (min_sal, max_sal);
