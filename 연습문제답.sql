CREATE TABLE stu0 (
 student_id char(7) PRIMARY key,
 student_name nvarchar2(20) NOT null, 
 age number(3) CHECK (age BETWEEN 10 AND 30), 
 adress nvarchar2(50)
);
SELECT * FROM STU s 

INSERT INTO STU0(student_id,STUDENT_NAME,AGE,ADRESS) 
VALUES (2021001,'����',16,'���ʱ�
');
INSERT INTO STU0(student_id,STUDENT_NAME,AGE,ADRESS)
VALUES (2019019,'������',18,'������');

CREATE TABLE record0 (
	student_id char(7) NOT null,
	class_name nvarchar2(20) NOT null,
	score number(3)	NOT NULL,
	class_teacher nvarchar2(20) NOT NULL,
	semester varchar2(6)	NOT NULL,
	PRIMARY KEY (student_id,class_name),
	FOREIGN KEY (student_id) REFERENCES stu0(student_id)
	);

ALTER TABLE RECORD0 
	ADD CONSTRAINT pk_record PRIMARY KEY (student_id,class_name);
ALTER TABLE RECORD0 
	ADD CONSTRAINT fk _record FOREIGN key(student_id)
	REFERENCES stu0(student_id);
	--���� �÷��� �ܷ�Ű �÷��� ��� �̸��� ������ (�����÷�student_id)��������.
	--�ܷ�Ű���� references(����) Ű���� �ڿ� �������̺�(�����÷�)
	--�ܷ�Ű �÷��� foreign key Ű���� �ڿ� ()�ȿ� �ۼ�.
	--�ۼ��غ�����. �����÷��� ������? �⺻Ű �Ǵ� unique �������� �÷��� �˴ϴ�.
INSERT INTO RECORD0 VALUES (2021001,'����','89','�̳���',20221);
INSERT INTO RECORD0 VALUES (2021001,'����','78','��浿',20221);
INSERT INTO RECORD0 VALUES (2021001,'����','67','�ڼ���',20222);
INSERT INTO RECORD0 VALUES (2019019,'����','92','�̳���',20192);
INSERT INTO RECORD0 VALUES (2019019,'����','85','������',20192);
INSERT INTO RECORD0 VALUES (2019019,'����','88','�ڼ���',20201);

SELECT * FROM "RECORD0"  


