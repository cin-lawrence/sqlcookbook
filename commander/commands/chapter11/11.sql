-- 11.11 Finging Knight Values --
select deptno, ename, sal, hiredate, max(latest_sal) over (partition by deptno) latest_sal
  from (
    select deptno, ename, sal, hiredate,
      case
        when hiredate = max(hiredate) over (partition by deptno) then sal
        else 0
      end latest_sal
      from emp
  ) x
order by 1, 4 desc;
