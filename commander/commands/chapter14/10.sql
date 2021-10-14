-- 14.10 Converting a Scalar Subquery to a Composite Subquery in Oracle --
select e.deptno, e.ename, e.sal, d.dname, d.loc, current_date today
  from emp e join dept d
  on e.deptno = d.deptno;
