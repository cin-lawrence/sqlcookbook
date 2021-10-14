-- 6.17 Finding Text Not Matching a Pattern --
create table employee_comment (
  emp_id integer,
  text text
);

insert into employee_comment (emp_id, text)
values
  (7369, '126 Varnum, Edmore MI 48829, 989 313-5351'),
  (7499, E'1105 McConnell Court,\nCedar Lake MI 48812\nHome: 989-387-4321\nCell: (237) 438-3333'),
  (7844, '989-387.5359'),
  (9999, '906-387-1698, 313-535.8886');

select * from employee_comment;

select emp_id, text
  from employee_comment
where text ~ '[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}'
  and regexp_replace(text, '[0-9]{3}([-. ])[0-9]{3}\1[0-9]{4}', '***') ~ '[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}';
