-- GROUPING演算子

SELECT '合計' AS shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
UNION ALL
SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

-- ROLLUP
-- CUBE
-- GROUPING SETS

-- ROLLUP演算子で合計と小計を一度に求める
SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui WITH ROLLUP;

SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi WITH ROLLUP;

-- GROUPING関数
-- 超集合行のため生じたNULLを判別する
SELECT GROUPING(shohin_bunrui) AS shohin_bunrui,
    GROUPING(torokubi) AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi WITH ROLLUP;

SELECT  CASE
        WHEN GROUPING (shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui END AS shohin_bunrui,
        CASE
        WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
        SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi WITH ROLLUP;