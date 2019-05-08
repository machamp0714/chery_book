-- 集合演算
-- 和集合 UNION
SELECT shohin_id, shohin_mei FROM Shohin
UNION
SELECT shohin_id, shohin_mei FROM Shohin2;

-- 集合演算子は、UNIONに関わらず、重複行は排除される。

  SELECT shohin_id, shohin_mei
  FROM Shohin
UNION ALL
  SELECT shohin_id, shohin_mei
  FROM Shohin2;

-- INTERSECT(テーブルの共通部分の選択) mysqlでは使えない
-- IN句は大抵遅いので、EXISTS + 相関サブクエリを使う
SELECT shohin_id, shohin_mei
FROM Shohin AS S1
WHERE EXISTS (
  SELECT shohin_mei, shohin_id
  FROM Shohin2 AS S2
  WHERE S1.shohin_id = S2.shohin_id
);


-- EXCEPT レコードの引き算（差集合）
-- EXCEPTはmysqlで使えないので、not existsを使う
SELECT shohin_id, shohin_mei
FROM Shohin2 AS S2
WHERE NOT EXISTS(
  SELECT shohin_id, shohin_mei
  FROM Shohin AS S1
  WHERE S2.shohin_id = S1.shohin_id
);