
  CREATE TABLE "ECEN_KQ"."SYS_USER" 
   (	"SU_USER_ID" VARCHAR2(40 CHAR) NOT NULL ENABLE, 
	"SYS_CREATE_DATE" DATE, 
	"SYS_CREATE_BY" VARCHAR2(50 CHAR), 
	"SYS_ENABLE_FLAG" NUMBER(1,0), 
	"SYS_KEYWORDS" VARCHAR2(50 CHAR), 
	"SYS_SORT_NUM" FLOAT(126), 
	"SYS_UPDATE_DATE" DATE, 
	"SYS_UPDATE_BY" VARCHAR2(50 CHAR), 
	"SU_BUSINESS_RELATED_FLAG" NUMBER(1,0), 
	"SU_DEPT_NAME" VARCHAR2(100 CHAR), 
	"SU_MAIL" VARCHAR2(30 CHAR), 
	"SU_NICKNAME_CODE" VARCHAR2(50 CHAR), 
	"SU_NICKNAME_DISPLAY" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"SU_PASSWORD" VARCHAR2(32 CHAR), 
	"SU_PHONE_NUM" VARCHAR2(30 CHAR), 
	"SU_USERNAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"SU_USER_NO" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"SU_USER_TYPE" VARCHAR2(50 CHAR), 
	"SU_WORK_NUM" VARCHAR2(30 CHAR), 
	"SU_DEPT_ID" VARCHAR2(32 CHAR), 
	"SU_DESCRIPTION" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 3145728 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 



  CREATE TABLE "ECEN_KQ"."SYS_DEPT" 
   (	"SD_DEPT_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SYS_CREATE_DATE" DATE, 
	"SYS_CREATE_BY" VARCHAR2(50 CHAR), 
	"SYS_ENABLE_FLAG" NUMBER(1,0), 
	"SYS_KEYWORDS" VARCHAR2(50 CHAR), 
	"SYS_SORT_NUM" FLOAT(126), 
	"SYS_UPDATE_DATE" DATE, 
	"SYS_UPDATE_BY" VARCHAR2(50 CHAR), 
	"SD_BUSINESS_RELATED_FLAG" NUMBER(1,0), 
	"SD_DEPT_CODE" VARCHAR2(100 CHAR), 
	"SD_DEPT_NAME" VARCHAR2(100 CHAR), 
	"SD_DESCRIPTION" VARCHAR2(255 CHAR), 
	"SD_LEADER_NAME_TO_POST" VARCHAR2(100 CHAR), 
	"SD_LEADER_NAME_TO_USER" VARCHAR2(100 CHAR), 
	"SD_PARENT_DEPT_NAME" VARCHAR2(100 CHAR), 
	"SD_PARENT_LEADER_NAME_TO_POST" VARCHAR2(100 CHAR), 
	"SD_PARENT_LEADER_NAME_TO_USER" VARCHAR2(100 CHAR), 
	"SD_PORTAL_NAME" VARCHAR2(255 CHAR), 
	"SD_PORTAL_URL" VARCHAR2(255 CHAR), 
	"SD_PARENT_DEPT_ID" VARCHAR2(32 CHAR), 
	"SD_LEADER_ID_TO_POST" VARCHAR2(32 CHAR), 
	"SD_PARENT_LEADER_ID_TO_POST" VARCHAR2(32 CHAR), 
	"SD_LEADER_ID_TO_USER" VARCHAR2(32 CHAR), 
	"SD_PARENT_LEADER_ID_TO_USER" VARCHAR2(32 CHAR), 
	"OA_DEPT_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

