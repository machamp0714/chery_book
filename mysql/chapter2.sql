-- <>演算子 〜ではないという否定の条件を指定する
select shohin_mei, hanbai_tanka from Shohin where hanbai_tanka <> 500;

-- WHERE句の条件式にも計算式を書ける
select shohin_mei, hanbai_tanka from Shohin where hanbai_tanka - shiire_tanka >= 500;

-- NULLに比較演算子は使えない
select shohin_mei, shiire_tanka from Shohin where shiire_tanka = 2800;

select shohin_mei, shiire_tanka from Shohin where shiire_tanka <> 2800;

-- NULLかどうか判別するIS NULL/ IS NOT NULL
select shohin_mei, shiire_tanka from Shohin where shiire_tanka is null;

-- NOT演算子
select shohin_mei, shohin_bunrui from Shohin where not hanbai_tanka >= 1000;

-- AND演算子とOR演算子
SELECT shohin_mei, shiire_tanka FROM Shohin WHERE shohin_bunrui = 'キッチン用品' AND hanbai_tanka >= 3000;
SELECT shohin_mei, hanbai_tanka FROM Shohin WHERE shohin_bunrui = 'キッチン用品' OR hanbai_tanka >= 3000;

-- ()をつけると強くなる
/*
AND演算子はOR演算子よりも優先される。
以下の条件式は、
shohin_bunrui = '事務用品' かつ torokubi = '2009-09-11'
または
torokubi = '2009-09-20'
という意味になる。
*/
SELECT shohin_mei, shohin_bunrui, torokubi FROM Shohin WHERE shohin_bunrui = '事務用品' AND torokubi = '2009-09-11' OR torokubi = '2009-09-20';

SELECT shohin_mei, shohin_bunrui, torokubi
FROM Shohin
WHERE shohin_bunrui = '事務用品' AND (torokubi = '2009-09-11' OR torokubi = '2009-09-20');

-- 練習問題
SELECT shohin_mei, torokubi FROM Shohin WHERE torokubi >= '2009-04-28';

SELECT shohin_mei, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka AS rieki FROM Shohin WHERE (shohin_bunrui = '事務用品' OR shohin_bunrui = 'キッチン用品') AND hanbai_tanka * 0.9 - shiire_tanka > 100;