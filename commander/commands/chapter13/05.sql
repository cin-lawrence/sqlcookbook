-- 13.5 Determining Which Rows Are Leaf, Branch, or Root Nodes --
select e.ename, (
  select sign(count(*))
    from emp d
  where 0 = (
    select count(*)
      from emp f
    where f.mgr = e.empno
  )
) as is_leaf, (
  select sign(count(*))
    from emp d
  where d.mgr = e.empno
    and e.mgr is not null
) as is_branch, (
  select sign(count(*))
    from emp d
  where d.empno = e.empno
    and d.mgr is null
) as is_root
  from emp e
order by 4 desc, 3 desc;
