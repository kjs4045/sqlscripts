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

insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'이세종','jong@daum.net','010-2354-67773','2345');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'최행운','lucky@korea.com','010-5467-8792','9876');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
insert into book_member (mex_idx,name,email,tel,password) values (member_seq.nextval,'강감찬','haha@korea.net','010-3987-9087','1234');

insert into tbl_book values ('A1101','코스모스','킬세이건','사이언스북스','2016-12-01');
insert into tbl_book values ('B1101','해커스토익','이해커','해커스랩','2018-07-10');
insert into tbl_book values ('C1101','푸른사자 와니니','이현','창비','2015-06-20');
insert into tbl_book values ('A1102','페스트','알베르트 까뮈','민음사','2011-03-01');

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
--도서추가합니다
insert into tbl_book values('b1102','스트라이크 던지기','박철순','KBO','2020-11-10');

--반납된 도서의 열체일수를 계산 delay_days 컬럼값을 update합니다.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETUNR_DATE -EXP_DATE 
WHERE RETUNR_DATE IS NOT NULL;
SELECT * FROM TBL_BOOKRENT tb ;
--대출중인 도서의 연체일수 계산해서 회원 idx, 도서코드 , 연체일수 조회하기
--대출중인것 확인하는 처리조건:return_date 가 null 이면 대여중 ,null이 아니면 반납된 도서.
SELECT mex_idx, bcode, to_date(TO_CHAR(SYSDATE, 'yyyy-MM-dd'))-exp_date 
FROM TBL_BOOKRENT tb WHERE RETUNR_DATE IS NULL;

--현재 연체중인 회원의 이름 , 전화번호 검색합니다 , 오늘 날짜systdate 기준으로 확인
SELECT *  FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEX_IDX = tb.MEX_IDX AND SYSDATE > exp_date AND retunr_date IS NULL; 


--현재 대출중인 도서의 도서명코드와 도서명 검색합니다.
SELECT * FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND retunr_date IS NULL;

--현재 도서를 대여한 회원의 idx와 이름을 검색합니다.
SELECT bm.MEX_IDX , name FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEX_IDX =tb.MEX_IDX AND retunr_date IS NULL;

--대출중인 도서의 회원이름,도서명, 반납기한 검색합니다.
SELECT bm.name, tb.title, tb2.exp_date
FROM BOOK_MEMBER bm ,TBL_BOOK tb ,TBL_BOOKRENT tb2 
WHERE bm.MEX_IDX =tb2.MEX_IDX AND tb.BCODE =tb2.BCODE 
AND tb2.RETUNR_DATE IS NULL;

--또는
SELECT name, title, exp_date FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2  ON tb2.BCODE = tb.BCODE 
JOIN BOOK_MEMBER bm ON tb.MEX_IDX  = bm.MEX_IDX 
WHERE RETUNR_DATE IS NULL ;

-- 9) 회원  IDX '10002'는 도서 대출이 가능한지 프로시저를 작성합니다.

DECLARE
	vcnt NUMBER;

BEGIN
SELECT COUNT(*) INTO vcnt 
FROM TBL_BOOKRENT tb 
	WHERE MEX_IDX  = 10001 AND RETUNR_DATE IS NULL;  --vcnt가 0일대만 대여가능
if(vcnt = 0 ) THEN
	DBMS_OUTPUT.put_line('책 대여 가능합니다.');
ELSE 
DBMS_OUTPUT.put_line('대여중인 책을 반납해야 가능합니다.');
END IF;

END;

-- 10)도서명에 '페스트'  도서 대출이 가능한지 프로시저를 작성합니다.

CREATE OR REPLACE PROCEDURE CHECK_MEMBER(
		arg_mem IN book_member.MEX_IDX%TYPE,
		isOK OUT varchar2

)
IS


vcnt NUMBER;

BEGIN
SELECT COUNT(*) INTO vcnt 
FROM TBL_BOOKRENT tb 
	WHERE MEX_IDX  =  AND RETUNR_DATE IS NULL;  --vcnt가 0일대만 대여가능
if(vcnt = 0 ) THEN
	DBMS_OUTPUT.put_line('책 대여 가능합니다.');
	isOK := '가능';
ELSE 
DBMS_OUTPUT.put_line('대여중인 책을 반납해야 가능합니다.');
	isOK := '불가능';
END IF;

END;

DECLARE
	vresult varchar2(20);
BEGIN
	check_member(10003,vresult);
	DMBS_OUTPUT.put_line('결과 : ' || vresult);
END;
-----------------------------------------------

DECLARE 
	v_bcode varchar2(20);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE  INTO v_bcode		--V_BCODE는 '10001'
	FROM TBL_BOOK tb WHERE title LIKE '%스트%';
	SELECT COUNT(*) INTO V_CNT
	FROM TBL_BOOKRENT tb2 
	WHERE BCODE = v_bcode AND retunr_date IS NULL;
	IF(v_cnt = 0) THEN
		DBMS_OUTPUT.put_line('책 대여 가능합니다.');
ELSE 
DBMS_OUTPUT.put_line('대여중인 책을 반납해야 가능합니다.');
END IF;

	
END;


-- 11)9과 10을 이용해서 insert 를 하는 프로시저를 작성합니다.
