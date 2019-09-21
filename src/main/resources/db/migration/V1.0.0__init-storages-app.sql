-- Adminer 4.7.3 PostgreSQL dump

DROP TABLE IF EXISTS "storage_category";
DROP SEQUENCE IF EXISTS storage_group_id_seq;
CREATE SEQUENCE storage_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_category" (
    "id" integer DEFAULT nextval('storage_group_id_seq') NOT NULL,
    "title" text NOT NULL,
    "description" text,
    CONSTRAINT "storage_category_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_category_title" UNIQUE ("title")
) WITH (oids = false);

INSERT INTO "storage_category" ("id", "title", "description") VALUES
(1,	'ПО',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(2,	'посуда',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(3,	'зап. части',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(4,	'бытовая техника',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(5,	'музыкальные инструменты',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(6,	'строительные материалы',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

DROP TABLE IF EXISTS "storage_product";
DROP SEQUENCE IF EXISTS storage_product_id_seq;
CREATE SEQUENCE storage_product_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_product" (
    "id" integer DEFAULT nextval('storage_product_id_seq') NOT NULL,
    "category_id" integer NOT NULL,
    "title" text NOT NULL,
    "descriptions" text NOT NULL,
    "price" money NOT NULL,
    "count" integer NOT NULL,
    "image_url" text,
    CONSTRAINT "storage_product_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_product_category_id_fkey" FOREIGN KEY (category_id) REFERENCES storage_category(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "storage_product" ("id", "category_id", "title", "descriptions", "price", "count", "image_url") VALUES
(2,	6,	'ацетон',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$200.00',	50,	'https://res.cloudinary.com/lmru/image/upload/f_auto,q_auto,w_500,h_500,c_pad,b_white,d_photoiscoming.png/LMCode/15609409.jpg'),
(3,	6,	'краска пф 115',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$200.00',	10,	'http://build-chemi.ru/articles/fotos/86979966890.jpg'),
(4,	6,	'цемент',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$5,000.00',	200,	'http://rem52.ru/published/publicdata/REM52WEBASYST/attachments/SC/products_pictures/cement_m400_enl.jpg'),
(5,	6,	'технониколь',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$5,000.00',	600,	'https://www.tn.ru/img_out/%D0%BD%D0%B5%D0%B3%D0%BE%D1%80%D1%8E%D1%87%D0%B0%D1%8F%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D1%8F%D0%B1%D0%B5%D0%B7%D0%B3%D0%BE%D1%84%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%D0%BA%D0%BE%D0%BC%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8FPNG(1).png'),
(9,	6,	'фанера 3мм',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$300.00',	30,	'https://0.allegroimg.com/s1440/03a506/a369712f44cd8b84483ef1837b80'),
(1,	6,	'шпаклёвка',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$100.00',	100,	'https://images.obi.ru/product/RU/800x600/365590_1.jpg'),
(6,	6,	'дверная петля',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$200.00',	1000,	'https://zamkitut.ru/upload/iblock/405/405467f0644354409510b7885cab74ed.jpg'),
(7,	6,	'суперклей',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$40.00',	80,	'https://i-fakt.ru/wp-content/uploads/2014/04/superglue.jpg'),
(8,	6,	'двп',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$200.00',	1000,	'https://images.ru.prom.st/466558279_w640_h640_dvp-orgalit-2745h1700h32mm.jpg'),
(10,	6,	'битум',	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',	'$1,000.00',	10,	'http://www.cdvor.ru/media/catalog/100720.jpg');

DROP TABLE IF EXISTS "storage_user";
DROP SEQUENCE IF EXISTS storage_user_id_seq;
CREATE SEQUENCE storage_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_user" (
    "id" integer DEFAULT nextval('storage_user_id_seq') NOT NULL,
    "login" text NOT NULL,
    "role" text NOT NULL,
    "password_hash" text NOT NULL,
    CONSTRAINT "storage_user_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_user_login" UNIQUE ("login")
) WITH (oids = false);

INSERT INTO "storage_user" ("id", "login", "role", "password_hash") VALUES
(1,	'admin',	'admin',	'c4ca4238a0b923820dcc509a6f75849b'),
(2,	'user',	'user',	'c81e728d9d4c2f636f067f89cc14862c');

-- 2019-09-21 09:31:42.762055+00
