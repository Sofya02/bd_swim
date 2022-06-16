USE `sh_st` ;
 
UPDATE goods  SET brand = 'Puma' WHERE id_goods =11;
UPDATE purveyor  SET name_purveyor = 'New Balance' WHERE id_purveyor =6;
UPDATE shoe_store  SET address_shoe_store = 'ул. им. Землячки, 110Б, Волгоград, Волгоградская обл., 400138' WHERE id_shoe_store =3;
UPDATE working_mode  SET end_time = '17:30', days_of_the_week = 'Пятница'  WHERE id_working_mode =5;
UPDATE department  SET name_department = 'Аксессуары' WHERE id_department =4;
DELETE FROM goods WHERE id_goods=12;
DELETE FROM purveyor WHERE id_purveyor>3;
DELETE FROM department_goods WHERE fk_id_goods>5;
DELETE FROM staff WHERE fore_id_department_ =3; 
DELETE FROM shoe_store WHERE id_shoe_store=3;
DELETE FROM purveyor_storage_goods WHERE id_purveyor_storage_goods=11;
SELECT * FROM goods ORDER BY receipt_date;
SELECT * FROM goods ORDER BY price;
SELECT * FROM goods  GROUP BY goods_type ORDER BY price;
SELECT DISTINCT name_goods,receipt_date, price FROM goods ORDER BY name_goods,receipt_date, price;
SELECT DISTINCT full_name,email FROM customer ORDER BY full_name,email;
SELECT DISTINCT post,full_name FROM staff ORDER BY post,full_name;
SELECT DISTINCT name_purveyor,contact_person_purveyor FROM purveyor ORDER BY name_purveyor,contact_person_purveyor;
SELECT DISTINCT count,id_storage_foreing_key FROM purveyor_storage_goods ORDER BY count,id_storage_foreing_key;
SELECT * FROM goods WHERE price BETWEEN 3000 AND 10000;
SELECT * FROM purveyor_storage_goods WHERE data_ BETWEEN '2018-12-12' AND '2020-12-12';
SELECT * FROM working_mode WHERE days_of_the_week BETWEEN 'Вторник' AND 'Пятница';
SELECT * FROM value_characteristics_goods WHERE name_ BETWEEN '39' AND '44';
SELECT * FROM value_goods WHERE id_fk_goods BETWEEN 5 AND 7;
SELECT * FROM goods WHERE name_goods LIKE 'Кр%';
SELECT * FROM purveyor WHERE address_purveyor LIKE 'пр%';
SELECT * FROM purveyor_storage_goods WHERE count LIKE '16%';
SELECT * FROM staff WHERE full_name LIKE 'Ив%';
SELECT * FROM value_characteristics_goods WHERE id_value_characteristics_goods LIKE '1%';
SELECT * FROM customer WHERE phone_number LIKE '894%';
SELECT * FROM goods WHERE brand NOT IN ('Adidas','Kappa');
SELECT * FROM purveyor_storage_goods WHERE data_ NOT IN ('2020-12-12');
SELECT * FROM department WHERE fk_id_shoe_store NOT IN (1);
SELECT * FROM goods WHERE brand IN ('Adidas', 'Nike');
SELECT * FROM purveyor_storage_goods WHERE id_storage_foreing_key IN (1, 3);
SELECT * FROM value_goods WHERE id_fk_goods IN (3, 10);
SELECT name_goods, SUM(price) as sum FROM goods WHERE brand = 'Kappa' GROUP BY name_goods;
SELECT name_goods, MAX(price) as max FROM goods WHERE goods_type = 'Мужская обувь' GROUP BY name_goods;
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
SELECT id_goods, brand FROM goods UNION ALL SELECT id_customer, full_name FROM customer;
SELECT id_department, fk_id_shoe_store FROM department UNION ALL SELECT id_order, id_staff FROM order_;
SELECT id_working_mode,days_of_the_week FROM working_mode UNION ALL SELECT id_staff, full_name  FROM staff;  
SELECT brand, GROUP_CONCAT(name_goods) as what_bran FROM goods GROUP BY brand;
SELECT goods_type, GROUP_CONCAT(name_goods) as what_type FROM goods GROUP BY goods_type;
SELECT GROUP_CONCAT(name_purveyor) as info_purveyor FROM purveyor;
SELECT count, GROUP_CONCAT(data_) as info_purveyor_storage_goods FROM purveyor_storage_goods GROUP BY count;
SELECT fk_id_department, GROUP_CONCAT(count) as info_deprtment_goods FROM department_goods GROUP BY fk_id_department;
WITH cte_goods(name_goods, receipt_date, price) AS (SELECT name_goods, receipt_date, price FROM goods) SELECT * FROM cte_goods;
WITH cte_working_mode(start_time, days_of_the_week, forkey_id_shoe_store) AS (SELECT start_time, days_of_the_week, forkey_id_shoe_store FROM working_mode) SELECT * FROM cte_working_mode;
WITH cte_staff(full_name, wage) AS (SELECT full_name, wage FROM staff) SELECT * FROM cte_staff;

/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы goods и сортирует их (ORDER BY) по полю receipt_date в порядке возрастания, лимит (LIMIT) первые 5 записей.*/
SELECT * FROM goods ORDER BY receipt_date LIMIT 5;
/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы purveyor_storage_goods и сортирует их (ORDER BY) по полю count в порядке возрастания, лимит (LIMIT) 8 записей, начиная с 2.*/
SELECT * FROM purveyor_storage_goods ORDER BY count LIMIT 2,8;
/*Выбирает (SELECT) ВСЕ (*) записи из (FROM) таблицы value_characteristics_goods и сортирует их (ORDER BY) по полю id_value_characteristics_goods в порядке возрастания, лимит (LIMIT) 15 записей, начиная с 5.*/
SELECT * FROM value_characteristics_goods ORDER BY id_value_characteristics_goods LIMIT 5,15;

SELECT id_department, name_department,fk_id_shoe_store FROM department INNER JOIN department_goods ON id_department = fk_id_department;
SELECT id_goods, name_goods,brand FROM goods INNER JOIN value_goods ON id_goods = id_fk_goods;
SELECT id_goods, name_goods,goods_type, brand FROM goods INNER JOIN promotion ON goods_type = goods_category;

SELECT id_promotion, amount_of_discount,goods_category FROM promotion LEFT OUTER JOIN goods_promotion ON id_promotion = id_promotion_fkey;
SELECT id_goods, name_goods, goods_type FROM goods RIGHT OUTER JOIN promotion ON goods_type = goods_category WHERE brand='Nike';
SELECT id_department, name_department, fk_id_shoe_store FROM department FULL INNER JOIN staff ON id_department = fore_id_department_ ;

SELECT id_department, name_department, fk_id_shoe_store FROM department CROSS JOIN staff ON id_department = fore_id_department_ ;



CREATE TABLE charect_goods
(
   name_ VARCHAR(45) NOT NULL 
);

CREATE TABLE some_goods
(
   id_goods INT NOT NULL,
   receipt_date DATE NOT NULL,
   price FLOAT NOT NULL
);


INSERT INTO some_goods (id_goods, receipt_date, price) SELECT id_goods, receipt_date, price FROM goods WHERE brand='Nike';
INSERT INTO charect_goods ( name_) SELECT ( name_) FROM value_characteristics_goods WHERE id_value_characteristics_goods=5;
