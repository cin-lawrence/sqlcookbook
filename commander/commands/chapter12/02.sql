-- 12.2 Pivoting a Result Set into Multiple Rows --
select
  max(
    case
      when job = 'CLERK' then ename
      else null
    end
  ) as clerks,
  max(
    case
      when job = 'ANALYST' then ename
      else null
    end
  ) as analysts,
  max(
    case
      when job = 'MANAGER' then ename
      else null
    end
  ) as mgrs,
  max(
    case
      when job = 'PRESIDENT' then ename
      else null
    end
  ) as prez,
  max(
    case
      when job = 'SALESMAN' then ename
      else null
    end
  ) as sales
  from (
    select job, ename, row_number() over (partition by job order by ename) rn
    from emp
  ) x
group by rn;

