-- 5.5. Listing Foreign Keys Without Corresponding Indexes --
select fkeys.table_name, fkeys.constraint_name, fkeys.column_name, ind_cols.indexname
  from (
    select a.constraint_schema, a.table_name, a.constraint_name, a.column_name
      from information_schema.key_column_usage a, information_schema.referential_constraints b
      where a.constraint_name = b.constraint_name
        and a.constraint_schema = b.constraint_schema
        and a.constraint_schema = 'smeagol'
        and a.table_name = 'emp'
  ) fkeys left join (
    select a.schemaname, a.tablename, a.indexname, b.column_name
      from pg_catalog.pg_indexes a, information_schema.columns b
    where a.tablename = b.table_name
      and a.schemaname = b.table_schema
  ) ind_cols
  on (
    fkeys.constraint_schema = ind_cols.schemaname
      and fkeys.table_name = ind_cols.tablename
      and fkeys.column_name = ind_cols.column_name
  )
where ind_cols.indexname is null;
