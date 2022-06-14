CREATE DATABASE sh_st;
USE `sh_st` ;

CREATE TABLE goods (
  id_goods INT NOT NULL AUTO_INCREMENT,
  name_goods VARCHAR(45) NOT NULL,
  goods_type VARCHAR(45) NOT NULL,
  brand VARCHAR(45) NOT NULL,
  receipt_date DATE NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (id_goods)
  );

INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Бейсболка Embroidered', 'Аксессуары', 'Addidas', '2022-01-12', 1399);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Nike Court Vision Alta', 'Женская обувь', 'Nike', '2022-02-09', 8499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Japan S PF', 'Женская обувь', 'Asics', '2021-12-12', 9190);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Levitate StealthFlt 5', 'Мужская обувь', 'Brooks', '2022-03-10', 14349);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Кроссовки женские Puma Flyer Flex', 'Женская обувь', 'Puma', '2021-11-13', 6499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Кроссовки женские Demix Nova MID WTR W', 'Женская обувь', 'Demix', '2022-04-19', 8499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Женские носки Nike Everyday Lightweight', 'Аксессуары', 'Nike', '2021-01-12', 1299);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Кеды мужские Termit Invader 2.0 Low M', 'Мужская обувь', 'Termit', '2022-03-23', 6499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Кеды мужские Adidas Hoops 3.0 Mid', 'Мужская обувь', 'Adidas', '2022-05-02', 8399);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Солнцезащитные очки', 'Аксессуары', 'Kappa', '2022-04-06', 2499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Солнцезащитные очки', 'Аксессуары', 'Kappa', '2022-01-06', 2499);
INSERT INTO goods(name_goods, goods_type, brand, receipt_date, price) VALUES ('Кроссовки женские Puma Flyer Flex', 'ул. Рабоче-Крестьянская', 'Kappa', '2022-01-06', 0000);

/*Обновить значение переменоой brand*/
UPDATE goods  SET brand = 'Addidas' WHERE id_goods =11;
DELETE FROM goods WHERE id_goods=12;

SELECT * FROM goods;

/*Сортировка по дате покупке(от старых к новым)*/
SELECT * FROM goods ORDER BY receipt_date;
/*Сортировка по цене(от меньшего к большему)*/
SELECT * FROM goods ORDER BY price;


CREATE TABLE purveyor (
  id_purveyor INT NOT NULL AUTO_INCREMENT,
  name_purveyor VARCHAR(45) NOT NULL,
  address_purveyor VARCHAR(250) NOT NULL,
  contact_person_purveyor BIGINT(11) NOT NULL,
  PRIMARY KEY (id_purveyor)
  );
  
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('Adidas', 'ул. им. Землячки, 110Б, Волгоград, Волгоградская обл., 400117', 89614223654);
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('Nike', 'ул. Таращанцев, 3, Волгоград, Волгоградская обл., 400007', 89432223654);
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('Demix', 'ул. Вавилова, 3, Москва, 119334', 89614223604);
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('Termit', 'пер. Первомайский, 136, Кущевская, Краснодарский край, 352030', 89614209854);
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('Puma', 'просп. Университетский, 107, Волгоград, Волгоградская обл., 400062', 89614765454);
INSERT INTO purveyor(name_purveyor, address_purveyor, contact_person_purveyor) VALUES ('New Balence', 'ул. 8-й Воздушной Армии, 28А, Волгоград, Волгоградская обл., 400137', 89614765454);

/*Обновить значение переменной(исправление опечатки)*/
UPDATE purveyor  SET name_purveyor = 'New Balance' WHERE id_purveyor =6;

SELECT * FROM purveyor;

CREATE TABLE shoe_store (
  id_shoe_store INT NOT NULL AUTO_INCREMENT,
  name_shoe_store VARCHAR(45) NOT NULL,
  address_shoe_store VARCHAR(250) NOT NULL,
  PRIMARY KEY (id_shoe_store)
  );
  
