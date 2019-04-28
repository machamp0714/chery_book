-- INSERT文 基本
-- INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi) 
-- VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

-- INSERT文 全列に対してinsertする場合、列リストは省略できる
-- INSERT INTO ShohinIns VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');

-- NULLを挿入する
-- INSERT INTO ShohinIns VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');

-- デフォルト値を挿入する
-- INSERT INTO ShohinIns VALUES ('0007', 'おろし金', 'キッチン用品', DEFAULT, 790, '2009-04-28');

-- テーブルをコピーする
-- CREATE TABLE ShohinCopy(
--   shohin_id CHAR(4) NOT NULL,
--   shohin_mei VARCHAR(100) NOT NULL,
--   shohin_bunrui VARCHAR(32) NOT NULL,
--   hanbai_tanka INTEGER,
--   shiire_tanka INTEGER,
--   torokubi DATE,
--   PRIMARY KEY (shohin_id)
-- );

-- INSERT INTO ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi FROM Shohin;

-- INSERT文の中でSELECTを使う
INSERT INTO Shohinbunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
SELECT shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui;