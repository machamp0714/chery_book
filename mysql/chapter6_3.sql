--CASE式
SELECT shohin_mei,
      CASE WHEN shohin_bunrui = '衣服'
            THEN CONCAT('A: ', shohin_bunrui)
            WHEN shohin_bunrui = '事務用品'
            THEN CONCAT('B: ', shohin_bunrui)
            WHEN shohin_bunrui = 'キッチン用品'
            THEN CONCAT('C: ', shohin_bunrui)
            ELSE NULL -- CASE式のELSE句は省略可能だが、省略しないこと
      END AS abc_shohin_bunrui
FROM Shohin;

SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT 
  SUM(
    CASE
    WHEN shohin_bunrui = '衣服'
    THEN hanbai_tanka ELSE 0 END
  ) AS sum_tanka_ihuku,
  SUM(
    CASE
    WHEN shohin_bunrui = '事務用品'
    THEN hanbai_tanka ELSE 0 END
  ) AS sum_tanka_zimu,
  SUM(
    CASE
    WHEN shohin_bunrui = 'キッチン用品'
    THEN hanbai_tanka ELSE 0 END
  ) AS sum_tanka_kitchen
FROM Shohin;

-- 練習問題
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (500, 2800, 5000, NULL); -- empty set?

SELECT 
  SUM(
    CASE 
    WHEN hanbai_tanka <= 1000
    THEN 1 ELSE 0 END
  ) AS low_price,
  SUM(
    CASE
    WHEN hanbai_tanka BETWEEN 1001 AND 3000
    THEN 1 ELSE 0 END
  ) AS mid_price,
  SUM(
    CASE
    WHEN hanbai_tanka > 3000
    THEN 1 ELSE 0 END
  ) AS high_price
FROM Shohin;

SELECT COUNT(*) AS low_price
FROM Shohin
WHERE hanbai_tanka <= 1000;