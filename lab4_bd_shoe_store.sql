USE `sh_st` ;

/*1.	Запросы, которые вы указали в функциональных требованиях (в заголовке указать, что за требование) (10 шт. +)*/
 /*Аналитические запросы:*/
/*1.	 Показать количество возвращенных заказов за последний месяц.*/
SELECT id_order_f_k, return_data FROM goods_return WHERE MONTH(return_data) = MONTH(DATE_ADD(NOW(), INTERVAL 0 MONTH));
/*2.	 Показать общую выручку с заказов за 1 год.*/
SELECT SUM(fk_id_goods_*count*price)-SUM(id_order*price) FROM goods INNER JOIN order_ INNER JOIN goods_order ON id_order=fk_id_order_ AND id_goods = fk_id_goods_ WHERE (YEAR(order_date)-YEAR(CURDATE()<1));
/*3.	 Вычислить самый распространённый товар за полгода.*/
SELECT name_goods, price, count FROM goods INNER JOIN goods_order INNER JOIN order_ ON id_goods = fk_id_goods_ AND id_order = fk_id_order_  WHERE (YEAR(order_date)-YEAR(CURDATE()<0.5));
/*4.	 Показать количество оформленных заказов за 1 день.*/
SELECT order_date,  COUNT(order_date) as order_goods from order_  group by order_date;
/*5.	 Выяснить, какой товар имеет самый наибольший спрос.*/
SELECT name_goods, price, count FROM goods INNER JOIN goods_order ON id_goods = fk_id_goods_  ;

/*Оперативные запросы:*/
/*6.	Показать режим работы магазина*/
SELECT start_time, GROUP_CONCAT(end_time) as time_ FROM working_mode GROUP BY start_time;
/*7.	Показать общий состав работников определенного отдела определенного магазина*/
SELECT full_name, post FROM staff GROUP BY fore_id_department_;
/*8.	Показать бренды продаваемых товаров */
SELECT brand, COUNT(*) as count FROM goods GROUP BY brand;
/*9.	Показать список зарегистрированных пользователей*/
SELECT* FROM customer;
/*10.	Показать товары с наиболее хорошими отзывами по оценке*/
SELECT name_goods, receipt_date, price, grade FROM goods INNER JOIN comment_ ON id_goods = foreign_key_id_goods WHERE grade>3;
/*2.UPDATE в разных таблицах, с WHERE, можно условно, например, изменить заранее созданные некорректные данные (5 шт.)*/ 
UPDATE goods  SET brand = 'Puma' WHERE id_goods =11;
UPDATE purveyor  SET name_purveyor = 'New Balance' WHERE id_purveyor =6;
UPDATE shoe_store  SET address_shoe_store = 'ул. им. Землячки, 110Б, Волгоград, Волгоградская обл., 400138' WHERE id_shoe_store =3;
UPDATE working_mode  SET end_time = '17:30', days_of_the_week = 'Пятница'  WHERE id_working_mode =5;
UPDATE department  SET name_department = 'Аксессуары' WHERE id_department =4;
/*3.DELETE в разных таблицах, с WHERE, можно условно, например, удалить заранее созданные некорректные данные (5 шт.)*/
DELETE FROM goods WHERE id_goods=12;
DELETE FROM purveyor WHERE id_purveyor>3;
DELETE FROM department_goods WHERE fk_id_goods>5;
DELETE FROM staff WHERE fore_id_department_ =3; 
DELETE FROM shoe_store WHERE id_shoe_store=3;
DELETE FROM purveyor_storage_goods WHERE id_purveyor_storage_goods=11;
/*4.SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, различная работа с датами и числами, преобразование данных, IS NULL, AS для таблиц и столбцов и др. в различных вариациях (15 шт. +)*/
SELECT * FROM goods WHERE receipt_date='2021-01-12';
SELECT * FROM staff WHERE fore_id_department_=2;
SELECT DISTINCT name_goods,receipt_date, price FROM goods ORDER BY name_goods,receipt_date, price;
SELECT DISTINCT full_name,email FROM customer ORDER BY full_name,email;
SELECT DISTINCT post,full_name FROM staff GROUP BY fore_id_department_;
SELECT DISTINCT name_purveyor,contact_person_purveyor FROM purveyor ORDER BY name_purveyor,contact_person_purveyor;
SELECT DISTINCT count,id_storage_foreing_key FROM purveyor_storage_goods ORDER BY count,id_storage_foreing_key;
SELECT * FROM goods WHERE brand NOT IN ('Adidas','Kappa');
SELECT * FROM purveyor_storage_goods WHERE data_ NOT IN ('2020-12-12');
SELECT * FROM department WHERE fk_id_shoe_store NOT IN (1);
SELECT * FROM goods WHERE brand IN ('Adidas', 'Nike');
SELECT * FROM purveyor_storage_goods WHERE id_storage_foreing_key IN (1, 3);
SELECT * FROM value_goods WHERE id_fk_goods IN (3, 10);
SELECT * FROM goods WHERE price BETWEEN 3000 AND 10000;
SELECT * FROM purveyor_storage_goods WHERE data_ BETWEEN '2018-12-12' AND '2020-12-12';
SELECT * FROM working_mode WHERE days_of_the_week BETWEEN 'Вторник' AND 'Пятница';
SELECT * FROM value_characteristics_goods WHERE name_ BETWEEN '39' AND '44';
SELECT * FROM value_goods WHERE id_fk_goods BETWEEN 5 AND 7;
/*5 LIKE и другая работа со строками (5-7 шт.+)*/
SELECT * FROM goods WHERE name_goods LIKE 'Кр%';
SELECT * FROM purveyor WHERE address_purveyor LIKE 'пр%';
SELECT * FROM purveyor_storage_goods WHERE count LIKE '16%';
SELECT * FROM staff WHERE full_name LIKE 'Ив%';

