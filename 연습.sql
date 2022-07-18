create table tbl_bookrent(
rent_no number(5) primary key,
mex_idx number(5) not null,
bcode char(5) not null,
rent_date date not null,
exp_date date not null,
retunr_date date,
delay_days number(3)
);

create table book_member(
mex_idx number(5,0) primary key,
name varchar2(20) not null,
email varchar2(20) not null,
tel varchar2(20),
password varchar2(10)
);

create table tbl_book(
bcode char(5) primary key,
title varchar2(30) not null,
writer varchar2(20),
publisher varchar2(20),
pdate date
);

create sequence member_seq start with 10001;

create sequence bookrent_seq;

insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'���ϴ�','honey@naver.com','010-9889-0567','1122');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'�̼���','jong@daum.net','010-2354-67773','2345');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'�����','lucky@korea.com','010-5467-8792','9876');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'���浿','nadong@kkk.net','010-3456-8765','3456');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'������','haha@korea.net','010-3987-9087','1234');

insert into tbl_book values ('A1101','�ڽ���','ų���̰�','���̾𽺺Ͻ�','2016-12-01');
insert into tbl_book values ('B1101','��Ŀ������','����Ŀ','��Ŀ����','2018-07-10');
insert into tbl_book values ('C1101','Ǫ������ �ʹϴ�','����','â��','2015-06-20');
insert into tbl_book values ('A1102','�佺Ʈ','�˺���Ʈ �','������','2011-03-01');

SELECT * FROM TBL_BOOK

insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date,retunr_date)
values(bookrent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date,retunr_date)
values(bookrent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10003,'A1102','2021-10-04','2021-10-18');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date,retunr_date)
values(bookrent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
insert into tbl_bookrent (rent_no,MEX_IDX,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10004,'C1101','2021-10-02','2021-10-16');
--�����߰��մϴ�
insert into tbl_book values('b1102','��Ʈ����ũ ������','��ö��','KBO','2020-11-10');

--�ݳ��� ������ ��ü�ϼ��� ��� delay_days �÷����� update�մϴ�.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETUNR_DATE -EXP_DATE 
WHERE RETUNR_DATE IS NOT NULL;
SELECT * FROM TBL_BOOKRENT tb ;
--�������� ������ ��ü�ϼ� ����ؼ� ȸ�� idx, �����ڵ� , ��ü�ϼ� ��ȸ�ϱ�
--�������ΰ� Ȯ���ϴ� ó������:return_date �� null �̸� �뿩�� ,null�� �ƴϸ� �ݳ��� ����.
SELECT mex_idx, bcode, to_date(TO_CHAR(SYSDATE, 'yyyy-MM-dd'))-exp_date 
FROM TBL_BOOKRENT tb WHERE RETUNR_DATE IS NULL;

--���� ��ü���� ȸ���� �̸� , ��ȭ��ȣ �˻��մϴ� , ���� ��¥systdate �������� Ȯ��
SELECT *  FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEX_IDX = tb.MEX_IDX AND SYSDATE > exp_date AND retunr_date IS NULL; 


--���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND retunr_date IS NULL;

--���� ������ �뿩�� ȸ���� idx�� �̸��� �˻��մϴ�.
SELECT bm.MEX_IDX , name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEX_IDX =tb.MEX_IDX AND retunr_date IS NULL;

--�������� ������ ȸ���̸�,������, �ݳ����� �˻��մϴ�.
SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm ,TBL_BOOK tb ,TBL_BOOKRENT tb2 
WHERE bm.MEX_IDX =tb2.MEX_IDX AND tb.BCODE =tb2.BCODE 
AND tb2.RETUNR_DATE IS NULL;

--�Ǵ�
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2  ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEX_IDX  = bm.MEX_IDX 
WHERE RETUNR_DATE IS NULL ;

-- 9) ȸ��  IDX '10002'�� ���� ������ �������� ���ν����� �ۼ��մϴ�.

DECLARE
	vcnt NUMBER;

BEGIN
SELECT COUNT(*) INTO vcnt 
FROM TBL_BOOKRENT tb 
	WHERE MEX_IDX  = 10001 AND RETUNR_DATE IS NULL;  --vcnt�� 0�ϴ븸 �뿩����
if(vcnt = 0 ) THEN
	DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
ELSE 
DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� �����մϴ�.');
END IF;

END;

-- 10)������ '�佺Ʈ'  ���� ������ �������� ���ν����� �ۼ��մϴ�.

CREATE OR REPLACE PROCEDURE CHECK_MEMBER(
		arg_mem IN book_member.MEX_IDX%TYPE,
		isOK OUT varchar2

)
IS


vcnt NUMBER;

BEGIN
SELECT COUNT(*) INTO vcnt 
FROM TBL_BOOKRENT tb 
	WHERE MEX_IDX  =  AND RETUNR_DATE IS NULL;  --vcnt�� 0�ϴ븸 �뿩����
if(vcnt = 0 ) THEN
	DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
	isOK := '����';
ELSE 
DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� �����մϴ�.');
	isOK := '�Ұ���';
END IF;

END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_member(10003,vresult);
	DMBS_OUTPUT.put_line('��� : ' || vresult);
END;
-----------------------------------------------

DECLARE 
	v_bcode varchar2(20);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE  INTO v_bcode		--V_BCODE�� '10001'
	FROM TBL_BOOK tb WHERE title LIKE '%��Ʈ%';
	SELECT COUNT(*) INTO V_CNT
	FROM TBL_BOOKRENT tb2 
	WHERE BCODE = v_bcode AND retunr_date IS NULL;
	IF(v_cnt = 0) THEN
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
ELSE 
DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� �����մϴ�.');
END IF;

	
END;


-- 11)9�� 10�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.
