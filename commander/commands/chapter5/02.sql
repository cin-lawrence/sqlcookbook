-- 5.2 Listing a Table's Columns --
select column_name, data_type, ordinal_position
  from information_schema.columns
where table_schema = 'smeagol'
  and table_name = 'emp';
