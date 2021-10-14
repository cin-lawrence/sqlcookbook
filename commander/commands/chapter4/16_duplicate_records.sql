create table dupes (
  id integer,
  name varchar(10)
);

insert into dupes
values
  (1, 'NAPOLEON'),
  (2, 'DYNAMITE'),
  (3, 'DYNAMITE'),
  (4, 'SHE SELLS'),
  (5, 'SEA SHELLS'),
  (6, 'SEA SHELLS'),
  (7, 'SEA SHELLS');

select *
  from dupes
order by 1;
