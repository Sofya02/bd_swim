USE `sh_st` ;

/*Показывает названия магазинов их режим работы, отделы, сотрудников и их имена*/
CREATE VIEW view_goods AS
  SELECT name_shoe_store,start_time, end_time, days_of_the_week,name_department,full_name,post  FROM shoe_store
  INNER JOIN working_mode ON id_shoe_store = forkey_id_shoe_store
  INNER JOIN department ON id_shoe_store = fk_id_shoe_store
  INNER JOIN staff ON id_department = fore_id_department_;
SELECT *FROM view_goods;

/*Показывает товары, на которые действует скидка*/
CREATE VIEW promotion_goods_ AS
  SELECT name_goods, amount_of_discount, goods_category FROM goods
  INNER JOIN promotion ON goods_type = goods_category
  INNER JOIN goods_promotion ON id_goods = id_goods_fkey;
SELECT *FROM promotion_goods_;

/*Показывает информацию о товаре и его покупателе*/
CREATE VIEW order_goods_ AS
SELECT name_goods, goods_type, receipt_date, price, count,full_name, delivery_address FROM goods 
INNER JOIN goods_order ON id_goods = fk_id_goods_
INNER JOIN order_ ON  id_order = fk_id_order_
INNER JOIN customer ON id_customer = id_customer_f_K;
SELECT *FROM order_goods_;




