-- 5.3 Listing Indexed Columns for a Table --
select *
  from pg_catalog.pg_indexes a join information_schema.columns b
  on a.indexdef ilike '%('||cast(b.column_name as text)||')%'
where a.schemaname = 'smeagol'
  and a.schemaname = b.table_schema;
