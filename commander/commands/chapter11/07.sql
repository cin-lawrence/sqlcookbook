-- 11.7 Investigating Future Rows --
select ename, sal, hiredate
  from (
    select ename, sal, hiredate, lead (sal) over (order by hiredate) next_sal
      from emp
  ) alias
where sal < next_sal;
