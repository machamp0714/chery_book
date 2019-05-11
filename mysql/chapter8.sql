-- ウィンドウ関数 OLAP関数 Online Analytical Processing

-- RANK関数
-- PARTITION BYで区切られた部分集合を「ウィンドウ」と呼ぶ
SELECT shohin_mei, shohin_bunrui, hanbai_tanka, RANK () OVER (PARTITION BY shohin_bunrui ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- PATITION BYはなくても構わない
SELECT shohin_mei, shohin_bunrui, hanbai_tanka, RANK () OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- ウィンドウ関数はselect句でしか使えない

SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
      RANK () OVER (ORDER BY hanbai_tanka) AS rank,
      DENSE_RANK () OVER (ORDER BY hanbai_tanka) AS dense_rank,
      ROW_NUMBER () OVER (ORDER BY hanbai_tanka) AS row_num
FROM Shohin;

-- SUM関数をウィンドウ関数として使う 累計
SELECT shohin_id, shohin_mei, hanbai_tanka,
    SUM(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
FROM Shohin;

-- 移動平均
SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG(hanbai_tanka) OVER (ORDER BY shohin_id ROWS 2 PRECEDING) AS moving_avg -- 自分の行 + 前の２行
FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG(hanbai_tanka) OVER (ORDER BY shohin_id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM Shohin;

-- 2つのORDER BY
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK() OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin
ORDER BY ranking;