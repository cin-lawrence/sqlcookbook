-- 14.3 Transposing a Result Set Using Oracle's MODEL Clause --
CREATE TABLE EMP_CNT (
  DEPTNO INTEGER NOT NULL,
  CNT INTEGER NOT NULL
);

INSERT INTO EMP_CNT
VALUES
  (10, 3),
  (20, 5),
  (30, 6);

select
  max(case deptno when 10 then cnt else 0 end) as d10,
  max(case deptno when 20 then cnt else 0 end) as d20,
  max(case deptno when 30 then cnt else 0 end) as d30
  from emp_cnt;
