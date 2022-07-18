CREATE TABLE tbl_custom (
custom_id varchar2(20) PRIMARY key, -- 기본키로 설정하세요.
name nvarchar2(20) not null,
email varchar2(20),
age number(3),
reg_date date DEFAULT sysdate -- 기본값 설정입니다.
);

-- 상품 테이블 : 카테고리 예시 A1:전자제품, B1:식품
CREATE TABLE tbl_product(
pcode varchar2(20) PRIMARY key, -- 기본키로 설정하세요.
category char(2) not null,
pname nvarchar2(20) not null,
price number(9) not null
);

-- 구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
CREATE TABLE tbl_buy(
custom_id varchar2(20) not null,
pcode varchar2(20) not null,
quantity number(5) not null, --수량
		buy_date DATE DEFAULT sysdate
		);
	
	INSERT INTO TBL_CUSTOM 
	VALUES ('mina012','김미나','kimm@gmail.com',to_date(11,2021-19-21 00:00:00.000));
--	VALUES ('hongGD','홍길동','gil@korea.com',32,2021-10-21 00:00:00.000);
--	VALUES ('twice','박모모','momo@daum.net',29,2021-12-25 00:00:00.000);
--	VALUES ('wonder','이나나','lee@naver.com',40,2022-03-10 14:23:25.000);
--
--	INSERT INTO TBL_PRODUCT 
--	VALUES ('IPAD011' , 'A1' , '아이패드10' , 880000);
--	VALUES ('DOWON123a' , 'B1' , '동원참치선물세트', 54000);
--	VALUES ('dk_143','A2','모션데스크',234500);
