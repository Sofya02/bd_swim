USE `sh_st` ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(full_name,residential_address,phone_number,email);

SELECT * FROM customer; 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/goods.csv'
INTO TABLE goods
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(name_goods,goods_type,brand,receipt_date,price);

SELECT * FROM goods;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shoe_store.csv'
INTO TABLE shoe_store
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(name_shoe_store,address_shoe_store);

SELECT * FROM shoe_store;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/working_mode.csv'
INTO TABLE working_mode
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(start_time,end_time,days_of_the_week,forkey_id_shoe_store);

SELECT * FROM working_mode;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/department.csv'
INTO TABLE department
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(name_department,fk_id_shoe_store);

SELECT * FROM department;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staff.csv'
INTO TABLE staff
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(post,standing,full_name,wage,fore_id_department_);

SELECT * FROM staff;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order.csv'
INTO TABLE order_
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(delivery_address,order_date,id_customer_f_K,id_staff_f_k);

SELECT * FROM order_;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/goods_order.csv'
INTO TABLE goods_order
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(fk_id_goods_,fk_id_order_,count);

SELECT * FROM goods_order;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/goods_return.csv'
INTO TABLE goods_return
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(return_data,cause,id_order_f_k);

SELECT * FROM goods_return; 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purveyor.csv'
INTO TABLE purveyor
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(name_purveyor,address_purveyor,contact_person_purveyor);

SELECT * FROM purveyor;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/storage.csv'
INTO TABLE storage_
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(capacity,id_shoe_store_f_kk);


SELECT * FROM storage_;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purveyor_storage_goods.csv'
INTO TABLE purveyor_storage_goods
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS
(id_purveyor_foreing_key,id_storage_foreing_key,id_goods_foreing_key);

SELECT * FROM purveyor_storage_goods;








