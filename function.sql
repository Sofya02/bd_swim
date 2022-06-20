USE `sh_st` ;

/*ФУНКЦИИ*/
/*Если текущая дата меньше даты поставки товара, мы возвращаем «Нет», иначе мы возвращаем «Да».*/
DROP FUNCTION IF EXISTS goods_receipt_date;
DELIMITER |
CREATE FUNCTION goods_receipt_date (receipt_date DATE)
  RETURNS VARCHAR(3)
   DETERMINISTIC
    BEGIN
     DECLARE sf_value VARCHAR(3);
        IF curdate() > receipt_date
            THEN SET sf_value = 'Yes';
        ELSEIF  curdate() <= receipt_date
            THEN SET sf_value = 'No';
        END IF;
     RETURN sf_value;
    END|
    DELIMITER ;
SELECT id_goods,name_goods,receipt_date,CURDATE() ,sf_past_movie_return_date(`receipt_date`)FROM goods;
    
/*Функция показывает информацию о том, нужно ли закупать товар или нет*/
DROP FUNCTION IF EXISTS goods_buy;
DELIMITER |
CREATE FUNCTION goods_buy (count INT)
  RETURNS VARCHAR(50)
   DETERMINISTIC
    BEGIN
     DECLARE sf_value VARCHAR(50);
        IF count > 50
            THEN SET sf_value = 'Закуп не требуется';
        ELSEIF  50 <= count
            THEN SET sf_value = 'Требуется закупить новый товар';
        END IF;
     RETURN sf_value;
    END|
    DELIMITER ;
SELECT name_goods, count, data_, id_goods_foreing_key,  goods_buy (count) FROM purveyor_storage_goods 
INNER JOIN goods ON id_goods = id_goods_foreing_key GROUP BY name_goods;

/*Функция выводит информацию о комментарии конкретного пользователя*/
DROP FUNCTION IF EXISTS goods_prom;
DELIMITER |
CREATE FUNCTION goods_prom (text_ VARCHAR(200))
  RETURNS VARCHAR(50)
   DETERMINISTIC
    BEGIN
     DECLARE sf_value VARCHAR(50);
        IF text_ = ''
            THEN SET sf_value = 'не определено';
        ELSEIF  text_!=''
            THEN SET sf_value = text_;
        END IF;
     RETURN sf_value;
    END|
    DELIMITER ;
SELECT full_name, name_goods, grade, goods_prom (text_)
FROM comment_ RIGHT JOIN customer ON id_customer = foreign_key_id_customer
LEFT JOIN goods ON id_goods = foreign_key_id_goods GROUP BY id_customer;


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
DROP PROCEDURE InfoGoods;
/*Процедура выводит информацию о том, сколько конкретный поставщик отгрузил своего товара в определенный склад*/
DELIMITER $$
CREATE PROCEDURE sum_goods_to_storage()
BEGIN
SELECT id_purveyor_foreing_key, SUM(count) AS sum, id_storage_foreing_key FROM purveyor_storage_goods 
GROUP BY id_purveyor_foreing_key, id_storage_foreing_key; 
END$$
DELIMITER ;
CALL sum_goods_to_storage();
DROP PROCEDURE sum_goods_to_storage;
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
DROP PROCEDURE goods_pr;


