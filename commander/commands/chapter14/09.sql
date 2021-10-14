-- 14.9 Adding a Column Header into a Double Pivoted Result Set --
create table IT_research (
  deptno INTEGER,
  ename VARCHAR(20)
);

create table IT_apps (
  deptno INTEGER,
  ename VARCHAR(20)
);

insert into IT_research values
  (100, 'HOPKINS'),
  (100, 'JONES'),
  (100, 'TONEY'),
  (200, 'MORALES'),
  (200, 'P.WHITAKER'),
  (200, 'MARCIANO'),
  (200, 'ROBINSON'),
  (300, 'LACY'),
  (300, 'WRIGHT'),
  (300, 'J.TAYLOR');

insert into IT_apps values
  (400, 'CORRALES'),
  (400, 'MAYWEATHER'),
  (400, 'CASTILLO'),
  (400, 'MARQUEZ'),
  (400, 'MOSLEY'),
  (500, 'GATTI'),
  (500, 'CALZAGHE'),
  (600, 'LAMOTTA'),
  (600, 'HAGLER'),
  (600, 'HEARNS'),
  (600, 'FRAZIER'),
  (700, 'GUINN'),
  (700, 'JUDAH'),
  (700, 'MARGARITO');


select max(case flag2 when 0 then it_dept end) research, max(case flag2 when 1 then it_dept end) apps
  from (
    select sum(flag1) over (partition by flag2 order by flag1, rownum) flag, it_dept, flag2
      from (
		select 1 flag1, 0 flag2, case rn when 1 then cast(deptno as char(4)) else '  '||ename end it_dept, row_number() over () rownum
          from (
            select x.*, y.id, row_number() over (partition by x.deptno order by y.id, x.ename) rn
              from (
                select deptno, ename, count(*) over (partition by deptno) cnt
                  from it_research
              ) x, (
                select id from generate_series(1, 2) x(id)
              ) y
          ) z
        where rn <= cnt + 1
        union all
		select 1 flag1, 1 flag2, case rn when 1 then cast(deptno as char(3)) else '  '||ename end it_dept, row_number() over () rownum
          from (
            select x.*, y.id, row_number() over (partition by x.deptno order by y.id, x.ename) rn
              from (
                select deptno, ename, count(*) over (partition by deptno) cnt
                  from it_apps
              ) x, (
                select id from generate_series(1, 2) x(id)
              ) y
        ) z
        where rn <= cnt + 1
    ) tmp1
  ) tmp2
group by flag
order by flag;
