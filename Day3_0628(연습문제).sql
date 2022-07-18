CREATE TABLE stu (
 student_id char(7) PRIMARY key	, 
 student_name varchar2(12), 
 age char(2), 
 adress varchar2(12)
);
SELECT * FROM STU s 

INSERT INTO STU VALUES (2021001,'김모모',16,'서초구');
INSERT INTO STU VALUES (2019019,'강다현',18,'강남구');

CREATE TABLE record (
	student_id char(7) NOT null,
	class_name varchar2(10) NOT NULL,
	score nchar(3)	NOT NULL,
	class_teacher varchar2(9) NOT NULL,
	semester varchar2(7)	NOT null
);

INSERT INTO RECORD VALUES (2021001,'국어','89','이나연',20221);
INSERT INTO RECORD VALUES (2021001,'영어','78','김길동',20221);
INSERT INTO RECORD VALUES (2021001,'과학','67','박세리',20222);
INSERT INTO RECORD VALUES (2019019,'국어','92','이나연',20192);
INSERT INTO RECORD VALUES (2019019,'영어','85','박지성',20192);
INSERT INTO RECORD VALUES (2019019,'과학','88','박세리',20201);

SELECT * FROM "RECORD" r 