SELECT id_goods_characteristics_f_k, id_value_characteristics_goods, name_w, name_ FROM value_characteristics_goods 
INNER JOIN goods_characteristics ON id_goods_characteristics = id_goods_characteristics_f_k 
WHERE name_ LIKE '3%';

SELECT * FROM customer WHERE phone_number LIKE '894%';  
/*6.SELECT INTO или INSERT SELECT, что поддерживается СУБД (2-3 шт.). */
CREATE TABLE new_goods (
  id_goods INT NOT NULL,
  name_goods VARCHAR(45) NOT NULL,
  goods_type VARCHAR(45) NOT NULL,
  brand VARCHAR(45) NOT NULL,
  receipt_date DATE NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (id_goods)
  );
INSERT INTO new_goods SELECT * FROM goods; 
SELECT * FROM new_goods;
CREATE TABLE some_purveyor (
  id_purveyor INT NOT NULL AUTO_INCREMENT,
  name_purveyor VARCHAR(45) NOT NULL,
  address_purveyor VARCHAR(250) NOT NULL,
  contact_person_purveyor BIGINT(11) NOT NULL,
  PRIMARY KEY (id_purveyor)
  );
INSERT INTO some_purveyor SELECT * FROM purveyor WHERE name_purveyor = 'Nike' OR name_purveyor = 'Adidas'; 
SELECT * FROM some_purveyor;
/*7.JOIN: INNER, OUTER (LEFT, RIGHT, FULL), CROSS, NATURAL, разных, в различных вариациях, несколько запросов с более, чем одним JOIN (15 шт.+)*/
SELECT id_department, name_department,fk_id_shoe_store FROM department INNER JOIN department_goods ON id_department = fk_id_department;
SELECT id_goods, name_goods,brand FROM goods INNER JOIN value_goods ON id_goods = id_fk_goods;
SELECT id_goods, name_goods,goods_type, brand FROM goods INNER JOIN promotion ON goods_type = goods_category;
SELECT id_promotion, amount_of_discount,goods_category FROM promotion LEFT OUTER JOIN goods_promotion ON id_promotion = id_promotion_fkey;
SELECT id_goods, name_goods, goods_type FROM goods RIGHT OUTER JOIN promotion ON goods_type = goods_category WHERE brand='Nike';
SELECT id_department, name_department, fk_id_shoe_store FROM department FULL INNER JOIN staff ON id_department = fore_id_department_ ;
SELECT id_department, name_department, fk_id_shoe_store FROM department CROSS JOIN staff ON id_department = fore_id_department_ ;
SELECT id_customer_f_K, order_date, id_staff_f_k FROM order_ CROSS JOIN goods_return ;
SELECT name_goods, price, id_fk_value_characteristicks FROM goods CROSS JOIN value_goods ON id_goods = id_fk_goods;
SELECT name_goods,brand, goods_type FROM goods INNER JOIN goods_promotion ON id_goods = id_goods_fkey INNER JOIN promotion ON id_promotion = id_promotion_fkey GROUP BY goods_category;
SELECT name_goods, receipt_date, price FROM goods NATURAL JOIN comment_ WHERE id_goods=foreign_key_id_goods;
/*8.	GROUP BY (некоторые с HAVING), с LIMIT, ORDER BY (ASC|DESC) вместе с COUNT, MAX, MIN, SUM, AVG в различных вариациях, можно по отдельности (15 шт.+)*/
SELECT name_goods, SUM(price) as sum FROM goods WHERE brand = 'Kappa' GROUP BY name_goods;
SELECT name_goods, MAX(price) as max FROM goods WHERE goods_type = 'Мужская обувь';
SELECT goods_type, MAX(price) as max FROM goods WHERE brand ='Adidas' GROUP BY goods_type  HAVING max>=4500;
SELECT fore_id_department_, SUM(wage) as sum FROM staff WHERE fore_id_department_ =2 GROUP BY fore_id_department_  HAVING sum; 
SELECT id_storage_foreing_key, SUM(count) as sum FROM purveyor_storage_goods GROUP BY id_storage_foreing_key  HAVING sum; 
SELECT goods_type, COUNT(*) AS count FROM goods GROUP BY goods_type;
SELECT receipt_date, COUNT(*) AS count FROM goods GROUP BY goods_type ;
SELECT id_storage_foreing_key, COUNT(*) AS count FROM purveyor_storage_goods GROUP BY id_purveyor_foreing_key ;
SELECT id_storage_foreing_key, COUNT(*) AS count FROM purveyor_storage_goods GROUP BY count;
SELECT goods_type,brand, AVG(price) AS average_revenue_per_sale FROM goods GROUP BY brand;
SELECT id_purveyor_foreing_key, AVG(count) AS average_revenue_per_sale FROM purveyor_storage_goods GROUP BY id_purveyor_foreing_key;
SELECT fore_id_department_, AVG(wage) AS average_revenue_per_sale FROM staff GROUP BY fore_id_department_; 
/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы goods и сортирует их (ORDER BY) по полю receipt_date в порядке возрастания, лимит (LIMIT) первые 5 записей.*/
SELECT * FROM goods ORDER BY receipt_date LIMIT 5;
/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы purveyor_storage_goods и сортирует их (ORDER BY) по полю count в порядке возрастания, лимит (LIMIT) 8 записей, начиная с 2.*/
SELECT * FROM purveyor_storage_goods ORDER BY count LIMIT 2,8;
/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы value_characteristics_goods и сортирует их (ORDER BY) по полю id_value_characteristics_goods в порядке возрастания, лимит (LIMIT) 15 записей, начиная с 5.*/
SELECT * FROM value_characteristics_goods ORDER BY id_value_characteristics_goods LIMIT 5,15;
SELECT * FROM goods  GROUP BY goods_type ORDER BY price;
/*9.UNION, EXCEPT, INTERSECT, что поддерживается СУБД (3-5 шт.)*/
SELECT id_goods, brand FROM goods UNION ALL SELECT id_customer, full_name FROM customer;
SELECT id_department, fk_id_shoe_store FROM department UNION ALL SELECT id_order, id_staff_f_k FROM order_;
SELECT id_working_mode,days_of_the_week FROM working_mode UNION ALL SELECT id_staff, full_name  FROM staff; 
/*10.Вложенные SELECT с GROUP BY, ALL, ANY, EXISTS (3-5 шт.)*/
SELECT name_goods, receipt_date, price FROM(SELECT name_goods, receipt_date, price FROM goods WHERE brand = 'Kappa' ) AS list_;
/*Запрашиваем данные из таблицы goods, но при условии, что в таблицу new_goods есть записи*/
SELECT * FROM goods WHERE EXISTS (SELECT * FROM new_goods);
SELECT id_goods, name_goods, brand, price FROM goods WHERE brand = ALL(SELECT name_purveyor FROM purveyor);
/*11.GROUP_CONCAT и другие разнообразные функции SQL (2-3 шт.)*/
SELECT brand, GROUP_CONCAT(name_goods) as what_bran FROM goods GROUP BY brand;
SELECT goods_type, GROUP_CONCAT(name_goods) as what_type FROM goods GROUP BY goods_type;
SELECT GROUP_CONCAT(name_purveyor) as info_purveyor FROM purveyor;
SELECT count, GROUP_CONCAT(data_) as info_purveyor_storage_goods FROM purveyor_storage_goods GROUP BY count;
SELECT fk_id_department, GROUP_CONCAT(count) as info_deprtment_goods FROM department_goods GROUP BY fk_id_department;
/*12.Запросы с WITH (2-3 шт.)*/
WITH cte_goods(name_goods, receipt_date, price) AS (SELECT name_goods, receipt_date, price FROM goods) SELECT * FROM cte_goods;
WITH cte_working_mode(start_time, days_of_the_week, forkey_id_shoe_store) AS (SELECT start_time, days_of_the_week, forkey_id_shoe_store FROM working_mode) SELECT * FROM cte_working_mode;
WITH cte_staff(full_name, wage) AS (SELECT full_name, wage FROM staff) SELECT * FROM cte_staff;
/*13.Запросы со строковыми функциями СУБД, с функциями работы с датами временем (форматированием дат), с арифметическими функциями (5-7 шт.)*/
SELECT CONCAT(name_goods,': ', brand) AS INFO_GOODS FROM goods;
SELECT CONCAT(start_time,'-',end_time) AS working_time from working_mode;
SELECT UPPER(post) FROM staff;
SELECT *, DATE_FORMAT(receipt_date, '%d.%m.%Y') as new_receipt_date FROM goods;
SELECT name_goods, receipt_date, MONTHNAME(receipt_date) FROM goods;
/*14.Сложные запросы, входящие в большинство групп выше, т.е. SELECT ... JOIN ... JOIN ... WHERE ... GROUP BY ... ORDER BY ... LIMIT ...; (5-7 шт. +)*/
SELECT name_goods, receipt_date, price, grade FROM goods 
INNER JOIN comment_ ON id_goods=foreign_key_id_goods WHERE grade=5;

