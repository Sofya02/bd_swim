USE `sh_st` ;
/*Триггер вызывается после удаления информации о товаре, обновление id триггера, он становится на 1 меньше от их общего количества*/
CREATE TRIGGER after_delete
AFTER DELETE
ON goods FOR EACH ROW
UPDATE id_goods 
SET id_goods = SUM(id_goods) - id_goods;

SHOW TRIGGERS;