INSERT INTO shoe_store(name_shoe_store, address_shoe_store) VALUES ('@power', 'ул.Свиридова 11, 85, Волгоград, Волгоградская обл., 400238');
INSERT INTO shoe_store(name_shoe_store, address_shoe_store) VALUES ('Skill', 'ул.Камышинская 29, 34, Волгоград, Волгоградская обл., 400338');
INSERT INTO shoe_store(name_shoe_store, address_shoe_store) VALUES ('GoldCross', 'ул.Камышинская 29, 34, Волгоград, Волгоградская обл., 400338');

/*Обновить значение переменной(исправление опечатки)*/
UPDATE shoe_store  SET address_shoe_store = 'ул. им. Землячки, 110Б, Волгоград, Волгоградская обл., 400138' WHERE id_shoe_store =3;

SELECT * FROM shoe_store;


CREATE TABLE storage_ (
  id_storage INT NOT NULL AUTO_INCREMENT,
  capacity INT NOT NULL,
  id_shoe_store INT NOT NULL,
  PRIMARY KEY (id_storage),
  CONSTRAINT FOREIGN KEY (id_shoe_store)
    REFERENCES shoe_store (id_shoe_store)
    );
    
INSERT INTO storage_(capacity, id_shoe_store) VALUES (100, 1);
INSERT INTO storage_(capacity, id_shoe_store) VALUES (250, 2);

SELECT * FROM storage_;

CREATE TABLE purveyor_storage_goods (
  id_purveyor_storage_goods INT NOT NULL AUTO_INCREMENT,
  count INT NOT NULL,
  data_ DATE NOT NULL,
  id_purveyor_foreing_key INT NOT NULL,
  id_storage_foreing_key INT NOT NULL,
  id_goods_foreing_key INT NOT NULL,
  PRIMARY KEY (`id_purveyor_storage_goods`),
  CONSTRAINT `id_purveyor_foreing_key`
    FOREIGN KEY (`id_purveyor_foreing_key`)
    REFERENCES purveyor(`id_purveyor`),
  CONSTRAINT `id_storage_foreing_key`
    FOREIGN KEY (`id_storage_foreing_key`)
    REFERENCES storage_(`id_storage`),
  CONSTRAINT `id_goods_foreing_key`
    FOREIGN KEY (`id_goods_foreing_key`)
    REFERENCES goods(`id_goods`)
    );
    
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (100, '2020-12-12', 1, 1, 1);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (160, '2020-12-12', 2, 1, 2);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (31, '2020-12-12', 2, 2, 3);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (165, '2020-12-12', 3, 2, 4);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (100, '2020-12-12', 1, 1, 5);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (160, '2020-12-12', 2, 1, 6);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (31, '2020-12-12', 2, 2, 7);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (165, '2020-12-12', 3, 2, 8);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (31, '2020-12-12', 2, 2, 9);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (165, '2020-12-12', 3, 2, 10);
INSERT INTO purveyor_storage_goods(count, data_, id_purveyor_foreing_key, id_storage_foreing_key, id_goods_foreing_key) VALUES (65, '2222-12-12', 1, 2, 10);

DELETE FROM purveyor_storage_goods WHERE id_purveyor_storage_goods=11;

SELECT * FROM purveyor_storage_goods;

CREATE TABLE department(
  id_department INT NOT NULL AUTO_INCREMENT,
  name_department VARCHAR(45) NOT NULL,
  fk_id_shoe_store INT NOT NULL,
  PRIMARY KEY (id_department),
  CONSTRAINT fk_id_shoe_store
    FOREIGN KEY (fk_id_shoe_store)
    REFERENCES shoe_store(id_shoe_store)
    );
    
INSERT INTO department(name_department, fk_id_shoe_store) VALUES ('Головные уборы', 1);
INSERT INTO department(name_department, fk_id_shoe_store) VALUES ('Женская обувь', 2);
INSERT INTO department(name_department, fk_id_shoe_store) VALUES ('Мужская обувь', 2);
INSERT INTO department(name_department, fk_id_shoe_store) VALUES (' ', 3);

