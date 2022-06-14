USE `sh_st` ;

UPDATE goods  SET brand = 'Addidas' WHERE id_goods =11;
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


SELECT DISTINCT name_goods,receipt_date, price FROM goods ORDER BY name_goods,receipt_date, price;
SELECT DISTINCT full_name,email FROM customer ORDER BY full_name,email;
SELECT DISTINCT post,full_name FROM staff ORDER BY post,full_name;


SELECT * FROM goods WHERE price BETWEEN 3000 AND 10000;
SELECT * FROM purveyor_storage_goods WHERE data_ BETWEEN '2018-12-12' AND '2020-12-12';
SELECT * FROM working_mode WHERE days_of_the_week BETWEEN 'Вторник' AND 'Пятница';
SELECT * FROM value_characteristics_goods WHERE name_ BETWEEN '39' AND '44';


SELECT * FROM goods WHERE name_goods LIKE 'Кр%';
SELECT * FROM purveyor WHERE address_purveyor LIKE 'пр%';
SELECT * FROM purveyor_storage_goods WHERE count LIKE '16%';
SELECT * FROM staff WHERE full_name LIKE 'Ив%';
SELECT * FROM value_characteristics_goods WHERE id_value_characteristics_goods LIKE '1%';

SELECT * FROM goods WHERE brand NOT IN ('Adidas','Kappa');
SELECT * FROM purveyor_storage_goods WHERE data_ NOT IN ('2020-12-12');

