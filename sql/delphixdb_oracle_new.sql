--------------------------------------------------------
--  File created - Tuesday-August-18-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "DELPHIXDB"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(38),
        "FIRST_NAME" VARCHAR2(50 BYTE), 
	"LAST_NAME" VARCHAR2(50 BYTE), 
	"DEPT_NAME" VARCHAR2(50 BYTE), 
	"CITY" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  ALTER TABLE "DELPHIXDB"."EMPLOYEES" ADD PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

--------------------------------------------------------
--  DDL for Table MEDICAL_RECORDS
--------------------------------------------------------

  CREATE TABLE "DELPHIXDB"."MEDICAL_RECORDS" 
   (	"PATIENT_ID" NUMBER(*,0), 
	"PHONE_NUMBER" VARCHAR2(30 BYTE), 
	"MEDICAL_RECORD_NUMBER" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE), 
	"ADDRESS" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PATIENT
--------------------------------------------------------

  CREATE TABLE "DELPHIXDB"."PATIENT" 
   (	"PATIENT_ID" NUMBER(*,0), 
	"FIRSTNAME" VARCHAR2(40 BYTE), 
	"LASTNAME" VARCHAR2(40 BYTE), 
	"SOCIAL_SECURITY_NUMBER" VARCHAR2(11 BYTE), 
	"ADDRESS" VARCHAR2(60 BYTE), 
	"CITY" VARCHAR2(15 BYTE), 
	"ZIPCODE" VARCHAR2(10 BYTE), 
	"DOB" DATE, 
	"PHONE_NUMBER" VARCHAR2(24 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PATIENT_DETAILS
--------------------------------------------------------

  CREATE TABLE "DELPHIXDB"."PATIENT_DETAILS" 
   (	"PATIENT_ID" NUMBER(*,0), 
	"PHONE_NUMBER" VARCHAR2(30 BYTE), 
	"MEDICAL_RECORD_NUMBER" VARCHAR2(30 BYTE), 
	"ACCOUNT_NUMBER" VARCHAR2(30 BYTE), 
	"CC_NUMBER" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into DELPHIXDB.EMPLOYEES
SET DEFINE OFF;
-- delete from employees;	
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (1,'Woody','Evans','Solution Architects','Hoboken');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (2,'Jeff','Zeisler','Solution Architects','Menlo Park');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (3,'Dr. Jeff','Wootton','Lyrical Rap Studies','Reston');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (4,'Dino','Konstantinos','Sales','Fantasyland');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (5,'Ted','Girard','Sales','Bethesda');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (6,'Adam','Bowen','No Sleep Till','Brooklyn');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (7,'Adam','Bowen','Solution Architects','Ashland');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (8,'Luther','Vandross','Superstar','NYC');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (9,'Ted','Girard','Sales','Bethesda');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (10,'Jude','Seth','Solution Architects','DK');
Insert into DELPHIXDB.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPT_NAME,CITY) values (11,'Darth','Vader','Imperial Army','Death Star');
REM INSERTING into DELPHIXDB.MEDICAL_RECORDS
SET DEFINE OFF;
Insert into DELPHIXDB.MEDICAL_RECORDS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,EMAIL,ADDRESS) values (1,'803-345-6789','4483838','raygun@aol.com','40 Presidential Dr');
Insert into DELPHIXDB.MEDICAL_RECORDS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,EMAIL,ADDRESS) values (2,'415-345-6789','5483838','bush@aol.com','2943 SMU Blvd');
Insert into DELPHIXDB.MEDICAL_RECORDS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,EMAIL,ADDRESS) values (3,'650-456-0987','6483838','obama@aol.com','1600 Pennsylvania Ave');
Insert into DELPHIXDB.MEDICAL_RECORDS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,EMAIL,ADDRESS) values (4,'123-321-9990','7483838','abe@hotmail.com','112 N 6th St');
Insert into DELPHIXDB.MEDICAL_RECORDS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,EMAIL,ADDRESS) values (5,'440-345-2345','8483838','Jeff@whitehouse.gov','7415 Arlington Blvd');
REM INSERTING into DELPHIXDB.PATIENT
SET DEFINE OFF;
Insert into DELPHIXDB.PATIENT (PATIENT_ID,FIRSTNAME,LASTNAME,SOCIAL_SECURITY_NUMBER,ADDRESS,CITY,ZIPCODE,DOB,PHONE_NUMBER,EMAIL) values (1,'Ronald','Reagan','474-78-1234','40 Presidential Dr','Simi Valley','93065-0987',null,'803-345-6789','raygun@aol.com');
Insert into DELPHIXDB.PATIENT (PATIENT_ID,FIRSTNAME,LASTNAME,SOCIAL_SECURITY_NUMBER,ADDRESS,CITY,ZIPCODE,DOB,PHONE_NUMBER,EMAIL) values (2,'George','Bush','111-67-4321','2943 SMU Blvd','Dallas','75205-7367',null,'415-345-6789','bush@aol.com');
Insert into DELPHIXDB.PATIENT (PATIENT_ID,FIRSTNAME,LASTNAME,SOCIAL_SECURITY_NUMBER,ADDRESS,CITY,ZIPCODE,DOB,PHONE_NUMBER,EMAIL) values (3,'Barack','Obama','650-12-5432','1600 Pennsylvania Ave','Washington DC','20500-6353',null,'650-456-0987','obama@aol.com');
Insert into DELPHIXDB.PATIENT (PATIENT_ID,FIRSTNAME,LASTNAME,SOCIAL_SECURITY_NUMBER,ADDRESS,CITY,ZIPCODE,DOB,PHONE_NUMBER,EMAIL) values (4,'Abraham','Lincoln','673-11-3479','112 N 6th St','Springfield','62701-6363',null,'123-321-9990','abe@hotmail.com');
Insert into DELPHIXDB.PATIENT (PATIENT_ID,FIRSTNAME,LASTNAME,SOCIAL_SECURITY_NUMBER,ADDRESS,CITY,ZIPCODE,DOB,PHONE_NUMBER,EMAIL) values (5,'Thomas','Jefferson','123-68-8765','7415 Arlington Blvd','Falls Church','22042-4242',null,'440-345-2345','Jeff@whitehouse.gov');
REM INSERTING into DELPHIXDB.PATIENT_DETAILS
SET DEFINE OFF;
Insert into DELPHIXDB.PATIENT_DETAILS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,ACCOUNT_NUMBER,CC_NUMBER) values (1,'803-345-6789','3338383','4483838','4283897623459088');
Insert into DELPHIXDB.PATIENT_DETAILS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,ACCOUNT_NUMBER,CC_NUMBER) values (2,'415-345-6789','7338383','5483838','5683897623459088');
Insert into DELPHIXDB.PATIENT_DETAILS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,ACCOUNT_NUMBER,CC_NUMBER) values (3,'650-456-0987','8338383','6483838','3783897623459088');
Insert into DELPHIXDB.PATIENT_DETAILS (PATIENT_ID,PHONE_NUMBER,MEDICAL_RECORD_NUMBER,ACCOUNT_NUMBER,CC_NUMBER) values (4,'123-321-9990','2338383','7483838','4283897623459088');
--------------------------------------------------------
--  DDL for Index PATIENT_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "DELPHIXDB"."PATIENT_IDX" ON "DELPHIXDB"."PATIENT" ("PATIENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PATIENT_DET_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "DELPHIXDB"."PATIENT_DET_IDX" ON "DELPHIXDB"."PATIENT_DETAILS" ("PATIENT_ID", "PHONE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEDICAL_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "DELPHIXDB"."MEDICAL_IDX" ON "DELPHIXDB"."MEDICAL_RECORDS" ("PATIENT_ID", "PHONE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table MEDICAL_RECORDS
--------------------------------------------------------

  ALTER TABLE "DELPHIXDB"."MEDICAL_RECORDS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "DELPHIXDB"."MEDICAL_RECORDS" ADD PRIMARY KEY ("PATIENT_ID", "PHONE_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PATIENT_DETAILS
--------------------------------------------------------

  ALTER TABLE "DELPHIXDB"."PATIENT_DETAILS" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "DELPHIXDB"."PATIENT_DETAILS" ADD PRIMARY KEY ("PATIENT_ID", "PHONE_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PATIENT
--------------------------------------------------------

  ALTER TABLE "DELPHIXDB"."PATIENT" MODIFY ("PATIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "DELPHIXDB"."PATIENT" ADD PRIMARY KEY ("PATIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  DDL for Synonymn X$KCCFE
--------------------------------------------------------
--
-- Only Required for Delphix Engine Source Database User ...
--
-- CREATE OR REPLACE SYNONYM "DELPHIXDB"."X$KCCFE" FOR "SYS"."V_X$KCCFE";
--

