-- 12.20 Pivoting a Result Set with Subtotals --
select
  mgr,
  sum(
    case deptno
      when 10 then sal
      else 0
    end
  ) dept10,
  sum(
    case deptno
      when 20 then sal
      else 0
    end
  ) dept20,
  sum(
    case deptno
      when 30 then sal
      else 0
    end
  ) dept30,
  sum(
    case flag
      when '11' then sal
      else null
    end
  ) total
  from (
    select deptno, mgr, sum(sal) sal, concat(cast(grouping(deptno) as char(1)), cast(grouping(deptno) as char(1))) flag,
      from emp
    where mgr is not null
    group by rollup (deptno, mgr)
  ) x
group by mgr;
