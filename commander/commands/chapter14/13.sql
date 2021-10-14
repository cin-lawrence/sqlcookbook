-- 14.13 Testing for Existence of a Value Within a Group --
create view V as
select
  1 student_id, 1 test_id, 2 grade_id, 1 period_id,
  to_date('02/01/2020', 'MM/DD/YYYY') test_date, 0 pass_fail
  from t1
union all
select 1, 2, 2, 1, to_date('03/01/2020', 'MM/DD/YYYY'), 1 from t1
union all
select 1, 3, 2, 1, to_date('04/01/2020', 'MM/DD/YYYY'), 0 from t1
union all
select 1, 4, 2, 2, to_date('05/01/2020', 'MM/DD/YYYY'), 0 from t1
union all
select 1, 5, 2, 2, to_date('06/01/2020', 'MM/DD/YYYY'), 0 from t1
union all
select 1, 6, 2, 2, to_date('07/01/2020', 'MM/DD/YYYY'), 0 from t1;

select * from V;


select student_id, test_id, grade_id, period_id, test_date,
  case grp_p_f when 1 then lpad('+', 6) else lpad('-', 6) end metreq,
  case grp_p_f when 1 then 0 else (case test_date when last_test then 1 else 0 end) end in_progress
  from (
    select
	  V.*,
	  max(pass_fail) over (partition by student_id, grade_id, period_id) grp_p_f,
	  max(test_date) over (partition by student_id, grade_id, period_id) last_test
	  from V
  ) x;
