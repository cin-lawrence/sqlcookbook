-- 13.2 Expressing a Child-Parent-Grantparent --
with recursive x (tree, mgr, depth)
as (
select cast(ename as varchar(100)), mgr, 0
  from emp
where ename = 'MILLER'
union all
select cast(x.tree||'-->'||e.ename as varchar(100)), e.mgr, x.depth + 1
  from emp e, x
where x.mgr = e.empno
)

select tree leaf___branch___root
  from x
where depth = 2;
