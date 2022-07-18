CREATE TABLE stu0 (
 student_id char(7) PRIMARY key,
 student_name nvarchar2(20) NOT null, 
 age number(3) CHECK (age BETWEEN 10 AND 30), 
 adress nvarchar2(50)
);
SELECT * FROM STU s 

INSERT INTO STU0(student_id,STUDENT_NAME,AGE,ADRESS) 
VALUES (2021001,'김모모',16,'서초구
');
INSERT INTO STU0(student_id,STUDENT_NAME,AGE,ADRESS)
VALUES (2019019,'강다현',18,'강남구');

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
	--참조 컬럼과 외래키 컬럼이 모두 이름이 같으면 (참조컬럼student_id)생략가능.
	--외래키설정 references(참조) 키워드 뒤에 참조테이블(참조컬럼)
	--외래키 컬럼은 foreign key 키워드 뒤에 ()안에 작성.
	--작성해보세요. 참조컬럼의 조건은? 기본키 또는 unique 제약조건 컬럼만 됩니다.
INSERT INTO RECORD0 VALUES (2021001,'국어','89','이나연',20221);
INSERT INTO RECORD0 VALUES (2021001,'영어','78','김길동',20221);
INSERT INTO RECORD0 VALUES (2021001,'과학','67','박세리',20222);
INSERT INTO RECORD0 VALUES (2019019,'국어','92','이나연',20192);
INSERT INTO RECORD0 VALUES (2019019,'영어','85','박지성',20192);
INSERT INTO RECORD0 VALUES (2019019,'과학','88','박세리',20201);

SELECT * FROM "RECORD0"  


