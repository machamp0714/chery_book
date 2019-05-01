-- ビュー
/*
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS 
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;
*/

-- ビューを使う
-- SELECT * FROM ShohinSum;

-- 多段ビュー
-- CREATE VIEW ShohinSumJim (shohin_bunrui, cnt_shohin)
-- AS
-- SELECT shohin_bunrui, cnt_shohin
-- FROM ShohinSum
-- WHERE shohin_bunrui = '事務用品';

-- VIEWを更新できるケース
-- CREATE VIEW SHohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
-- AS
-- SELECT *
-- FROM Shohin
-- WHERE shohin_bunrui = '事務用品';

-- INSERT INTO ShohinJim VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- サブクエリ
SELECT shohin_bunrui, cnt_shohin
FROM (
  SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
  FROM Shohin
  GROUP BY shohin_bunrui
)
AS SHohinSum;

SELECT shohin_bunrui, cnt_shohin
FROM (SELECT *
  FROM (
    SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
    FROM Shohin
    GROUP BY shohin_bunrui
  ) AS ShohinSum
  WHERE cnt_shohin = 4
) AS ShohinSum2;

-- サブクエリ
SELECT shohin_id, shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka) FROM Shohin);

-- SELECT句でサブクエリを使う
SELECT shohin_id, shohin_mei, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin)
FROM Shohin;

-- HAVING句でサブクエリを使う
SELECT shohin_bunrui, AVG(hanbai_tanka) AS avg
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) > (SELECT AVG(hanbai_tanka) FROM SHohin);

-- 相関サブクエリ
-- SELECT shohin_bunrui, shohin_mei, hanbai_tanka
-- FROM Shohin AS S1
-- WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
--                       FROM Shohin AS S2
--                       WHERE S1.shohin_bunrui = S2.shohin_bunrui
--                       GROUP BY shohin_bunrui);

-- 練習問題
-- 5.1
-- CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
-- AS
-- SELECT shohin_mei, hanbai_tanka, torokubi
-- FROM Shohin
-- WHERE hanbai_tanka >= 1000 && torokubi = '2009-09-20';

-- 5.2
-- エラーが生じる

-- 5.3
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin) AS hanbai_tanka_all
-- FROM Shohin;

-- -- 5.4
-- CREATE VIEW AvgTankaByBunrui (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
-- AS
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka)
--                                                             FROM Shohin AS S2
--                                                             WHERE S1.shohin_bunrui = S2.shohin_bunrui
--                                                             GROUP BY shohin_bunrui)
-- FROM Shohin AS S1;