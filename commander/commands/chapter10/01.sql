-- 10.1 Locating a Range of Consecutive Values --
create table projects (
  proj_id INTEGER not null,
  proj_start DATE,
  proj_end DATE
);

insert into projects (proj_id, proj_start, proj_end)
values
  (1, '01-JAN-2020', '02-JAN-2020'),
  (2, '02-JAN-2020', '03-JAN-2020'),
  (3, '03-JAN-2020', '04-JAN-2020'),
  (4, '04-JAN-2020', '05-JAN-2020'),
  (5, '06-JAN-2020', '07-JAN-2020'),
  (6, '16-JAN-2020', '17-JAN-2020'),
  (7, '17-JAN-2020', '18-JAN-2020'),
  (8, '18-JAN-2020', '19-JAN-2020'),
  (9, '19-JAN-2020', '20-JAN-2020'),
  (10, '21-JAN-2020', '22-JAN-2020'),
  (11, '26-JAN-2020', '27-JAN-2020'),
  (12, '27-JAN-2020', '28-JAN-2020'),
  (13, '28-JAN-2020', '29-JAN-2020'),
  (14, '29-JAN-2020', '30-JAN-2020');

select proj_id, proj_start, proj_end
  from (
    select proj_id, proj_start, proj_end, lead(proj_start) over (order by proj_id) next_proj_start
    from projects
  ) alias
where next_proj_start = proj_end;
