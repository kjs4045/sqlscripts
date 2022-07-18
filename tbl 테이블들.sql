CREATE TABLE tbl_custom (
custom_id varchar2(20) PRIMARY key, -- �⺻Ű�� �����ϼ���.
name nvarchar2(20) not null,
email varchar2(20),
age number(3),
reg_date date DEFAULT sysdate -- �⺻�� �����Դϴ�.
);

-- ��ǰ ���̺� : ī�װ� ���� A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product(
pcode varchar2(20) PRIMARY key, -- �⺻Ű�� �����ϼ���.
category char(2) not null,
pname nvarchar2(20) not null,
price number(9) not null
);

-- ���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE tbl_buy(
custom_id varchar2(20) not null,
pcode varchar2(20) not null,
quantity number(5) not null, --����
		buy_date DATE DEFAULT sysdate
		);
	
	INSERT INTO TBL_CUSTOM 
	VALUES ('mina012','��̳�','kimm@gmail.com',to_date(11,2021-19-21 00:00:00.000));
--	VALUES ('hongGD','ȫ�浿','gil@korea.com',32,2021-10-21 00:00:00.000);
--	VALUES ('twice','�ڸ��','momo@daum.net',29,2021-12-25 00:00:00.000);
--	VALUES ('wonder','�̳���','lee@naver.com',40,2022-03-10 14:23:25.000);
--
--	INSERT INTO TBL_PRODUCT 
--	VALUES ('IPAD011' , 'A1' , '�����е�10' , 880000);
--	VALUES ('DOWON123a' , 'B1' , '������ġ������Ʈ', 54000);
--	VALUES ('dk_143','A2','��ǵ���ũ',234500);
