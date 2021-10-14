-- 13.1 Expressing a Parent-Child Relationship --
select a.ename||' works for '||b.ename as emps_and_mrgs
  from emp a, emp b
where a.mgr = b.empno;
