-- 5.1 Listing Tables in a Schema --
select table_name
  from information_schema.tables
where table_schema = 'smeagol';
