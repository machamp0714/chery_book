-- ABS関数
SELECT m, ABS(m) AS abs_col FROM SampleMath;

-- MOD関数 使えるのは整数型の列だけ
SELECT n, p, MOD(n,p) AS mod_col FROM SampleMath;

-- ROUND関数
SELECT m, n, ROUND(m,n) AS round_col FROM SampleMath;