-- 12.1 Pivoting a Result Set into One Row --
select
  sum(
    case
      when deptno = 10 then 1
      else 0
    end
  ) as deptno_10,
  sum(
    case
      when deptno = 20 then 1
      else 0
    end
  ) as deptno_20,
  sum(
    case
      when deptno = 30 then 1
      else 0
    end
  ) as deptno_30
  from emp;

