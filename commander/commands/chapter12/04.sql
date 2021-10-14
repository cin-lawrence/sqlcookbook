-- 12.4 Reverse Pivoting a Result Set into One Column --
with recursive four_rows (id)
as (
select 1
union all
select id + 1
  from four_rows
  where id < 4
),

x_tab (ename, job, sal, rn)
as (
select e.ename, e.job, e.sal, row_number() over (partition by e.empno order by e.empno)
  from emp e join four_rows on 1 = 1
)

select
  case rn
  when 1 then ename
  when 2 then job
  when 3 then cast(sal as char(4))
  end emps
  from x_tab;


with x_tab (ename, job, sal, rn)
as (
select e.ename, e.job, e.sal, row_number() over (partition by e.empno order by e.empno)
  from emp e join generate_series(1, 4) gs(id) on 1 = 1
)

select
  case rn
  when 1 then ename
  when 2 then job
  when 3 then cast(sal as char(4))
  end emps
  from x_tab;
