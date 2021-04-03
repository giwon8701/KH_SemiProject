UPDATE POST P, MEMBER M 
SET 
P.POST_TITLE = '타이틀수정',
P.POST_CONTENT = '내용수정'
WHERE P.POST_ID = 33
AND P.POST_USER_NO = M.MEMBER_NO;

UPDATE POST SET 
			POST_USER_NO = 1,
			POST_TITLE = 'sql문으로 수정테스트',
			POST_CONTENT = '돼라',
			POST_REGDATE = SYSDATE
WHERE POST_ID = 8;

UPDATE POST 
POST_TITLE = '타이틀수정',
POST_CONTENT = "'내용수정',
POST_REGDATE = SYSDATE
WHERE POST_USER_NO = (SELECT MEMBER_NO FROM MEMBER WHERE );

SELECT P.POST_TITLE, P.POST_ID, POST_USER_NO
FROM POST P, MEMBER M 
WHERE P.POST_USER_NO = M.MEMBER_NO
AND POST_BOARD_NAME = 'NOTICE';


SELECT * FROM MEMBER;
SELECT * FROM POST;
SELECT * FROM COMMENT;
SELECT * FROM IMAGE;

SELECT * FROM ALL_CONSTRAINTS;

DROP SEQUENCE POST_SEQ;

SELECT * FROM USER_SEQUENCES;

INSERT INTO POST VALUES
(1, POST_ID_SEQ.NEXTVAL, POST_NOTICE_SEQ.NEXTVAL, 'NOTICE', NULL, 'TEST','TEST TEXT'
,null, SYSDATE,0,0,0,'N',0,0);

INSERT INTO POST VALUES
(1, POST_ID_SEQ.NEXTVAL, POST_NOTICE_SEQ.NEXTVAL, 'NOTICE', NULL, '포스트유저넘 = 멤버넘 같아야 수정','디비 어렵다'
,null, SYSDATE,0,0,0,'N',0,0);

SELECT POST_USER_NO, POST_ID, POST_NO,POST_BOARD_NAME,POST_CATEGORY_NAME,POST_TITLE,POST_CONTENT
,POST_MDATE,POST_REGDATE,POST_HIT,POST_COMMENT_HIT,POST_LIKE,POST_DELFLAG,POST_LATITUDE,POST_LONGITUDE
FROM POST
WHERE POST_BOARD_NAME = 'ACCOMPANY';





