DROP SEQUENCE PAYMENTSEQ;
DROP TABLE PAYMENT;

CREATE SEQUENCE PAYMENTSEQ;

CREATE TABLE PAYMENT(
	PAYMENT_NO NUMBER PRIMARY KEY,
	MEMBER_EMAIL VARCHAR2(50) NOT NULL,
	PAYMENT_ACCOUNT NUMBER NOT NULL,
	PAYMENT_DATE DATE NOT NULL,
	FOREIGN KEY(MEMBER_EMAIL) REFERENCES MEMBER(MEMBER_EMAIL)
);

CREATE TABLE PAYMENT(
	PAYMENT_NO NUMBER PRIMARY KEY,
	MEMBER_EMAIL VARCHAR2(50) NOT NULL,
	PAYMENT_ACCOUNT NUMBER NOT NULL,
	PAYMENT_DATE DATE NOT NULL
);


INSERT INTO PAYMENT
VALUES(PAYMENTSEQ.NEXTVAL, 'kwg940930@naver.com', 7900, SYSDATE);

INSERT INTO PAYMENT
VALUES(PAYMENTSEQ.NEXTVAL, 'qweqwe@qweqwe.com', 7900, SYSDATE);