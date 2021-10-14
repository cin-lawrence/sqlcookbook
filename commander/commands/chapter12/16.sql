-- 12.16 Creating a Sparse Matrix --
select
  case deptno
    when 10 then ename
  end as d10,
  case deptno
    when 20 then ename
  end as d20,
  case deptno
    when 30 then ename
  end as d30,
  case job
    when 'CLERK' then ename
  end as clerks,
  case job
    when 'MANAGER' then ename
  end as mgrs,
  case job
    when 'PRESIDENT' then ename
  end as prez,
  case job
    when 'ANALYST' then ename
  end as analysts,
  case job
    when 'SALESMAN' then ename
  end as sales
  from emp;
