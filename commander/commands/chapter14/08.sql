-- 14.8 Pivoting a Ranked Result Set --
select
  max(case grp when 1 then rpad(ename, 6)||' ('||sal||') ' end) top_3,
  max(case grp when 2 then rpad(ename, 6)||' ('||sal||') ' end) next_3,
  max(case grp when 3 then rpad(ename, 6)||' ('||sal||') ' end) rest
  from (
    select ename, sal, rnk,
      case
        when rnk <=3 then 1
        when rnk <=6 then 2
        else 3
      end grp,
      row_number() over (partition by
        case
          when rnk <=3 then 1
          when rnk <=6 then 2
          else 3
        end order by sal desc, ename) grp_rnk
      from (
        select ename, sal, dense_rank() over (order by sal desc) rnk
        from emp
      ) x
  ) y
group by grp_rnk
order by grp_rnk;
