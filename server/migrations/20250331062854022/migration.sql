BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "address" (
    "id" bigserial PRIMARY KEY,
    "street" text NOT NULL
);

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
CREATE TABLE "note" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "order" (
    "id" bigserial PRIMARY KEY,
    "no" bigint NOT NULL
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
CREATE TABLE "role" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "store" (
    "id" bigserial PRIMARY KEY,
    "tenantId" bigint NOT NULL,
    "name" text NOT NULL,
    "addressId" bigint NOT NULL,
    "city" text NOT NULL,
    "province" text NOT NULL,
    "longitude" double precision NOT NULL,
    "latitude" double precision NOT NULL,
    "tags" json NOT NULL,
    "equipment" text NOT NULL
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
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "userInfoId" bigint NOT NULL
);

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


--
-- MIGRATION VERSION FOR preso
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('preso', '20250331062854022', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250331062854022', "timestamp" = now();

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
