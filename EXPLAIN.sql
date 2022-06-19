/*1*/EXPLAIN SELECT name_goods,brand, goods_type FROM goods 
INNER JOIN goods_promotion ON id_goods = id_goods_fkey 
INNER JOIN promotion ON id_promotion = id_promotion_fkey 
GROUP BY goods_category;

CREATE INDEX ind_brand ON goods(brand);
CREATE INDEX ind_goods_category ON promotion(goods_category);

/*2*/
SELECT * FROM purveyor_storage_goods WHERE data_ BETWEEN '2018-12-12' AND '2020-12-12';
CREATE INDEX ind_data ON purveyor_storage_goods(data_);

/*3*/
EXPLAIN SELECT name_goods, MAX(price) as max FROM goods WHERE goods_type = 'Мужская обувь';
CREATE INDEX index_goods_type ON goods(goods_type);

/*5*/
EXPLAIN SELECT name_goods, receipt_date, price, grade FROM goods 
INNER JOIN comment_ ON id_goods=foreign_key_id_goods WHERE grade=5;
CREATE INDEX index_grade_g ON comment_(grade);

/*4*/
SELECT full_name, name_goods, receipt_date, price FROM customer 
INNER JOIN order_ ON id_customer = id_customer_f_K 
INNER JOIN goods_order ON id_order = fk_id_order_
INNER JOIN goods ON id_goods = fk_id_goods_
WHERE count >1;
;
CREATE INDEX index_count_goods ON goods_order(count);

