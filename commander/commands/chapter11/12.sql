-- 11.12 Generating Simple Forecasts --
select id, order_date, process_date,
  case
    when gs.n >= 2 then process_date + 1
    else null
  end as verified,
  case
    when gs.n = 3 then process_date + 2
    else null
  end as shipped
  from (
    select gs.id, current_date + gs.id as order_date, current_date + gs.id + 2 as process_date
      from generate_series(1, 3) gs(id)
  ) orders, generate_series(1, 3) gs(n);
