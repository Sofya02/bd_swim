USE `sh_st` ;

SELECT name_goods, receipt_date, 
CASE
    WHEN brand = 'Adidas'
        THEN 'Скидка с 15 июля 15 %'
    WHEN brand = 'Nike'
        THEN 'Скидка с 20 июля 10 %'
    ELSE 'Cкидок не ожидается'
END AS discount
FROM goods;

SELECT name_goods, count, data_, id_goods_foreing_key,
    IF(count > 50, 'Закуп не требуется', 'Требуется закупить новый товар')
FROM purveyor_storage_goods 
INNER JOIN goods ON id_goods = id_goods_foreing_key GROUP BY name_goods;

SELECT full_name, name_goods, grade,
        IFNULL(text_, 'не определено') AS comments
FROM comment_ INNER JOIN customer ON id_customer = foreign_key_id_customer
INNER JOIN goods ON id_goods = foreign_key_id_goods GROUP BY id_customer;


DELIMITER $$
CREATE PROCEDURE getGoods()
BEGIN
	SELECT 
		GROUP_CONCAT(name_goods), 
		brand,
        price
	FROM
		goods
	GROUP BY brand;    
END$$
DELIMITER ;
CALL getGoods();
DROP  PROCEDURE getGoods();