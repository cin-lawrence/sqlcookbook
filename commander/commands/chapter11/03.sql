-- 11.3 Incoporating OR Logic When Using Outer Joins --
select e.ename, d.deptno, d.dname, d.loc
  from dept d left outer join emp e
  on d.deptno = e.deptno
    and e.deptno in (10, 20)
order by 2;
