-- 13.3 Creating a Hierarchical View of a Table --
with recursive x (ename, empno)
as (
select cast(ename as varchar(100)), empno
  from emp
where mgr is null
union all
select cast(x.ename||' - '||e.ename as varchar(100)), e.empno
  from emp e, x
where e.mgr = x.empno
)

select ename as emp_tree
  from x
order by 1;
