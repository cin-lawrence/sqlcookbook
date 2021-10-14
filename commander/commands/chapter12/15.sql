-- 12.15 Using Case Expression to Flag Rows --
select ename,
  case
    when job = 'CLERK' then 1
    else 0
  end as is_clerk,
  case
    when job = 'SALESMAN' then 1
    else 0
  end as is_sales,
  case
    when job = 'MANAGER' then 1
    else 0
  end as is_mgr,
  case
    when job = 'ANALYST' then 1
    else 0
  end as is_analyst,
  case
    when job = 'PRESIDENT' then 1
    else 0
  end as is_prez
  from emp
order by 2, 3, 4, 5, 6;
