CREATE SEQUENCE id_sequence
INCREMENT BY 1
START WITH 1
NOCYCLE;

CREATE TABLE SAMPLE(
	NUM NUMBER PRIMARY KEY, 
	NAME VARCHAR2(20));

INSERT INTO SAMPLE VALUES(id_sequence.nextval, 'IRIN');
INSERT INTO SAMPLE VALUES(id_sequence.nextval, 'YEZI');
INSERT INTO SAMPLE VALUES(id_sequence.nextval, 'SUZI');
INSERT INTO SAMPLE VALUES(id_sequence.nextval, 'JENNIE');

SELECT * FROM SAMPLE;

COMMIT;

CREATE TABLE FILESAMPLE(
	NUM NUMBER(10) PRIMARY KEY, 
	FILENAME VARCHAR2(50) NOT NULL, 
	FILECONTENT BLOB NOT NULL,
	UPLOADDATE DATE);

SELECT * 
FROM FILESAMPLE;

DROP SEQUENCE id_sequence;

CREATE SEQUENCE id_sequence INCREMENT BY 1 START WITH 1 NOCYCLE;

CREATE TABLE PROCSAMPLE(
NUM NUMBER(10) PRIMARY KEY,
MESSAGE VARCHAR2(200),
WRITEDATE DATE);

CREATE OR REPLACE PROCEDURE MyProc
(P_MESSAGE IN PROCSAMPLE.MESSAGE%TYPE)
   IS
   BEGIN
           INSERT INTO PROCSAMPLE
           VALUES(id_sequence.nextval,P_MESSAGE, SYSDATE);
   END;
/

SELECT *
FROM PROCSAMPLE;


create table Goods (
    code     char(5) not null, 
    name    varchar2(50) not null, 
    manufacture   varchar2(20), 
    price    number(10) not null, 
    primary key(code)
);

insert into Goods values('001', 'apple', 'korea', 1500);
insert into Goods values('002', 'watermelon', 'korea', 15000);
insert into Goods values('003', 'oriental melon', 'korea', 1000);
insert into Goods values('004', 'banana', 'philippines', 500);
insert into Goods values('005', 'lemon', 'korea', 1500);
insert into Goods values('006', 'mango', 'taiwan', 700);

commit;

select * from Goods;
