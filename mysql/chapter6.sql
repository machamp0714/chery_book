-- ABS関数
SELECT m, ABS(m) AS abs_col FROM SampleMath;

-- MOD関数 使えるのは整数型の列だけ
SELECT n, p, MOD(n,p) AS mod_col FROM SampleMath;

-- ROUND関数
SELECT m, n, ROUND(m,n) AS round_col FROM SampleMath;

-- CONCAT関数(MySQLではCONCAT関数を利用する)
SELECT str1, str2, CONCAT(str1,str2) AS connect_str FROM SampleStr;

-- LENGTH関数 文字列の長さをバイト単位で返す
-- 日本語全角文字は2バイト以上使って表現される
SELECT str1, LENGTH(str1) AS str_length FROM SampleStr;

-- LOWER関数 UPPER関数　小文字化
SELECT str1, LOWER(str1) AS str_low FROM SampleStr;

-- REPLACE関数 (対象文字列, 置換前の文字列, 置換後の文字列)
SELECT str1, str2, str3, REPLACE(str1, str2, str3) FROM SampleStr;

-- SUBSTRING関数 文字列の切り出し
SELECT str1, SUBSTRING(str1 FROM 3 FOR 2) AS sub_str FROM SampleStr;
