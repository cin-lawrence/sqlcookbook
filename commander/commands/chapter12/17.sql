-- 12.17 Grouping Rows by Units of Time --
create table TRX_LOG (
  trx_id INTEGER NOT NULL,
  trx_date TIMESTAMP,
  trx_cnt INTEGER
);

insert into TRX_LOG (trx_id, trx_date, trx_cnt)
values
  (1, '28-JUL-2020 19:03:07', 44),
  (2, '28-JUL-2020 19:03:08', 18),
  (3, '28-JUL-2020 19:03:09', 23),
  (4, '28-JUL-2020 19:03:10', 29),
  (5, '28-JUL-2020 19:03:11', 27),
  (6, '28-JUL-2020 19:03:12', 45),
  (7, '28-JUL-2020 19:03:13', 45),
  (8, '28-JUL-2020 19:03:14', 32),
  (9, '28-JUL-2020 19:03:15', 41),
  (10, '28-JUL-2020 19:03:16', 15),
  (11, '28-JUL-2020 19:03:17', 24),
  (12, '28-JUL-2020 19:03:18', 47),
  (13, '28-JUL-2020 19:03:19', 37),
  (14, '28-JUL-2020 19:03:20', 48),
  (15, '28-JUL-2020 19:03:21', 46),
  (16, '28-JUL-2020 19:03:22', 44),
  (17, '28-JUL-2020 19:03:23', 36),
  (18, '28-JUL-2020 19:03:24', 41),
  (19, '28-JUL-2020 19:03:25', 33),
  (20, '28-JUL-2020 19:03:26', 19);

select
  ceil(trx_id / 5.0) as grp,
  min(trx_date) as trx_start,
  max(trx_date) as trx_end,
  sum(trx_cnt) as total
  from trx_log
group by ceil(trx_id / 5.0);

select hr, grp, sum(trx_cnt) total
  from (
    select trx_date, trx_cnt, to_number(to_char(trx_date, 'hh24'), '9999') hr, ceil(to_number(to_char(trx_date - interval '1 second', 'miss'), '9999') / 5.0) grp
      from trx_log
  ) x
group by hr, grp;
