CREATE TABLE category (
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 

);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);


CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);	

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);
-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id IDENTITY,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);


-- adding three categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Painting', 'This is a imaginable paint towards beauty!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Clay products', 'This products with clay designs!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Paper products', 'This is paper cutting of creat!', 'CAT_3.png', true);
-- adding three users 
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Priya', 'dharshini', 'ADMIN', true, '$2a$04$PQYoUIuMLcaVoDaEQ0IAx.NzG1kMGmmwlVsuv1t8Suixgmt0Bty4u', 'pk@gmail.com', '123456789');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Nikitha', 'Aro', 'SUPPLIER', true, '$2a$04$xehQm.YmUyKBnuA9iejEveIacAKwvRdcjAbqLHaHLDbvBmZQAs2/S', 'Na@gmail.com', '789456123');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('sangee', 'priya', 'SUPPLIER', true, '$2a$04$SYEZqnnQyp2yiSEg5bxBwelO4ktrgH184tgTpiqf0GY5Qnc2LCYPu', 'sp@gmail.com', '945612387');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Keerthi', 'vasan', 'USER', true, '$2a$04$n2hOFVT9rZCZKbb/Ncm74.h07pJb3kcSTNVf/nwFHjS/s8Tigkwxy', 'kv@gmail.com', '9874563210');

-- adding five products
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('dtrt', 'krishnan radhai', 'oil paint', 'This is one of the best oil and chalk paint available right now!, 590, 3, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('fdrf', 'clay products', 'mud pots', 'A small desiging made of mud!', 1500, 2, true, 8, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('sgg', 'Paper crafts', 'paper art', 'This is one of the best creative made of papers available right now!',200, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('tf', ' lightings', 'night lights', 'This is one of the brightening night lights craft available  right now!', 2500, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('mg', 'art things', 'craft materials', 'This things useful to make craft works with creative idea!', customized, 100, true, 1, 3, 0, 0 );
-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (10, '332 Galaxy appartments, 16th street', 'Near skypark hotel, anna nagar', 'chennai', 'Tamil nadu', 'India', '600040', true, false );
-- adding a cart for testing 
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);

