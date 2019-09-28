-- Adminer 4.7.3 PostgreSQL dump

DROP TABLE IF EXISTS "storage_category";
DROP SEQUENCE IF EXISTS storage_group_id_seq;
CREATE SEQUENCE storage_category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."storage_category" (
    "id" integer DEFAULT nextval('storage_category_id_seq') NOT NULL,
    "title" text NOT NULL,
    "description" text,
    CONSTRAINT "storage_category_id" PRIMARY KEY ("id"),
    CONSTRAINT "storage_category_title" UNIQUE ("title")
) WITH (oids = false);

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

DROP TABLE IF EXISTS "user";
CREATE TABLE "public"."user" (
    "username" character varying(50) NOT NULL,
    "password" character varying(100) NOT NULL,
    "enabled" boolean NOT NULL,
    CONSTRAINT "user_username" PRIMARY KEY ("username")
) WITH (oids = false);

INSERT INTO "user" ("username", "password", "enabled") VALUES
('admin',   '$2a$10$LUPeTqc1PVllV/Q5G.OQ3eGP31NRCcVPU2Wg590PU/4PlcFMVm3lm', 't'),
('user',    '$2a$10$wuVFnK5y.RPgpY43Ps8x5.MbMCHIQp1kZgJLMyEF6IXVLNRM4J0cy', 't');

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
(1, 'user', 'ROLE_USER'),
(2, 'admin', 'ROLE_ADMIN');

-- 2019-09-26 18:38:14.888289+00