SELECT full_name, name_goods, receipt_date, price FROM customer 
INNER JOIN order_ ON id_customer = id_customer_f_K 
INNER JOIN goods_order ON id_order = fk_id_order_
INNER JOIN goods ON id_goods = fk_id_goods_
WHERE count >1;
;

/*Для заданного покупателя по имени за промежуток дат вывести все товары, которые он купил и в каком количестве и если есть возврат отобразить*/ 
 SELECT id_customer_f_K, name_goods, count, id_order_f_k AS return_id FROM order_
 INNER JOIN goods_order ON id_order = fk_id_order_
 INNER JOIN goods ON id_goods = fk_id_goods_
 INNER JOIN goods_return ON fk_id_order_ = id_order_f_k WHERE order_date IN('2022-02-01', '2022-03-20')
GROUP BY id_customer_f_K ;

/*Вывести топ три товара по средней оценке комментариев*/
SELECT name_goods, grade FROM goods
INNER JOIN comment_ ON id_goods = foreign_key_id_goods  
WHERE grade=(SELECT AVG(grade) FROM goods) 
ORDER BY grade  
DESC LIMIT 3  ;

/*Вывести сумму сколько заданный поставщик отгразул товаров на склады заданного магазина*/
SELECT id_purveyor_foreing_key, SUM(count) AS sum, id_storage_foreing_key FROM purveyor_storage_goods 
GROUP BY id_purveyor_foreing_key, id_storage_foreing_key; 






















