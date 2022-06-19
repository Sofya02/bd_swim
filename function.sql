USE `sh_st` ;

/*ФУНКЦИИ*/
/*Функция выводит название товара и дату его поставки, а такжк информацию о скидках*/
SELECT name_goods, receipt_date, 
CASE
    WHEN brand = 'Adidas'
        THEN 'Скидка с 15 июля 15 %'
    WHEN brand = 'Nike'
        THEN 'Скидка с 20 июля 10 %'
    ELSE 'Cкидок не ожидается'
END AS discount
FROM goods;

/*Функция показывает информацию о том, нужно ли закупать товар или нет*/
SELECT name_goods, count, data_, id_goods_foreing_key,
    IF(count > 50, 'Закуп не требуется', 'Требуется закупить новый товар')
FROM purveyor_storage_goods 
INNER JOIN goods ON id_goods = id_goods_foreing_key GROUP BY name_goods;

/*Функция выводит информацию о комментарии конкретного пользователя*/
SELECT full_name, name_goods, grade,
        IFNULL(text_, 'не определено') AS comments
FROM comment_ INNER JOIN customer ON id_customer = foreign_key_id_customer
INNER JOIN goods ON id_goods = foreign_key_id_goods GROUP BY id_customer;


/*ПРОЦЕДУРЫ*/
/*Процедура показывает товары, принадлежащие конкретному бренду*/
DELIMITER $$
CREATE PROCEDURE InfoGoods()
BEGIN
	SELECT GROUP_CONCAT(name_goods), brand
	FROM goods
	GROUP BY brand;    
END$$
DELIMITER ;
CALL InfoGoods();
/*Процедура выводит информацию о том, сколько конкретный поставщик отгрузил своего товара в определенный склад*/
DELIMITER $$
CREATE PROCEDURE sum_goods_to_storage()
BEGIN
SELECT id_purveyor_foreing_key, SUM(count) AS sum, id_storage_foreing_key FROM purveyor_storage_goods 
GROUP BY id_purveyor_foreing_key, id_storage_foreing_key; 
END$$
DELIMITER ;
CALL sum_goods_to_storage();
/*Процедура выводит информацию, о возвращенном товаре бренда Nike*/
DELIMITER $$
CREATE PROCEDURE goods_pr()
BEGIN
SELECT name_goods, goods_type, receipt_date, return_data FROM goods 
INNER JOIN goods_order ON id_goods = fk_id_goods_ 
INNER JOIN goods_return ON fk_id_order_ = id_order_f_k 
WHERE brand='Nike';
END$$
DELIMITER ;
CALL goods_pr();



