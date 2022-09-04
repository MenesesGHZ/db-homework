BEGIN;
--
-- Create model Bill
--
CREATE TABLE "bill" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "payment_method" varchar(2) NOT NULL);
--
-- Create model Branch
--
CREATE TABLE "branch" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "address" text NOT NULL, "phone_number" varchar(16) NOT NULL);
--
-- Create model Drug
--
CREATE TABLE "drug" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "category" varchar(15) NOT NULL, "details" text NOT NULL);
--
-- Create model Order
--
CREATE TABLE "order" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "placement_date" datetime NULL, "received_data" datetime NULL, "total" real NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Prescription
--
CREATE TABLE "prescription" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "doctor_id" bigint NOT NULL UNIQUE REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Supplier
--
CREATE TABLE "supplier" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "phone_number" varchar(16) NOT NULL, "address" text NOT NULL, "details" text NOT NULL);
--
-- Create model User
--
CREATE TABLE "user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "firstname" varchar(30) NOT NULL, "lastname" varchar(30) NOT NULL, "email" varchar(40) NOT NULL);
--
-- Create model Product
--
CREATE TABLE "product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "price" real NOT NULL, "branch_id" bigint NOT NULL UNIQUE REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED, "drug_id" bigint NOT NULL UNIQUE REFERENCES "drug" ("id") DEFERRABLE INITIALLY DEFERRED, "supplier_id" bigint NOT NULL UNIQUE REFERENCES "supplier" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model PrescriptionDetail
--
CREATE TABLE "prescription_detail" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "details" text NOT NULL, "drug_id" bigint NOT NULL UNIQUE REFERENCES "drug" ("id") DEFERRABLE INITIALLY DEFERRED, "prescription_id" bigint NOT NULL REFERENCES "prescription" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model OrderDetail
--
CREATE TABLE "order_detail" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer NOT NULL, "order_id" bigint NOT NULL REFERENCES "order" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "product" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Add field supplier to order
--
CREATE TABLE "new__order" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "placement_date" datetime NULL, "received_data" datetime NULL, "total" real NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED, "supplier_id" bigint NOT NULL REFERENCES "supplier" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__order" ("id", "placement_date", "received_data", "total", "branch_id", "supplier_id") SELECT "id", "placement_date", "received_data", "total", "branch_id", NULL FROM "order";
DROP TABLE "order";
ALTER TABLE "new__order" RENAME TO "order";
CREATE INDEX "prescription_detail_prescription_id_7f48262b" ON "prescription_detail" ("prescription_id");
CREATE INDEX "order_detail_order_id_b97dfbdf" ON "order_detail" ("order_id");
CREATE INDEX "order_detail_product_id_009a48e3" ON "order_detail" ("product_id");
CREATE INDEX "order_branch_id_02f9a1a0" ON "order" ("branch_id");
CREATE INDEX "order_supplier_id_8d70efc0" ON "order" ("supplier_id");
--
-- Create model Employee
--
CREATE TABLE "employee" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "phone_number" varchar(16) NOT NULL, "address" text NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL UNIQUE REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model DrugLot
--
CREATE TABLE "drug_lot" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "expiration" datetime NOT NULL, "details" text NOT NULL, "order_id" bigint NOT NULL REFERENCES "order" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Add field drug_lot to drug
--
CREATE TABLE "new__drug" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "category" varchar(15) NOT NULL, "details" text NOT NULL, "drug_lot_id" bigint NOT NULL REFERENCES "drug_lot" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__drug" ("id", "name", "category", "details", "drug_lot_id") SELECT "id", "name", "category", "details", NULL FROM "drug";
DROP TABLE "drug";
ALTER TABLE "new__drug" RENAME TO "drug";
CREATE INDEX "employee_branch_id_fabda6fb" ON "employee" ("branch_id");
CREATE INDEX "drug_lot_order_id_eb163c4a" ON "drug_lot" ("order_id");
CREATE INDEX "drug_drug_lot_id_03d97398" ON "drug" ("drug_lot_id");
--
-- Create model Doctor
--
CREATE TABLE "doctor" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "license_number" varchar(30) NOT NULL, "phone_number" varchar(16) NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Client
--
CREATE TABLE "client" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "phone_number" varchar(14) NOT NULL, "role" varchar(2) NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model BillDetail
--
CREATE TABLE "bill_detail" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer NOT NULL, "total" real NOT NULL, "bill_id" bigint NOT NULL REFERENCES "bill" ("id") DEFERRABLE INITIALLY DEFERRED, "prescription_id" bigint NOT NULL REFERENCES "prescription" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "employee" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Add field branch to bill
--
CREATE TABLE "new__bill" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "payment_method" varchar(2) NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__bill" ("id", "payment_method", "branch_id") SELECT "id", "payment_method", NULL FROM "bill";
DROP TABLE "bill";
ALTER TABLE "new__bill" RENAME TO "bill";
CREATE INDEX "bill_detail_bill_id_07efd366" ON "bill_detail" ("bill_id");
CREATE INDEX "bill_detail_prescription_id_57a54bff" ON "bill_detail" ("prescription_id");
CREATE INDEX "bill_detail_product_id_f553ceaa" ON "bill_detail" ("product_id");
CREATE INDEX "bill_branch_id_c598ebcb" ON "bill" ("branch_id");
--
-- Add field client to bill
--
CREATE TABLE "new__bill" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "payment_method" varchar(2) NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED, "client_id" bigint NOT NULL REFERENCES "client" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__bill" ("id", "payment_method", "branch_id", "client_id") SELECT "id", "payment_method", "branch_id", NULL FROM "bill";
DROP TABLE "bill";
ALTER TABLE "new__bill" RENAME TO "bill";
CREATE INDEX "bill_branch_id_c598ebcb" ON "bill" ("branch_id");
CREATE INDEX "bill_client_id_810bbcca" ON "bill" ("client_id");
--
-- Add field employee to bill
--
CREATE TABLE "new__bill" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "payment_method" varchar(2) NOT NULL, "branch_id" bigint NOT NULL REFERENCES "branch" ("id") DEFERRABLE INITIALLY DEFERRED, "client_id" bigint NOT NULL REFERENCES "client" ("id") DEFERRABLE INITIALLY DEFERRED, "employee_id" bigint NOT NULL REFERENCES "employee" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__bill" ("id", "payment_method", "branch_id", "client_id", "employee_id") SELECT "id", "payment_method", "branch_id", "client_id", NULL FROM "bill";
DROP TABLE "bill";
ALTER TABLE "new__bill" RENAME TO "bill";
CREATE INDEX "bill_branch_id_c598ebcb" ON "bill" ("branch_id");
CREATE INDEX "bill_client_id_810bbcca" ON "bill" ("client_id");
CREATE INDEX "bill_employee_id_d9e65186" ON "bill" ("employee_id");
COMMIT;
