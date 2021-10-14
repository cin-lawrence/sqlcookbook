-- 5.4 Listing Constraints on a Table --
select a.table_name, a.constraint_name, b.column_name, a.constraint_type
  from information_schema.table_constraints a, information_schema.key_column_usage b
where a.table_name = 'emp'
  and a.table_schema = 'smeagol'
  and a.table_name = b.table_name
  and a.table_schema = b.table_schema
  and a.constraint_name = b.constraint_name;
