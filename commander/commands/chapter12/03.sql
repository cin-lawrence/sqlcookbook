-- 12.3 Reverse Pivoting a Result Set --
create view emp_cnts
as (
select
  sum(case when deptno = 10 then 1 else 0 end) as deptno_10,
  sum(case when deptno = 20 then 1 else 0 end) as deptno_20,
  sum(case when deptno = 30 then 1 else 0 end) as deptno_30
  from emp
);

select dept.deptno,
  case dept.deptno
    when 10 then emp_cnts.deptno_10
    when 20 then emp_cnts.deptno_20
    when 30 then emp_cnts.deptno_30
  end as counts_by_dept
  from emp_cnts cross join (select deptno from dept where deptno <= 30) dept;
