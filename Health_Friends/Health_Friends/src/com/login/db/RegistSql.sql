
DROP SEQUENCE MEMBERNOSEQ;
DROP TABLE MEMBER;

CREATE SEQUENCE MEMBERNOSEQ;

CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	MEMBER_PW VARCHAR2(500) NOT NULL,
	MEMBER_NAME VARCHAR2(100) NOT NULL,
	MEMBER_ADDR VARCHAR2(500),
	MEMBER_BIRTHDAY VARCHAR2(10),
	MEMBER_GENDER VARCHAR2(2) CHECK(MEMBER_GENDER IN('F', 'M')) NOT NULL,
	MEMBER_EMAIL VARCHAR2(100) NOT NULL,
	MEMBER_PHONE VARCHAR2(100) NOT NULL,
	MEMBER_ENABLED VARCHAR2(2) CHECK(MEMBER_ENABLED IN('Y','N')),
	MEMBER_REVIEW NUMBER DEFAULT 0,
	MEMBER_ROLE VARCHAR2(20) DEFAULT 'USER'
);

INSERT INTO MEMBER
VALUES(MEMBERNOSEQ.NEXTVAL, 'manager', 'manager', '관리자', '서울 강남구 테헤란로 14길 6' , '20000101', 'F', 'system@member.com', '01000000000',
	   'Y', 0, 'MANAGER');

SELECT MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDR, MEMBER_BIRTHDAY, MEMBER_GENDER
	   , MEMBER_EMAIL, MEMBER_PHONE, MEMBER_ENABLED, MEMBER_REVIEW, MEMBER_ROLE
FROM MEMBER
ORDER BY MEMBER_NO;

SELECT * FROM MEMBER;

UPDATE MEMBER
SET MEMBER_PW = '6ee4a469cd4e91053847f5d3fcb61dbcc91e8f0ef10be7748da4c4a1ba382d17'
WHERE MEMBER_ID = 'manager';

UPDATE MEMBER
SET MEMBER_ENABLED = 'Y'
WHERE MEMBER_ID = 'user01';

