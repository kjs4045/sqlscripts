CREATE TABLE stu (
 student_id char(7) PRIMARY key	, 
 student_name varchar2(12), 
 age char(2), 
 adress varchar2(12)
);
SELECT * FROM STU s 

INSERT INTO STU VALUES (2021001,'����',16,'���ʱ�');
INSERT INTO STU VALUES (2019019,'������',18,'������');

CREATE TABLE record (
	student_id char(7) NOT null,
	class_name varchar2(10) NOT NULL,
	score nchar(3)	NOT NULL,
	class_teacher varchar2(9) NOT NULL,
	semester varchar2(7)	NOT null
);

INSERT INTO RECORD VALUES (2021001,'����','89','�̳���',20221);
INSERT INTO RECORD VALUES (2021001,'����','78','��浿',20221);
INSERT INTO RECORD VALUES (2021001,'����','67','�ڼ���',20222);
INSERT INTO RECORD VALUES (2019019,'����','92','�̳���',20192);
INSERT INTO RECORD VALUES (2019019,'����','85','������',20192);
INSERT INTO RECORD VALUES (2019019,'����','88','�ڼ���',20201);

SELECT * FROM "RECORD" r 