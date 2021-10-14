-- 14.4 Extracting Elements of a String from Unfixed Locations --
create view V
as
select 'xxxxxabc[867]xxx[-]xxxx[5309]xxxxx' msg
  from t1
union all
select 'xxxxxtime:[11271978]favnum:[4]id:[Joe]xxxxx' msg
  from t1
union all
select 'call:[F_GET_ROWS()]b1:[ROSEWOOD_SIR]b2:[44400002]77.90xxxxx' msg
  from t1
union all
select 'film:[non_marked]qq:[unit]tailpipe:[withabanana?]80sxxxxx' msg
  from t1;


select
  substr(first_str, strpos(first_str, '[') + 1, strpos(first_str, ']') - strpos(first_str, '[') - 1) first_val,
  substr(
    second_str,
	strpos(second_str, '[') + 1,
	strpos(second_str, ']') - strpos(second_str, '[') - 1
  ) second_val,
  substr(
	last_str,
	strpos(last_str, '[') + 1,
	strpos(last_str, ']') - strpos(last_str, '[') - 1
  ) last_val
  from (
    select
	  msg as first_str,
	  substr(msg, strpos(msg, ']') + 1) as second_str,
	  substr(
	    substr(msg, strpos(msg, ']') + 1),
	    strpos(substr(msg, strpos(msg, ']') + 1), ']') + 1
	  ) as last_str
 	  from V
  ) x
