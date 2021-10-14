-- 14.11 Parsing Serialized Data into Rows --
create view V as
select 'entry:stewiegriffin:lois:brian:' strings from t1
union all
select 'entry:moe::sizlack:' from t1
union all
select 'entry:petergriffin:meg:chris:' from t1
union all
select 'entry:willie:' from t1
union all
select 'entry:quagmire:mayorwest:cleveland:' from t1
union all
select 'entry:::flanders:' from t1
union all
select 'entry:robo:tchi:ken:' from t1;

select split_part(v.strings, ':', 2) val1, split_part(v.strings, ':', 3) val2, split_part(v.strings, ':', 4) val3
from v;
