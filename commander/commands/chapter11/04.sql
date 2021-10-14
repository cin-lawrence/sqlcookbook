-- 11.4 Determining Which Rows Are Reciprocals --
create table TEST (
  test1 INTEGER,
  test2 INTEGER
);

insert into TEST (test1, test2)
values
  (20, 20),
  (50, 25),
  (20, 20),
  (60, 30),
  (70, 90),
  (80, 130),
  (90, 70),
  (100, 50),
  (110, 55),
  (120, 60),
  (130, 80),
  (140, 70);

select distinct v1.*
  from test v1, test v2
where v1.test1 = v2.test2
  and v1.test2 = v2.test1
  and v1.test1 <= v1.test2;
