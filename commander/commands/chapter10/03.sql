-- 10.3 Locating the Beginning and End of a Range of Consecutive Values --
select proj_grp, min(proj_start), max(proj_end)
  from (
    select proj_id, proj_start, proj_end, sum(flag) over (order by proj_id) proj_grp
      from (
        select proj_id, proj_start, proj_end,
          case
            when lag(proj_end) over (order by proj_id) = proj_start then 0
            else 1
          end flag
          from projects
      ) alias1
  ) alias2
group by proj_grp;
