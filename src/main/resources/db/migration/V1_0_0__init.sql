-- Adminer 4.7.3 PostgreSQL dump

DROP TABLE IF EXISTS "storage_category";
DROP SEQUENCE IF EXISTS storage_category_id_seq;
CREATE SEQUENCE storage_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_category" (
    "id" integer DEFAULT nextval('storage_category_id_seq') NOT NULL,
    "title" text NOT NULL,
    "description" text,
    CONSTRAINT "storage_category_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_category_title" UNIQUE ("title")
) WITH (oids = false);

INSERT INTO "storage_category" ("id", "title", "description") VALUES
(1,	'ПО',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. '),
(2,	'посуда',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. '),
(4,	'строительные материалы',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. '),
(5,	'бытовая техника',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. '),
(6,	'офисные принадлежности',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. '),
(3,	'авто зап. части',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec convallis interdum euismod. Morbi eget rhoncus eros. Phasellus vel rutrum nisl. Nulla ullamcorper euismod ex porta gravida. Maecenas vulputate justo odio, sed scelerisque nunc volutpat vitae. Suspendisse et quam arcu. In sit amet metus venenatis, aliquam risus non, lacinia odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer eleifend, nibh id rhoncus sodales, odio sem mollis urna, nec posuere nibh felis in magna. Duis id orci at mauris sodales sodales. ');

DROP TABLE IF EXISTS "storage_product";
DROP SEQUENCE IF EXISTS storage_product_id_seq;
CREATE SEQUENCE storage_product_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_product" (
    "id" integer DEFAULT nextval('storage_product_id_seq') NOT NULL,
    "category_id" integer NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "price" numeric NOT NULL,
    "count" integer NOT NULL,
    "image_url" text,
    CONSTRAINT "storage_product_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_product_category_id_fkey" FOREIGN KEY (category_id) REFERENCES storage_category(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "storage_product" ("id", "category_id", "title", "description", "price", "count", "image_url") VALUES
(1,	4,	'технониколь',	'',	1000,	200,	'https://nav.tn.ru/upload/iblock/d01/d015dd0cf4043e310e8a6c445bb19007.png'),
(2,	4,	'эмаль пф 115',	'',	1000,	200,	'https://poli-r.ru/thumbs/product_30.jpg'),
(3,	4,	'фанера 3мм',	'',	300,	20,	'https://0.allegroimg.com/s1440/03a506/a369712f44cd8b84483ef1837b80'),
(4,	4,	'фанера 4мм',	'',	400,	50,	'https://res.cloudinary.com/lmru/image/upload/f_auto,q_auto,w_500,h_500,c_pad,b_white,d_photoiscoming.png/LMCode/11987808.jpg'),
(5,	4,	'фанера 5мм',	'',	500,	50,	'https://st18.stpulscen.ru/images/product/161/718/325_big.jpg'),
(6,	4,	'битум',	'',	500,	50,	'http://www.cdvor.ru/media/catalog/100720.jpg'),
(7,	4,	'герметик',	'',	500,	50,	'https://baucenter.ru/preview/r/612x612/c/612x612/q/95/upload/pictures/51/515001010-0@2x.jpg'),
(9,	4,	'оцинковка лист',	'',	500,	50,	'https://narodmag.ru/uploaded/images/shop/goods/2932-1.jpg'),
(11,	4,	'пвх трубы',	'',	200,	700,	'https://rdstroy.ru/upload/images/151371/big/21.jpg'),
(13,	5,	'холодильник',	'',	10000,	200,	''),
(14,	3,	'коробка передач',	'',	10000,	40,	''),
(15,	6,	'карандаш',	'',	20,	1000,	'https://www.informat.ru/upload/resize_cache/iblock/223/544_544_0/2239d4ddf3be931a2caef042dba53fa3.jpg'),
(16,	2,	'чайник',	'',	4000,	100,	'https://items.s1.citilink.ru/485190_v01_b.jpg'),
(12,	1,	'microsoft office',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tortor velit, elementum at quam vel, dapibus faucibus urna. Nullam id lectus a purus bibendum dignissim ut vitae tellus. Nam eget mi non enim blandit finibus. Donec mattis ut leo sed gravida. Phasellus non ex hendrerit, aliquam lorem vitae, molestie nisi. Donec in euismod velit, vitae vestibulum tortor. Quisque ac condimentum purus. Donec pulvinar tincidunt mauris, ac sagittis libero porta a. Nam varius sit amet urna id vehicula. Nunc quis odio dolor. Curabitur in tempus tortor. Aliquam lectus erat, porta eu dapibus at, mattis non lacus. Donec lectus risus, congue sed leo consequat, accumsan dignissim erat. Sed lacinia, quam non vehicula imperdiet, felis nibh vestibulum turpis, nec finibus velit magna ac erat. ',	3000,	90,	''),
(8,	4,	'лак для дерева',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tortor velit, elementum at quam vel, dapibus faucibus urna. Nullam id lectus a purus bibendum dignissim ut vitae tellus. Nam eget mi non enim blandit finibus. Donec mattis ut leo sed gravida. Phasellus non ex hendrerit, aliquam lorem vitae, molestie nisi. Donec in euismod velit, vitae vestibulum tortor. Quisque ac condimentum purus. Donec pulvinar tincidunt mauris, ac sagittis libero porta a. Nam varius sit amet urna id vehicula. Nunc quis odio dolor. Curabitur in tempus tortor. Aliquam lectus erat, porta eu dapibus at, mattis non lacus. Donec lectus risus, congue sed leo consequat, accumsan dignissim erat. Sed lacinia, quam non vehicula imperdiet, felis nibh vestibulum turpis, nec finibus velit magna ac erat. ',	500,	50,	'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv4kgE_0k4KiJ9VLMXd6vQtLAbT2QW7HDAII9dOUHh2BOYyXufjg'),
(10,	4,	'осп',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tortor velit, elementum at quam vel, dapibus faucibus urna. Nullam id lectus a purus bibendum dignissim ut vitae tellus. Nam eget mi non enim blandit finibus. Donec mattis ut leo sed gravida. Phasellus non ex hendrerit, aliquam lorem vitae, molestie nisi. Donec in euismod velit, vitae vestibulum tortor. Quisque ac condimentum purus. Donec pulvinar tincidunt mauris, ac sagittis libero porta a. Nam varius sit amet urna id vehicula. Nunc quis odio dolor. Curabitur in tempus tortor. Aliquam lectus erat, porta eu dapibus at, mattis non lacus. Donec lectus risus, congue sed leo consequat, accumsan dignissim erat. Sed lacinia, quam non vehicula imperdiet, felis nibh vestibulum turpis, nec finibus velit magna ac erat. ',	2000,	300,	'http://remoo.ru/wp-content/uploads/2016/05/listy-osb-tolshchina-i-razmery-ceny-foto-1.jpg');

DROP TABLE IF EXISTS "user";
CREATE TABLE "public"."user" (
    "username" character varying(50) NOT NULL,
    "password" character varying(100) NOT NULL,
    "enabled" boolean NOT NULL,
    CONSTRAINT "user_username" PRIMARY KEY ("username")
) WITH (oids = false);

INSERT INTO "user" ("username", "password", "enabled") VALUES
('admin',	'$2a$10$LUPeTqc1PVllV/Q5G.OQ3eGP31NRCcVPU2Wg590PU/4PlcFMVm3lm',	't'),
('user',	'$2a$10$wuVFnK5y.RPgpY43Ps8x5.MbMCHIQp1kZgJLMyEF6IXVLNRM4J0cy',	't');

DROP TABLE IF EXISTS "user_role";
DROP SEQUENCE IF EXISTS user_roles_user_role_id_seq;
CREATE SEQUENCE user_roles_user_role_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."user_role" (
    "user_role_id" integer DEFAULT nextval('user_roles_user_role_id_seq') NOT NULL,
    "username" character varying(50) NOT NULL,
    "role" character varying(50) NOT NULL,
    CONSTRAINT "user_roles_user_role_id" PRIMARY KEY ("user_role_id"),
    CONSTRAINT "user_roles_username_fkey" FOREIGN KEY (username) REFERENCES "user"(username) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "user_role" ("user_role_id", "username", "role") VALUES
(1,	'user',	'ROLE_USER'),
(2,	'admin',	'ROLE_ADMIN');

-- 2019-09-28 12:53:43.561402+00