/*Обновить значение переменной(исправление опечатки)*/
UPDATE department  SET name_department = 'Аксессуары' WHERE id_department =4;

SELECT * FROM department;


CREATE TABLE department_goods (
  count INT NOT NULL,
  fk_id_department INT NOT NULL,
  fk_id_goods INT NOT NULL,
  PRIMARY KEY (fk_id_department, fk_id_goods),
  CONSTRAINT fk_id_department
    FOREIGN KEY (fk_id_department)
    REFERENCES department(id_department),
  CONSTRAINT fk_id_goods
    FOREIGN KEY (fk_id_goods)
    REFERENCES goods(id_goods)
    );
    
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (1, 1, 1);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (2, 2, 2);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (5, 3, 4);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (1, 2, 3);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (20, 1, 10);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (13, 2, 5);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (3, 2, 6);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (11, 3, 8);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (2, 1, 7);
INSERT INTO department_goods(count, fk_id_department,fk_id_goods) VALUES (7, 3, 9);

SELECT * FROM department_goods;

CREATE TABLE working_mode (
  id_working_mode INT NOT NULL AUTO_INCREMENT,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  days_of_the_week VARCHAR(45) NOT NULL,
  forkey_id_shoe_store INT NOT NULL,
  PRIMARY KEY (id_working_mode),
  CONSTRAINT forkeyid_shoe_store
    FOREIGN KEY (forkey_id_shoe_store)
    REFERENCES shoe_store(id_shoe_store)
    );
    
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('10:00', '20:30', 'Понедельник', 1);
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('10:00', '20:30', 'Среда ', 1);
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('10:00', '20:30', 'Пятница', 1);
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('8:00', '18:00', 'Вторник', 2);
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('8:00', '18:00', 'Четверг', 2);
INSERT INTO working_mode(start_time, end_time, days_of_the_week, forkey_id_shoe_store) VALUES ('8:00', '18:00', 'Суббота', 2);

/*Обновить значение переменных(изменение времени окончания работы магазина и дня недели, в который он открыт)*/
UPDATE working_mode  SET end_time = '17:30', days_of_the_week = 'Пятница'  WHERE id_working_mode =5;

SELECT * FROM working_mode;

