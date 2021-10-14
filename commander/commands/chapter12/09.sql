-- 12.9 Creating Horizontal Histograms --
select deptno, lpad('*', cast(count(*) as integer), '**') as cnt
  from emp
group by empno;
