BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "address" (
    "id" bigserial PRIMARY KEY,
    "province" text NOT NULL,
    "city" text NOT NULL,
    "district" text NOT NULL,
    "street" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "appointment" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "trainerId" bigint NOT NULL,
    "startTime" timestamp without time zone NOT NULL,
    "endTime" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "appointment_index_idx" ON "appointment" USING btree ("trainerId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bargain" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "brand" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "logo" text NOT NULL,
    "description" text NOT NULL,
    "website" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "card" (
    "id" bigserial PRIMARY KEY,
    "tenantId" bigint NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "price" double precision NOT NULL,
    "coverImage" text NOT NULL,
    "duration" bigint NOT NULL,
    "type" text,
    "_storeCardsStoreId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "coupon" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "invoice" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "log" (
    "id" bigserial PRIMARY KEY,
    "tenantId" bigint NOT NULL,
    "operationTime" timestamp without time zone NOT NULL,
    "createrId" bigint NOT NULL,
    "type" text NOT NULL,
    "operatee" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "membership" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "storeId" bigint NOT NULL,
    "active" boolean NOT NULL DEFAULT false
);

-- Indexes
CREATE UNIQUE INDEX "membership_index_idx" ON "membership" USING btree ("storeId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order" (
    "id" bigserial PRIMARY KEY,
    "price" double precision NOT NULL,
    "productId" bigint NOT NULL,
    "createrId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "paymentMethod" text NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "permission" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "product" (
    "id" bigserial PRIMARY KEY,
    "tenantId" bigint NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "offShelf" boolean NOT NULL DEFAULT true,
    "price" double precision NOT NULL,
    "storeId" bigint NOT NULL,
    "applicableToAllStores" boolean NOT NULL DEFAULT false
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "role" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serving" (
    "id" bigserial PRIMARY KEY,
    "trainerId" bigint NOT NULL,
    "storeId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serving_index_idx" ON "serving" USING btree ("trainerId", "storeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "store" (
    "id" bigserial PRIMARY KEY,
    "tenantId" bigint NOT NULL DEFAULT 1,
    "name" text NOT NULL,
    "description" text NOT NULL DEFAULT ''::text,
    "addressId" bigint NOT NULL,
    "longitude" double precision NOT NULL,
    "area" bigint NOT NULL,
    "businessHours" text NOT NULL,
    "latitude" double precision NOT NULL,
    "tags" text NOT NULL,
    "services" text NOT NULL,
    "facilities" text NOT NULL,
    "equipments" text NOT NULL,
    "wifi" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tenant" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "trainer" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "gender" text NOT NULL,
    "age" bigint NOT NULL,
    "headshot" text NOT NULL,
    "photos" text NOT NULL,
    "videos" text NOT NULL,
    "servingCity" text NOT NULL,
    "servingHours" text NOT NULL,
    "classFee" double precision NOT NULL,
    "phone" text NOT NULL,
    "hotness" bigint NOT NULL DEFAULT 0,
    "rating" double precision NOT NULL DEFAULT 0.0
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "userInfoId" bigint NOT NULL,
    "gender" text NOT NULL DEFAULT 'male'::text,
    "birthday" timestamp without time zone,
    "mobile" text,
    "suspended" boolean NOT NULL DEFAULT false,
    "headshot" text,
    "face" text,
    "asTrainerId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "appointment"
    ADD CONSTRAINT "appointment_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "appointment"
    ADD CONSTRAINT "appointment_fk_1"
    FOREIGN KEY("trainerId")
    REFERENCES "trainer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "card"
    ADD CONSTRAINT "card_fk_0"
    FOREIGN KEY("_storeCardsStoreId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "log"
    ADD CONSTRAINT "log_fk_0"
    FOREIGN KEY("createrId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "membership"
    ADD CONSTRAINT "membership_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "membership"
    ADD CONSTRAINT "membership_fk_1"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order"
    ADD CONSTRAINT "order_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "product"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order"
    ADD CONSTRAINT "order_fk_1"
    FOREIGN KEY("createrId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "product"
    ADD CONSTRAINT "product_fk_0"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serving"
    ADD CONSTRAINT "serving_fk_0"
    FOREIGN KEY("trainerId")
    REFERENCES "trainer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serving"
    ADD CONSTRAINT "serving_fk_1"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "store"
    ADD CONSTRAINT "store_fk_0"
    FOREIGN KEY("addressId")
    REFERENCES "address"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_1"
    FOREIGN KEY("asTrainerId")
    REFERENCES "trainer"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;


--
-- MIGRATION VERSION FOR preso
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('preso', '20250422090513772', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250422090513772', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
