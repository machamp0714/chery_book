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
/*
INSERT INTO Shohinbunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
SELECT shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
FROM Shohin
GROUP BY shohin_bunrui;
*/

-- DELETE文 GROUP BY HAVING ORDER BYは使えない WHERE句のみ使える
--     DELETE FROM Shohin WHERE hanbai_tanka >= 4000;

-- UPDATE文
-- UPDATE Shohin SET torokubi = '2009-10-09';

-- UPDATE Shohin SET hanbai_tanka= hanbai_tanka * 10 WHERE shohin_bunrui = 'キッチン用品';

-- UPDATE Shohin SET torokubi = NULL WHERE shohin_id = '0008';

-- 複数列の更新
-- UPDATE Shohin 
-- SET hanbai_tanka = hanbai_tanka * 10, shiire_tanka = shiire_tanka / 0.8
-- WHERE shohin_bunrui = '事務用品';

-- トランザクション
/*
BEGIN TRANSACTION;
  UPDATE Shohin
  SET hanbai_tanka = hanbai_tanka - 1000
  WHERE shohin_mei = '穴あけパンチ';

  UPDATE Shohin
  SET hanbai_tanka = hanbai_tanka + 1000
  WHERE shohin_mei = 'Tシャツ';
COMMIT;
*/

-- 練習問題
-- BEGIN TRANSACTION;
-- INSERT INTO ShohinCopy VALUES ( '0001', 'Tシャツ', '衣服', 1000, 500, '2008-09-20' );
-- INSERT INTO ShohinCopy VALUES ( '0002', '穴あけパンチ', '事務用品', 500, 320, '2008-09-11' );
-- INSERT INTO ShohinCopy VALUES ( '0003', 'カッターシャツ', '衣服', 4000, 2800, NULL );

-- INSERT INTO ShohinCopy SELECT * FROM ShohinCopy;
-- primary keyは重複が許されないのでエラーが生じる

-- CREATE TABLE ShohinSaeki(
--   shohin_id CHAR(4) NOT NULL,
--   shohin_mei VARCHAR(100) NOT NULL,
--   shohin_bunrui VARCHAR(32) NOT NULL,
--   hanbai_tanka INTEGER,
--   shiire_tanka INTEGER,
--   saeki INTEGER,
--   PRIMARY KEY(shohin_id)
-- );

-- INSERT INTO ShohinSaeki(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, saeki)
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
-- FROM ShohinCopy;

BEGIN TRANSACTION;
UPDATE ShohinSaeki SET hanbai_tanka = 3000 WHERE shohin_mei = 'カッターシャツ';
UPDATE ShohinSaeki SET saeki = hanbai_tanka - shiire_tanka WHERE shohin_mei = 'カッターシャツ';
COMMIT;