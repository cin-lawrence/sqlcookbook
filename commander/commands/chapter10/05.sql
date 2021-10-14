-- 10.5 Fenerating Consecutive Numeric Values --
select id
  from generate_series (1, 10) x(id);

select id
  from generate_series (
    (select min(deptno) from emp),
    (select max(deptno) from emp),
    5
  ) x(id);
