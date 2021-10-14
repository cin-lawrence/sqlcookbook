-- 12.10 Creating Vertical Histograms --
select max(deptno_10) d10, max(deptno_20) d20, max(deptno_30) d30
  from (
    select row_number() over (partition by deptno order by empno) rn,
      case
        when deptno = 10 then '*'
        else null
      end deptno_10,
      case
        when deptno = 20 then '*'
        else null
      end deptno_20,
      case
        when deptno = 30 then '*'
        else null
      end deptno_30
      from emp
  ) x
  group by rn
order by 1 desc, 2 desc, 3 desc;
