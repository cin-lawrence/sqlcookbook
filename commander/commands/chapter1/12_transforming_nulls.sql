select
  case
    when comm is not null then comm
    else 0
  end
  from emp;

