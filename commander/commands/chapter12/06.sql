-- 12.6 Pivoting a Result Set to Facilitate Inter-Row Calculations --
select d20_sal - d10_sal as d20_10_diff, d20_sal - d30_sal as d20_30_diff
  from (
    select
      sum(
        case
          when deptno = 10 then sal
        end
      ) as d10_sal,
      sum(
        case
          when deptno = 20 then sal
          end
      ) as d20_sal,
      sum (
        case
          when deptno = 30 then sal
          end
      ) as d30_sal
      from emp
  ) totals_by_dept;
