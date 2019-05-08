-- 結合
-- 集合演算との違いは、集合演算は行数が増えたり減ったりする。

-- 内部結合 INNER JOIN
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS
INNER JOIN Shohin AS S 
ON TS.shohin_id = S.shohin_id;

SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS
INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id
WHERE TS.tenpo_id = '000A';

-- 外部結合
SELECT TS.tenpo_id, TS.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS
RIGHT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;

-- ３つのテーブルの結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka, ZS.zaiko_suryo
FROM TenpoShohin AS TS
INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id
  INNER JOIN ZaikoShohin AS ZS
  ON TS.shohin_id = ZS.shohin_id;

-- クロス結合
SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei
FROM TenpoShohin AS TS CROSS JOIN Shohin AS S;

-- 練習問題
SELECT COALESCE(TS.tenpo_id, '不明') AS tenpo_id, COALESCE(TS.tenpo_mei, '不明') AS tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
FROM TenpoShohin AS TS
RIGHT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;
