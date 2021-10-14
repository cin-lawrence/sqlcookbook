-- 14.6 Searching for Mixed Alphanumeric Strings --
with V as (
  select 'ClassSummary' strings from t1
  union
  select '3453430278' from t1
  union
  select 'findRow 55' from t1
  union
  select '1010 switch' from t1
  union
  select '333' from t1
  union
  select 'threes' from t1
)

select strings
  from (
    select strings, translate(strings, 'abcdefghijklmnopqrstuvwxyz0123456789', rpad('#', 26, '#')||rpad('*', 10, '*')) translated
    from v
  ) x
where strpos(translated, '#') > 0
  and strpos(translated, '*') > 0;
