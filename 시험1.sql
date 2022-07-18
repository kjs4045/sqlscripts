create table tbl_bookrent(
rent_no number(5) primary key,
mem_idx number(5) not null,
bcode char(5) not null,
rent_date date not null,
exp_date date not null,
return_date date,
delay_days number(3)
);

create table book_member(
mem_idx number(5,0) primary key,
name varchar2(20) not null,
email varchar2(20) not null,
tel varchar2(20),
password varchar2(10)
);

CREATE TABLE tbl_book(
bcode char(5) PRIMARY KEY,
title varchar2(30) NOT NULL,
writer varchar2(20),
publisher varchar2(20),
pdate DATE
);

alter table book_member add unique (mem_idx,bcode);

create sequence member_seq start with 10001;

create sequence bookrent_seq;

insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'이세종','jong@daum.net','010-2354-67773','2345');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'최행운','lucky@korea.com','010-5467-8792','9876');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'강감찬','haha@korea.net','010-3987-9087','1234');

insert into tbl_book values ('A1101','코스모스','킬세이건','사이언스북스','2016-12-01 ');
insert into tbl_book values ('B1101','해커스토익','이해커','해커스랩','2018-07-10');
insert into tbl_book values ('C1101','푸른사자 와니니','이현','창비','2015-06-20');
insert into tbl_book values ('A1102','페스트','알베르트 까뮈','민음사','2011-03-01');

SELECT * FROM TBL_BOOK

insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10003,'A1102','2021-10-04','2021-10-18');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10004,'C1101','2021-10-02','2021-10-16');

insert into tbl_book values('b1102','스트라이크 던지기','박철순','KBO','2020-11-10');




--참고하기 : '대여' 기본적인 동작은 대여날짜는 오늘. 반납기한은 오늘+14를 기본값으로 할 수 있도록 합니다.
--ALTER TABLE "C##IDEV".TBL_BOOKRENT  MODIFY RENT.DATE DATE DEFAULT sysdate;
--ALTER TABLE "C##IDEV".TBL_BOOKRENT  MODIFY EXP.DATE DATE DEFAULT sysdate+14;	
--INSERT INTO TBL_BOOKRENT (rent_no,mem_idx,bcode)
--values(bookrent_seq.nextval,10002,'A1102');

--컬럼 디폴트 값 없애고 싶을때
--ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DATE DEFUALT NULL;
