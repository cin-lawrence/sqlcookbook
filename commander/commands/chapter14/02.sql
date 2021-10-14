-- 14.2 Unpivoting a Cross-Tab Report Using SQL Server's UNPIVOT Operator --
create table PIVOT (
  ACCOUNTING INTEGER NOT NULL,
  RESEARCH INTEGER NOT NULL,
  SALES INTEGER NOT NULL,
  OPERATIONS INTEGER NOT NULL
);

insert into PIVOT (ACCOUNTING, RESEARCH, SALES, OPERATIONS)
values (3, 5, 6, 0);

select 'ACCOUNTING' as dname, accounting as cnt
  from pivot
union all
select 'RESEARCH' as dname, research as cnt
  from pivot
union all
select 'SALES' as dname, sales as cnt
  from pivot
union all
select 'OPERATIONS' as dname, operations as cnt
  from pivot;
