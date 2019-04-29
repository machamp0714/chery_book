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

