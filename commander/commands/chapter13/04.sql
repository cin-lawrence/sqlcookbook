-- 13.4 Finding All Child Rows for a Given Parent--
with recursive x (ename, empno)
as (
select ename, empno
  from emp
where ename = 'JONES'
union all
select e.ename, e.empno
  from emp e, x
where x.empno = e.mgr
)

select ename
  from x;