/*
CREATE TABLE staff(
  id_staff INT NOT NULL AUTO_INCREMENT,
  post VARCHAR(100) NOT NULL,
  standing VARCHAR(100) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  wage FLOAT NOT NULL,
  fore_id_department_ INT NOT NULL,
  PRIMARY KEY (id_staff),
  CONSTRAINT fore_id_department_
    FOREIGN KEY (fore_id_department_)
    REFERENCES department(id_department)
    );
    
INSERT INTO staff(post, standing, full_name, wage, fore_id_department_) VALUES ('продавец-консультант','1,5 года',  'Петрова Дарья Васильевна', 25000, 1);
INSERT INTO staff(post, standing,full_name,wage, fore_id_department_) VALUES ( 'продавец','3  года', 'Иванов Иван Иванович', 50000, 2);
    
SELECT * FROM staff;    
    
CREATE TABLE customer (
  id_customer INT NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(45) NOT NULL,
  residential_address VARCHAR(250) NOT NULL,
  phone_number  BIGINT(11) NOT NULL,
  email VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_customer)
  );
  
INSERT INTO customer(full_name, residential_address, phone_number, email) VALUES ('Уваров Константин Дмитриевич', '161288, г.Волгоград,ул.Гвардейская 45,10в', 894567863245, 'uvar1984@mail.ru');
INSERT INTO customer(full_name, residential_address, phone_number, email) VALUES ('Макарова Светлана Игоревна', '678321, г.Волгоград, ул.Титова 96,53г', 89037398431, 'sveta_mak@gmail.com');
INSERT INTO customer(full_name, residential_address, phone_number, email) VALUES ('Иванов Иван Иванович', '563221, г.Волгоград, ул. Ломоносова 14,38а', 89456849120, 'ivanka_vol@yandex.ru');

SELECT * FROM customer;

CREATE TABLE order_ (
  id_order INT NOT NULL AUTO_INCREMENT,
  delivery_address VARCHAR(45) NOT NULL,
  order_date DATE NOT NULL,
  id_customer INT NOT NULL,
  id_staff INT NOT NULL,
  PRIMARY KEY (id_order),
  CONSTRAINT id_customer
    FOREIGN KEY (id_customer)
    REFERENCES customer(id_customer),
  CONSTRAINT id_staff
    FOREIGN KEY (id_staff)
    REFERENCES staff(id_staff)
    );

INSERT INTO order_(delivery_address, order_date, id_customer, id_staff) VALUES ('г.Волгоград, ул.Титова 96,53г', '2022-02-01', 1, 1);
INSERT INTO order_(delivery_address, order_date, id_customer, id_staff) VALUES ('г.Волгоград, ул Калинина 21', '2022-03-16', 2, 2);
INSERT INTO order_(delivery_address, order_date, id_customer, id_staff) VALUES ('г.Волгоград, ул.ЛОмоносова 14,38а', '2022-03-20', 3, 2);

SELECT * FROM order_;

CREATE TABLE goods_order (
  fk_id_goods_ INT NOT NULL,
  fk_id_order_ INT NOT NULL,
  count INT NOT NULL,
  PRIMARY KEY (fk_id_goods_, fk_id_order_),
  CONSTRAINT foreign_id_goods_
    FOREIGN KEY (fk_id_goods_)
    REFERENCES goods(id_goods),
  CONSTRAINT foreign_id_order_
    FOREIGN KEY (fk_id_order_)
    REFERENCES order_(id_order)
    );
    
INSERT INTO goods_order(fk_id_goods_, fk_id_order_, count) VALUES (1, 1, 1);
INSERT INTO goods_order(fk_id_goods_, fk_id_order_, count) VALUES (2, 2, 1);
INSERT INTO goods_order(fk_id_goods_, fk_id_order_, count) VALUES (3, 3, 1);

SELECT * FROM goods_order;

CREATE TABLE goods_return (
  return_data DATE NOT NULL,
  cause VARCHAR(45) NOT NULL,
  id_order INT NOT NULL,
  PRIMARY KEY (id_order),
  CONSTRAINT id_ordeer
    FOREIGN KEY (id_order)
    REFERENCES order_(id_order)
    );

INSERT INTO goods_return(return_data, cause, id_order) VALUES ('2022-03-10', 'разошлись швы', 1);
INSERT INTO goods_return(return_data, cause, id_order) VALUES ('2022-03-09', 'неправильный товар', 2);

SELECT * FROM goods_return;

CREATE TABLE comment_(
  id_comment INT NOT NULL AUTO_INCREMENT,
  grade INT NOT NULL,
  text_ VARCHAR(45) NOT NULL,
  foreign_key_id_customer INT NOT NULL,
  foreign_key_id_goods INT NOT NULL,
  PRIMARY KEY (id_comment),
  CONSTRAINT foreign_key_id_customer
    FOREIGN KEY (foreign_key_id_customer)
    REFERENCES customer(id_customer),
  CONSTRAINT foreign_key_id_goods
    FOREIGN KEY (foreign_key_id_goods)
    REFERENCES goods(id_goods)
    );
    
INSERT INTO comment_(grade, text_, foreign_key_id_customer, foreign_key_id_goods) VALUES (5, 'отличный качество', 1, 1);
INSERT INTO comment_(grade, text_, foreign_key_id_customer, foreign_key_id_goods) VALUES (5, 'поставлю 5 баллов', 3, 3);

SELECT * FROM comment_;

CREATE TABLE goods_characteristics (
  id_goods_characteristics INT NOT NULL AUTO_INCREMENT,
  name_ VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_goods_characteristics)
  );

INSERT INTO goods_characteristics(id_goods_characteristics, name_) VALUES (1, 'цвет');
INSERT INTO goods_characteristics(id_goods_characteristics, name_) VALUES (2, 'размер');

SELECT * FROM goods_characteristics;

CREATE TABLE value_characteristics_goods (
  id_value_characteristics_goods INT NOT NULL AUTO_INCREMENT,
  name_ VARCHAR(45) NOT NULL,
  id_goods_characteristics INT NOT NULL,
  PRIMARY KEY (id_value_characteristics_goods),
  CONSTRAINT id_goods_characteristics
    FOREIGN KEY (id_goods_characteristics)
    REFERENCES goods_characteristics(id_goods_characteristics)
    );
    
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (1, 'синий', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (2, 'белый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (3, 'серый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (4, 'розовый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (5, 'черный', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (6, 'желтый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (7, 'фиолетовый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (8, 'зеленый', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (9,'красный', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (10, 'синий', 1);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (11, '53', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (12, '39', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (13, '37', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (14, '42', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (15, '39', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (16, '44', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (17, '39', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (18, '43', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (19, '44', 2);
INSERT INTO value_characteristics_goods(id_value_characteristics_goods, name_, id_goods_characteristics) VALUES (20, 'no', 2);

SELECT * FROM value_characteristics_goods;

CREATE TABLE value_goods (
  id_fk_goods INT NOT NULL,
  id_fk_value_characteristicks INT NOT NULL,
  PRIMARY KEY (id_fk_goods, id_fk_value_characteristicks),
  CONSTRAINT id_fk_goods
    FOREIGN KEY (id_fk_goods)
    REFERENCES goods(id_goods),
  CONSTRAINT id_fk_value_characteristicks
    FOREIGN KEY (id_fk_value_characteristicks)
    REFERENCES value_characteristics_goods(id_value_characteristics_goods)
    );

INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (1, 1);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (2, 2);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (3, 3);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (4, 4);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (5, 5);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (6, 6);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (7, 7);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (8, 8);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (9, 9);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (10, 10);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (1, 11);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (2, 12);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (3, 13);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (4, 14);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (5, 15);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (6, 16);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (7, 17);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (8, 18);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (9, 19);
INSERT INTO value_goods(id_fk_goods, id_fk_value_characteristicks) VALUES (10, 20);

SELECT * FROM value_goods;

CREATE TABLE promotion (
  id_promotion INT NOT NULL AUTO_INCREMENT,
  amount_of_discount INT NOT NULL,
  goods_category VARCHAR(45) NOT NULL,
  time_of_action DATE NOT NULL,
  PRIMARY KEY (id_promotion)
  );

INSERT INTO promotion(amount_of_discount, goods_category, time_of_action) VALUES (15, 'головные уборы', '2021-11-13');
INSERT INTO promotion(amount_of_discount, goods_category, time_of_action) VALUES (10, 'обувь', '2022-01-15');

SELECT * FROM promotion;

CREATE TABLE goods_promotion(
  id_goods_fkey INT NOT NULL,
  id_promotion_fkey INT NOT NULL,
  PRIMARY KEY (id_goods_fkey, id_promotion_fkey),
  CONSTRAINT id_goods_fkey
    FOREIGN KEY (id_goods_fkey)
    REFERENCES goods(id_goods),
  CONSTRAINT id_promotion_fkey
    FOREIGN KEY (id_promotion_fkey)
    REFERENCES promotion(id_promotion)
    );

INSERT INTO goods_promotion(id_goods_fkey, id_promotion_fkey) VALUES (2, 2);
INSERT INTO goods_promotion(id_goods_fkey, id_promotion_fkey) VALUES (3, 2);
INSERT INTO goods_promotion(id_goods_fkey, id_promotion_fkey) VALUES (4, 2);

SELECT * FROM goods_promotion;



*/






