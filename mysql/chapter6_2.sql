-- 述語
-- LIKE述語 文字列の部分一致検索を行う
-- 前方一致、中間一致、後方一致検索がある。

-- 前方一致検索を行う
-- % は「0文字以上の任意の文字列」を表す記号
SELECT * FROM SampleLike WHERE strcol LIKE 'ddd%';

-- 中間一致
SELECT * FROM SampleLike WHERE strcol LIKE '%ddd%';

-- 後方一致
SELECT * FROM SampleLike WHERE strcol LIKE '%ddd';

-- _記号　任意の一文字
SELECT * FROM SampleLike WHERE strcol LIKE 'abc__';

-- BETWEEN述語 範囲検索 
SELECT shohin_mei, hanbai_tanka 
FROM Shohin
WHERE hanbai_tanka BETWEEN 100 AND 1000; -- 100~1000円 両端を含む

SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > 100 AND hanbai_tanka < 1000;

-- IS NULL IS NOT NULL 述語
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NULL;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NOT NULL;

-- IN述語
-- SELECT shohin_mei, shiire_tanka
-- FROM Shohin
-- WHERE shiire_tanka = 320 OR shiire_tanka = 500 OR shiire_tanka = 5000;

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IN(320, 500, 5000); -- ORをIN述語で置き換える

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (320, 500, 5000);

-- IN述語でサブクエリを使う
SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE shohin_id IN ( -- IN ('0003', '0004', '0006', '0007') と同じ
  SELECT shohin_id
  FROM TenpoShohin
  WHERE tenpo_id = '000C'
);

-- EXISTS述語 ある条件に合致するレコードの存在有無を調べる
-- EXISTSの引数は常に相関サブクエリを指定する
SELECT shohin_mei, hanbai_tanka
FROM Shohin AS S
WHERE EXISTS (
  SELECT * -- レコードの存在有無しか見ないので、ここはなんでもおk。慣習でSELECT *
  FROM TenpoShohin AS TS
  WHERE TS.tenpo_id = '000C' AND TS.shohin_id = S.shohin_id
);

SELECT shohin_mei, hanbai_tanka
FROM Shohin AS S
WHERE NOT EXISTS (
  SELECT *
  FROM TenpoShohin AS TS
  WHERE TS.tenpo_id = '000A' AND TS.shohin_id = S.shohin_id
);