-- テーブルを集約して検索する
/*
テーブルの列の合計や平均値などの集計操作を行うときは集約関数を使う
集約関数は基本的にNULLを除外して集計する。ただし、COUNT関数のみ、COUNT(*)都することでNULLを含めた全行を数えます
重複値を除外して集計するにはDISTINCTを使う
*/

-- COUNT関数 *を引数に取れるのはCOUNT関数のみ
SELECT COUNT(*) FROM Shohin;

-- NULLを除外して数える
SELECT COUNT(shiire_tanka) FROM Shohin;

-- SUM関数
SELECT SUM(hanbai_tanka) FROM Shohin;
SELECT SUM(shiire_tanka) FROM Shohin;

-- AVG関数
SELECT AVG(hanbai_tanka) AS '平均価格', AVG(shiire_tanka) FROM Shohin;

-- MAX, MIN関数 この関数はほとんど全てのデータ型の列に適用できる
SELECT MAX(hanbai_tanka), MIN(shiire_tanka) FROM Shohin;
SELECT MAX(torokubi) FROM Shohin;

-- 重複値を除外して集約関数を利用する
SELECT COUNT(DISTINCT shohin_bunrui) FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka) FROM Shohin;