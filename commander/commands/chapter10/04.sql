-- 10.4 Filling in Missing Values in a Range of Values --
select y.yr, coalesce(x.cnt, 0) as cnt
  from (
    select min_year - mod(cast(min_year as int), 10) + rn as yr
      from (
        select (select min(extract(year from hiredate)) from emp) as min_year, id - 1 as rn
          from t10
      ) a
  ) y
  left join (
    select extract(year from hiredate) as yr, count(*) as cnt
      from emp
    group by extract(year from hiredate)
  ) x
  on y.yr = x.yr;

