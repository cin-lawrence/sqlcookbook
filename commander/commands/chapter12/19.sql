-- 12.19 Performing Aggregations over a Moving Range of Values --
select e.hiredate, e.sal, (select sum(sal) from emp d where d.hiredate between e.hiredate - 90 and e.hiredate) as spending_pattern
  from emp e
order by 1;
